import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';

import '../utils/configs/constant_sizes.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.onPressed,
    this.hasMenuTapped = false,
  }) : super(key: key);
  final VoidCallback onPressed;
  final bool hasMenuTapped;
  @override
  Widget build(BuildContext context) {
    double size = context.adaptive<double>(
      s30,
      s65,
      md: s40,
    );
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(s50),
        child: Image.asset(
          hasMenuTapped
              ? 'assets/images/introduction/circle_cross.png'
              : 'assets/images/introduction/triple_lines.png',
          height: 50,
          width: 50,
        ).addCenter().addContainer(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              width: size,
              height: size,
            ),
      ),
    );
  }
}
