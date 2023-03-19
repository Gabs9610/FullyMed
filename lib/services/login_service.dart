import 'dart:developer';

import 'package:password_dart/password_dart.dart';

import '../to/auth_to.dart';
import 'usuario_service.dart';

class LoginService {
  final UsuarioService _usuarioService;
  LoginService(this._usuarioService);

  Future<int> authenticate(AuthTO to) async {
    try {
      var person = await _usuarioService.findByUser(to.user);
      if (person == null) return -1;
      return Password.verify(to.password, person.password!) ? person.id! : -1;
    } catch (e) {
      log('[ERROR] Usuário não encontrado');
    }
    return -1;
  }
}
