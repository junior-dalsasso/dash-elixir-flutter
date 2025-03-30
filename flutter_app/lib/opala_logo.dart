import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OpalaLogo extends HookWidget {
  final double height;
  final double width;

  const OpalaLogo({super.key, this.height = 600, this.width = 600});

  @override
  Widget build(BuildContext context) {
    return Image.asset("images/opala_fundo.png", height: height, width: width, fit: BoxFit.contain);
  }
}
