import '../utils/importer.dart';

class Validator {
  Validator();

  String? email(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Email tidak valid'.tr;
    } else {
      return null;
    }
  }

  String? password(String? value) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Password lebih dari 6 karakter'.tr;
    } else {
      return null;
    }
  }

  String? name(String? value) {
    String pattern = r'^.{3,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Nama lebih dari 3 karakter'.tr;
    } else {
      return null;
    }
  }

  String? username(String? value) {
    String pattern = r'^.{3,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Username lebih dari 3 karakter'.tr;
    } else {
      return null;
    }
  }

  String? number(String? value) {
    String pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.number'.tr;
    } else {
      return null;
    }
  }

  String? amount(String? value) {
    String pattern = r'^\d+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.amount'.tr;
    } else {
      return null;
    }
  }

  String? notEmpty(String? value) {
    String pattern = r'^\S+$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'validator.notEmpty'.tr;
    } else {
      return null;
    }
  }
}
