import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom != 0;
}

