import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:type_text/type_text.dart';

import '../../../utils/configs/constant_color.dart';
import '../../../utils/configs/constant_sizes.dart';
import '../../../utils/configs/constants_strings.dart';

class SpecializationText extends StatelessWidget {
  const SpecializationText({super.key});

  @override
  Widget build(BuildContext context) {
    return TypeText(
      ksSpecialization,
      style: context
          .adaptive(Theme.of(context).textTheme.bodyLarge,
              Theme.of(context).textTheme.titleSmall)
          ?.copyWith(
            fontWeight: FontWeight.w300,
            color: kBlack,
          ),
      textAlign: TextAlign.center,
      duration: duration2000,
    );
  }
}
