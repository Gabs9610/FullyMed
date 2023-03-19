import 'package:shelf/shelf.dart';

import 'api/login_api.dart';
import 'api/usuario_api.dart';
import 'infra/dependecy_injector/injecs.dart';
import 'infra/minterception.dart';
import 'utils/custom_env.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

void main() async {
  CustomEnv.fromFile('.env');

  final _di = Injects.initialize();

  var cascadeHandler = Cascade()
      .add(_di<LoginApi>().getHandler())
      .add(_di<UsuarioApi>().getHandler())
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(MInterception.contentTypeJson)
      .addHandler(cascadeHandler);

  final server = await shelf_io.serve(handler, "localhost", 3000);
  print('Servidor inicializado -> http://localhost:3000');

  print('Tudo ok!');
  Future initialize;
}
