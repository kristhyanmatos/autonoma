import 'dart:developer';
import 'package:flutter/material.dart';

class Failure {
  final String message;

  Failure(
    this.message, {
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
  }) {
    if (stackTrace != null) {
      debugPrintStack(label: label, stackTrace: stackTrace);
    }
    log("Exception: ${exception.toString()}");
  }
}
