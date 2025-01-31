import 'dart:io';

enum AuthMode { Signup, Login }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  AuthMode _authMode = AuthMode.Login;
  File? image;

  bool get isLogin {
    return _authMode == AuthMode.Login;
  }

  bool get isSignup {
    return _authMode == AuthMode.Signup;
  }

  void toggleAuthMode() {
    if (_authMode == AuthMode.Login) {
      _authMode = AuthMode.Signup;
    } else {
      _authMode = AuthMode.Login;
    }
  }
}