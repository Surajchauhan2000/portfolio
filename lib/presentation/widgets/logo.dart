import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/presentation/utils/extensions/context_ex.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';

import '../utils/configs/constant_assets.dart';
import '../utils/configs/constant_sizes.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double size = context.adaptive<double>(
      s20,
      s80,
      md: s60,
    );
    return GestureDetector(
      onTap: onTap,
      child: Transform.scale(
        scaleX: -1,
        child: SvgPicture.asset(
          homeIconLogo,
          semanticsLabel: 'Logo SVG',
          width: size,
          height: size,
        ),
      ).addPadding(edgeInsets: context.padding(l: s10)),
    );
  }
}
