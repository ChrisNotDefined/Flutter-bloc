import 'dart:async';

import 'package:formvalidation/src/bloc/validator.dart';
import 'package:stream_transform/stream_transform.dart';

class LoginBloc with Validators {
  // Stream, objeto que a diferencia de un future, su valor se resuelve varias veces.
  final _emailController = StreamController<String>.broadcast();
  // Referencia al método de añadir un dato al flujo
  Function(String) get changeEmail => _emailController.sink.add;
  // escucha del email
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);

  final _passController = StreamController<String>.broadcast();

  Function(String) get changePassword => _passController.sink.add;

  Stream<String> get passStream =>
      _passController.stream.transform(validatePass);

  void dispose() {
    _emailController?.close();
    _passController?.close();
  }
}
