import 'dart:convert';

class AuthTO {
  final String user;
  final String password;

  AuthTO(this.user, this.password);

  factory AuthTO.fromRequest(String body) {
    var map = jsonDecode(body);
    return AuthTO(map['user'], map['password']);
  }
}
