import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/configs/constant_color.dart';
import 'package:portfolio/presentation/utils/configs/constant_sizes.dart';
import 'package:portfolio/presentation/utils/extensions/context_ex.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:portfolio/presentation/utils/extensions/string_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../data/model/quote.dart';
import '../../utils/configs/constants_strings.dart';
import '../../widgets/animated_text_slide_box_transition.dart';
import '../../widgets/custom_slider.dart';
import '../../widgets/footer_path.dart';

class FooterPage extends StatefulWidget {
  const FooterPage({Key? key}) : super(key: key);

  @override
  State<FooterPage> createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _labelController;
  late AnimationController _pathController;
  late Animation<double> _pathAnimation;
  late AnimationController _footerTextController;
  final List<Interval> _itemSlideIntervals = [];
  int sectors = 5;
  double screenHeight = 0.0;
  double sectorHeight = 0.0;
  double quoteHeight = 0.0;
  double footerHeight = 0.0;
  double quotePadding = 0.0;
  Size quoteSize = Size.zero;

  Duration get staggeredDuration => duration100;

  Duration get itemSlideDuration => duration1000;

  Duration get labelDuration => duration1000;

  Duration get slideDuration =>
      staggeredDuration + (staggeredDuration * sectors) + itemSlideDuration;

  List<Color> get sectorColors => [
        _footerForegroundColor,
        _footerForegroundColor,
        _footerForegroundColor,
        kBlack,
        kBlack,
      ];

  List<Color> get smallSectorColors => [
        _footerForegroundColor,
        _footerForegroundColor,
        kBlack,
        kBlack,
        kBlack,
      ];
  Quote randomQuote = ksQuotes[Random().nextInt(ksQuotes.length)];

  String get quoteName => randomQuote.name.addDoubleQuote();
  int maxLines = 5;

