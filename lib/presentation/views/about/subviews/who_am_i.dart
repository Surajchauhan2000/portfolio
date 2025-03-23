import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/extensions/context_ex.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';

import '../../../utils/configs/constant_assets.dart';
import '../../../utils/configs/constant_sizes.dart';
import '../widgets/specialization_text.dart';

class WhoAmI extends StatefulWidget {
  const WhoAmI({
    super.key,
  });
  @override
  State<WhoAmI> createState() => _WhoAmIState();
}

class _WhoAmIState extends State<WhoAmI> with TickerProviderStateMixin {
  AnimationController? _textController;
  AnimationController? _earthController;
  AnimationController? _galaxyController;
  AnimationController? _stickController;
  late Animation<Offset> _earthSlideAnimation;
  late Animation<Offset> _galaxySlideAnimation;
  Image myPicture = Image.asset(kaShowcaseStyle);

  @override
  void initState() {
    super.initState();
    _precacheImage();
    _stickController = AnimationController(vsync: this, duration: duration2000)
      ..repeat();
    _textController = AnimationController(
      vsync: this,
      duration: duration2000,
    )..forward();
    _earthController = AnimationController(
      vsync: this,
      duration: duration2870,
    )..repeat(
        reverse: true,
      );
    _galaxyController = AnimationController(
      vsync: this,
      duration: duration4300,
    )..repeat(reverse: true);
    _earthSlideAnimation =
        Tween<Offset>(begin: const Offset(s0, -s08), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _earthController!,
        curve: Curves.easeInOut,
      ),
    );
    _galaxySlideAnimation =
        Tween<Offset>(begin: const Offset(s0, s08), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _galaxyController!,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _precacheImage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(myPicture.image, context);
    });
  }

  @override
  void dispose() {
    if (_textController != null) {
      _textController!
        ..stop()
        ..dispose();
    }
    if (_earthController != null) {
      _earthController!
        ..stop()
        ..dispose();
    }
    if (_galaxyController != null) {
      _galaxyController!
        ..stop()
        ..dispose();
    }
    if (_stickController != null) {
      _stickController!
        ..stop()
        ..dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return context.adaptive(
      mobileVersion(),
      desktopVersion(),
      md: desktopVersion(),
    );
  }

  Widget mobileVersion() {
    return <Widget>[
      // Top Specialization Text
      Positioned(
        top: s2,
        left: s0,
        right: s0,
        child: Container(
          margin: context.symmetricPercentPadding(hPercent: s8),
          padding: context.percentPadding(t: s10, l: s10, r: s5, b: s5),
          child: const SpecializationText(),
        ),
      ),

      // Main Image Section (Increased Height)
      Positioned(
        bottom: s0,
        left: s20,
        top: 230,
        right: s0,
        child: Container(
          height: context.percentHeight(80), // Increased height dynamically
          width: 370,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.6), // Shadow color
                blurRadius: 6, // Spread of shadow
                offset: Offset(-3, -3), // Shift shadow to bottom and right
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.6), // Shadow color
                blurRadius: 4, // Spread of shadow
                offset: Offset(3, 4), // Shift shadow to bottom and right
              ),
            ],
          ),
          clipBehavior:
              Clip.hardEdge, // Ensures the image follows the border radius
          child: Image(
            image: myPicture.image,
            fit: BoxFit.cover,
          ),
        ).addPadding(
          edgeInsets: context.percentPadding(r: s6),
        ),
      ),
    ]
        .addStack(alignment: Alignment.centerLeft)
        .addSizedBox(width: context.screenWidth, height: context.screenHeight);
  }

  Widget desktopVersion() {
    return <Widget>[
      Container(
        margin: context.symmetricPercentPadding(hPercent: s8),
        padding: context.allPercentPadding(allPercent: s3),
        child: <Widget>[
          const SpecializationText().addCenter().addExpanded(),
          const SizedBox.shrink().addExpanded(),
        ].addRow(),
      ),
      <Widget>[
        Container(
          height: 600,
          width: 700,
          margin: const EdgeInsets.only(bottom: 60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6), // Shadow color
                blurRadius: 15, // Spread of shadow
                offset: Offset(6, 6), // Shift shadow to bottom and right
              ),
            ],
          ),
          clipBehavior:
              Clip.hardEdge, // Ensures the image follows the border radius
          child: Image(
            image: myPicture.image,
            fit: BoxFit.cover,
          ),
        ),
      ]
          .addStack(
            alignment: Alignment.bottomCenter,
          )
          .addSizedBox(
            width: context.percentWidth(s30),
            height: context.screenHeight,
          )
          .addPadding(
              edgeInsets: context.percentPadding(
            r: s6,
          ))
          .addAlign(
            alignment: Alignment.centerRight,
          ),
    ]
        .addStack(
          alignment: Alignment.centerLeft,
        )
        .addSizedBox(
          width: context.screenWidth,
          height: context.screenHeight -
              Theme.of(context).appBarTheme.toolbarHeight!,
        );
  }
}
