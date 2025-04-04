import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/presentation/utils/extensions/context_ex.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:portfolio/presentation/utils/extensions/theme_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';

import '../../../utils/configs/constant_assets.dart';
import '../../../utils/configs/constant_color.dart';
import '../../../utils/configs/constant_sizes.dart';
import '../../../utils/configs/constants_strings.dart';
import '../../../widgets/animated_slide_box.dart';
import '../../../widgets/animated_text_slide_box_transition.dart';

class ProjectTitlePage extends StatefulWidget {
  const ProjectTitlePage({super.key});

  @override
  State<ProjectTitlePage> createState() => _ProjectTitlePageState();
}

class _ProjectTitlePageState extends State<ProjectTitlePage>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _stickController;

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(vsync: this, duration: duration2000)
      ..forward();
    _stickController = AnimationController(vsync: this, duration: duration2000)
      ..repeat();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _stickController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final svgSize = context.adaptive<double>(
        context.percentHeight(s20), context.percentHeight(s30));
    return <Widget>[
      SvgPicture.asset(
        kaComplexity,
        semanticsLabel: 'Complexity SVG',
        width: svgSize,
        height: svgSize,
      )
          .addPadding(
            edgeInsets: context.percentPadding(
              r: s5,
              t: s5,
            ),
          )
          .addAlign(alignment: Alignment.topRight),
      AnimatedTextSlideBoxTransition(
        controller: _titleController,
        text: ksBrowseProjects,
        coverColor: kPrimary,
        maxLines: 2,
        textAlign: TextAlign.center,
        textStyle: context.adaptive(
          Theme.of(context).textTheme.titleSmall,
          Theme.of(context).textTheme.headlineMedium,
        ),
      ).addAlign(alignment: Alignment.center),
      AnimatedSlideBox(
        controller: _stickController,
        height: context.percentHeight(s30),
        isVertical: true,
        coverColor: kPrimary,
        visibleBoxCurve: Curves.fastLinearToSlowEaseIn,
        width: s6,
      ).addAlign(alignment: Alignment.bottomCenter),
    ].addStack().addSizedBox(
          width: context.screenWidth,
          height: context.screenHeight - context.appBarTheme().toolbarHeight!,
        );
  }
}
