import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/presentation/utils/extensions/context_ex.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/configs/constant_assets.dart';
import '../../../utils/configs/constant_color.dart';
import '../../../utils/configs/constant_sizes.dart';
import '../../../utils/configs/constants_strings.dart';
import '../../../widgets/animated_horizontal_stick.dart';
import '../../../widgets/animated_text_slide_box_transition.dart';

class Overall extends StatefulWidget {
  const Overall({super.key});

  @override
  State<Overall> createState() => _OverallState();
}

class _OverallState extends State<Overall> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _firstController;
  late AnimationController _secondController;
  late AnimationController _textController;
  late AnimationController _stickController;
  late AnimationController _waveController;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(vsync: this, duration: duration2000)
      ..addStatusListener(slideControllerListener);
    _firstController = AnimationController(vsync: this, duration: duration2000)
      ..addStatusListener(firstControllerListener);
    _secondController =
        AnimationController(vsync: this, duration: duration2000);
    _textController = AnimationController(vsync: this, duration: duration2000);
    _stickController = AnimationController(vsync: this, duration: duration1000)
      ..addStatusListener(stickControllerListener);
    _waveController = AnimationController(vsync: this, duration: duration2000);
  }

  void slideControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _secondController.forward();
    }
  }

  void stickControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _textController.forward();
      _waveController.forward();
    }
  }

  void firstControllerListener(AnimationStatus status) {}

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _slideController.dispose();
    _stickController.dispose();
    _textController.dispose();
    _waveController.dispose();
    super.dispose();
  }

  Animation<Offset> get slideLeftTween => Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
          parent: _slideController, curve: Curves.fastLinearToSlowEaseIn));

  Animation<Offset> get slideRightTween => Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
          parent: _slideController, curve: Curves.fastLinearToSlowEaseIn));

  Animation<Offset> get slideUpTween => Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(
          parent: _slideController, curve: Curves.fastLinearToSlowEaseIn));

  Animation<Color?> get introColorTween =>
      ColorTween(begin: kPrimary, end: kTeal200).animate(
        CurvedAnimation(
          parent: _firstController,
          curve: Curves.easeInOut,
        ),
      );

  Animation<Color?> get colorTween =>
      ColorTween(begin: kPrimary, end: kSecondary).animate(
        CurvedAnimation(
          parent: _firstController,
          curve: Curves.easeInOut,
        ),
      );

  Animation<Color?> get transparentColorTween =>
      ColorTween(begin: kSecondary, end: kPrimary).animate(
        CurvedAnimation(
          parent: _firstController,
          curve: Curves.easeInOut,
        ),
      );

  Animation<Color?> get coffeeColorTween =>
      ColorTween(begin: kGrey50, end: kCoffee).animate(
        CurvedAnimation(
          parent: _firstController,
          curve: Curves.easeInOut,
        ),
      );

  Animation<Color?> get strokeColorTween =>
      ColorTween(begin: kGrey50, end: kGrey500).animate(
        CurvedAnimation(
          parent: _stickController,
          curve: Curves.easeInOut,
        ),
      );

  Animation<Color?> get blackStrokeColorTween =>
      ColorTween(begin: kGrey50, end: kGrey).animate(
        CurvedAnimation(
          parent: _stickController,
          curve: Curves.easeInOut,
        ),
      );

  Animation<double> get waveTween => CurvedAnimation(
        parent: _waveController,
        curve: Curves.easeInOut,
      );

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey("overall"),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          _slideController.forward();
          _firstController.forward();
          _stickController.forward();
        }
      },
      child: <Widget>[
        if (context.isMobile)
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              kaCoffee,
              semanticsLabel: 'Coffee SVG',
              height: context.percentHeight(s12),
            ).addOpacity(opacity: 0.2),
          ),
        Positioned(
          top: context.percentHeight(s10),
          right: context.percentWidth(s8),
          child: <Widget>[
            AnimatedTextSlideBoxTransition(
              text: ksAllAboutMe.toUpperCase(),
              controller: _textController,
              coverColor: kPrimary,
              textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            horizontalSpaceMedium,
            AnimatedHorizontalStick(
              controller: _stickController,
            ),
          ].addRow(),
        ),
      ].addStack().addSizedBox(
            width: context.screenWidth,
            height: context.screenHeight,
          ),
    );
  }
}
