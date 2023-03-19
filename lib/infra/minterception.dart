import 'dart:io';

import 'package:shelf/shelf.dart';

class MInterception {
  static Middleware get contentTypeJson => createMiddleware(
        responseHandler: (Response res) => res.change(
          headers: {'contentType': 'application/json', 'xpto': '123'},
        ),
      );
}
