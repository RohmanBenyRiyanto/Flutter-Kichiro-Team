import '../utils/importer.dart';

class FormPasswordController extends GetxController {
  RxBool isShow = true.obs;

  void showPassword() {
    isShow.value = !isShow.value;
  }
}
