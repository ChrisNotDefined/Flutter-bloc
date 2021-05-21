import 'dart:async';

class Validators {
  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

      RegExp reqExp = new RegExp(pattern);
      if (reqExp.hasMatch(email)) {
        // Si el correo es valido se debe permitir fluir
        sink.add(email);
      } else {
        sink.addError('Email incorrecto');
      }
    },
  );

  final validatePass = StreamTransformer<String, String>.fromHandlers(
    handleData: (pass, sink) {
      if (pass.length >= 6) {
        sink.add(pass);
      } else {
        sink.addError('Password muy corto');
      }
    },
  );
}
