import 'dart:math';

import 'package:client/layout/client_options.dart';
import 'package:flutter/material.dart';

double cappedTextScale(BuildContext context) {
  final double textScaleFactor = _textScaleFactor(context);
  return max(textScaleFactor, 1);
}

double reducedTextScale(BuildContext context) {
  final double textScaleFactor = _textScaleFactor(context);
  return textScaleFactor >= 1 ? (1 + textScaleFactor) / 2 : 1;
}

double _textScaleFactor(BuildContext context) {
  return ClientOptions.of(context)?.textScaleFactor(context) != null
      ? (ClientOptions.of(context)?.textScaleFactor(context))!
      : 0.0;
}