  TextStyle? get quoteTextStyle => context
      .adaptive<TextStyle?>(
        Theme.of(context).textTheme.bodyLarge,
        Theme.of(context).textTheme.titleMedium,
        md: Theme.of(context).textTheme.titleSmall,
      )
      ?.copyWith(
        fontWeight: FontWeight.w500,
      );
  final Color _footerForegroundColor = kSecondary;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createStaggeredIntervals();
    screenHeight = context.screenHeight - context.percentHeight(s20);
    sectorHeight = screenHeight / sectors;
    quoteHeight =
        (context.screenHeight / sectors) * context.adaptive(2, 3, md: 3);
    quotePadding = context.screenWidth * 0.06;
    footerHeight =
        (context.screenHeight / sectors) * context.adaptive(3, 2, md: 2);
    _slideController = AnimationController(
      duration: slideDuration,
      vsync: this,
    )..addListener(_slideControllerListener);
    _labelController = AnimationController(
      duration: labelDuration,
      vsync: this,
    );
    _pathController = AnimationController(
      duration: duration2000,
      vsync: this,
    );
    _pathAnimation = CurvedAnimation(
      parent: _pathController,
      curve: Curves.fastLinearToSlowEaseIn,
    );
    _footerTextController = AnimationController(
      vsync: this,
      duration: duration2000,
    );
    quoteSize = quoteName.textSize(
      style: quoteTextStyle,
      maxWidth: context.screenWidth - quotePadding,
      maxLines: maxLines,
    );
  }

  void _slideControllerListener() {
    if (_slideController.isCompleted) {
      _labelController.forward();
      _pathController.forward();
      _footerTextController.forward();
    } else if (_slideController.isDismissed) {
      _labelController.reset();
      _pathController.reset();
      _footerTextController.reset();
    }
  }

  void createStaggeredIntervals() {
    for (int i = 0; i < sectors; i++) {
      final Duration start = staggeredDuration + (staggeredDuration * i);
      final Duration end = start + itemSlideDuration;
      _itemSlideIntervals.add(
        Interval(
          start.inMilliseconds / slideDuration.inMilliseconds,
          end.inMilliseconds / slideDuration.inMilliseconds,
        ),
      );
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _labelController.dispose();
    _pathController.dispose();
    _footerTextController.dispose();
    super.dispose();
  }

  Widget _sectorWidgets() {
    return <Widget>[
      ...List.generate(
        sectors,
        (index) => CustomSlider(
          width: context.screenWidth,
          height: sectorHeight,
          color: context.adaptive(
            smallSectorColors[index],
            sectorColors[index],
            md: sectorColors[index],
          ),
          animation: _slideController.view,
          interval: _itemSlideIntervals[index],
        ).addExpanded(),
      ),
    ].addColumn(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _quoteSection() {
    return <Widget>[
      // different quote displayed here
      AnimatedTextSlideBoxTransition(
        controller: _labelController,
        coverColor: _footerForegroundColor,
        text: quoteName,
        width: context.screenWidth - quotePadding,
        maxLines: maxLines,
        textAlign: TextAlign.center,
        textStyle: quoteTextStyle,
      ),
    ]
        .addColumn(
          mainAxisAlignment: MainAxisAlignment.center,
        )
        .addContainer(
          height: quoteHeight,
          width: context.screenWidth,
          margin: context.symmetricPadding(h: quotePadding / 2),
        );
  }

  Widget _footerWelcomePart() {
    return <Widget>[
      AnimatedTextSlideBoxTransition(
        controller: _footerTextController,
        text: ksLetsWork,
        maxLines: 2,
        textAlign: TextAlign.center,
        textStyle: context
            .adaptive<TextStyle?>(
              Theme.of(context).textTheme.titleSmall,
              Theme.of(context).textTheme.titleLarge,
              md: Theme.of(context).textTheme.titleMedium,
            )
            ?.copyWith(
              color: _footerForegroundColor,
            ),
        boxColor: kSecondary,
        coverColor: kBlack,
      ),
    ].addColumn(
      mainAxisSize: MainAxisSize.min,
    );
  }

  Widget _footerAnimatedPath() {
    return FooterPath(
      color: _footerForegroundColor,
      animation: _pathAnimation,
    )
        .addSizedBox(
          height: footerHeight,
        )
        .addPadding(
          edgeInsets: context.symmetricPadding(
            h: s20,
          ),
        );
  }

  Widget _footerSocialAndCreditPart() {
    return <Widget>[
      Text(
        ksContactInfo,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: _footerForegroundColor,
            ),
      ),
      <Widget>[
        Icon(
          Icons.mail,
          color: _footerForegroundColor,
          size: s18,
        ),
        horizontalSpaceMedium,
        Text(
          ksWorkEmail,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _footerForegroundColor,
              ),
        ),
      ]
          .addRow(mainAxisSize: MainAxisSize.min)
          .addInkWell(onTap: ksWorkEmail.launchEmail),
      <Widget>[
        Icon(
          Icons.phone,
          color: _footerForegroundColor,
          size: s18,
        ),
        horizontalSpaceMedium,
        Text(
          ksWorkPhone,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kSecondary,
              ),
        ),
      ].addRow(mainAxisSize: MainAxisSize.min),
    ].addColumn(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey("footer_page"),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) {
          _slideController.forward();
        }
      },
      child: <Widget>[
        _sectorWidgets(),
        <Widget>[
          _quoteSection(),
          <Widget>[
            context.adaptive<Widget>(
              <Widget>[
                // verticalSpaceMedium,
                _footerWelcomePart(),
                verticalSpaceMedium,
                _footerSocialAndCreditPart(),
              ]
                  .addColumn(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                  .addExpanded(),
              <Widget>[
                _footerWelcomePart(),
                Visibility(
                    visible: context.adaptive(
                      false,
                      true,
                      md: true,
                    ),
                    child: _footerAnimatedPath().addExpanded()),
                _footerSocialAndCreditPart(),
              ].addRow().addExpanded(),
            ),
          ].addColumn().addContainer(
                height: footerHeight,
                width: context.screenWidth,
                padding:
                    context.symmetricPadding(h: context.adaptive(s10, s80)),
              ),
        ].addColumn(),
      ].addStack().addSizedBox(
            height: context.screenHeight,
            width: context.screenWidth,
          ),
    );
  }
}
