import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OpalaLogo extends HookWidget {
  final double height;
  const OpalaLogo({super.key, this.height = 300});

  @override
  Widget build(BuildContext context) {
    return Image.asset("images/opala_fundo.png", width: 600, height: 600, fit: BoxFit.contain);
  }
}
