class Validations {
  static bool isValidUser(String user) {
    return user.isNotEmpty;
  }

  static bool isValidPass(String pass) {
    return pass.isNotEmpty;
  }
}
