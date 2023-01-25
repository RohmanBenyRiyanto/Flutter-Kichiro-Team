import '../utils/importer.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();

  UserModel userModel = UserModel();

  @override
  void onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);

    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  handleAuthChanged(firebaseUser) async {
    firestoreUser.bindStream(streamFirestoreUser());
    if (firebaseUser == null) {
      if (kDebugMode) {
        print('Send to signin');
      }
      Get.offAllNamed(RouteNames.loginScreens);
    } else {
      if (kDebugMode) {
        print('Send to home');
      }

      Get.offAllNamed(RouteNames.mainScreens);
    }
  }

//Streams the firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    if (kDebugMode) {
      print('streamFirestoreUser()');
    }

    return _db
        .doc('/users/${firebaseUser.value!.uid}')
        .snapshots()
        .map((snapshot) => UserModel.fromJson(snapshot.data()!));
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    return _db.doc('/users/${firebaseUser.value!.uid}').get().then(
        (documentSnapshot) => UserModel.fromJson(documentSnapshot.data()!));
  }

  signInWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      emailController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.',
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user.',
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  registerEmailPassword(BuildContext context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then(
        (result) async {
          if (kDebugMode) {
            print('uID: ${result.user!.uid}');
          }
          if (kDebugMode) {
            print('email: ${result.user!.email}');
          }

          //sent email verification
          await result.user!.sendEmailVerification();

          Gravatar gravatar = Gravatar(emailController.text);
          String gravatarUrl = gravatar.imageUrl(
            size: 200,
            defaultImage: GravatarImage.retro,
            rating: GravatarRating.pg,
            fileExtension: true,
          );

          // Create a new user
          UserModel user = UserModel(
            uid: result.user!.uid,
            name: nameController.text,
            userName: usernameController.text,
            email: emailController.text,
            photoUrl: gravatarUrl,
            createdAt: Timestamp.now(),
            updatedAt: Timestamp.now(),
          );

          // Create the user in firestore collection
          _createUserFirestore(user, result.user!);
          nameController.clear();
          usernameController.clear();
          emailController.clear();
          passwordController.clear();
          confirmPasswordController.clear();
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Error',
          'The password provided is too weak.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error',
          'The account already exists for that email.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  //updates the firestore user in users collection
  void updateUserFirestore(UserModel user, User firebaseUser) {
    _db.doc('/users/${firebaseUser.uid}').update(user.toJson());
    update();
  }

  // Create the user in firestore collection
  void _createUserFirestore(UserModel user, User firebaseUser) {
    _db.doc('/users/${firebaseUser.uid}').set(user.toJson());
    update();
  }

  // Sign out
  Future<void> signOut() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    return _auth.signOut();
  }
}
