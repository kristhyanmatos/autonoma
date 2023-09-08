import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';

showMessage(String message) {
  Asuka.showSnackBar(SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: 'Fechar',
      onPressed: () {},
    ),
  ));
}
