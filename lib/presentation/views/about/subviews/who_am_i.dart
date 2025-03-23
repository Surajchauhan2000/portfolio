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
            color: Colors.green,
            borderRadius: BorderRadius.circular(25),
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
        ).addPadding(
          edgeInsets: context.percentPadding(r: s6),
        ),
      ),
    ]
        .addStack(alignment: Alignment.centerLeft)
        .addSizedBox(width: context.screenWidth, height: context.screenHeight);
  }

  // Widget mobileVersion() {
  //   return <Widget>[
  //     Positioned(
  //       top: s2,
  //       left: s0,
  //       right: s0,
  //       child: Container(
  //         margin: context.symmetricPercentPadding(hPercent: s8),
  //         padding: context.percentPadding(t: s10, l: s10, r: s5, b: s5),
  //         child: const SpecializationText(),
  //       ),
  //     ),
  //     // Container(
  //     //   height: 600,
  //     //   width: 600,
  //     //   color: Colors.red,
  //     //   // child: Image(
  //     //   //   image: myPicture.image,
  //     //   //   width: 600,
  //     //   //   height: 600,
  //     //   // ),
  //     // ),
  //
  //     Positioned(
  //       top: 250,
  //       bottom: s0,
  //       left: s20,
  //       right: s0,
  //       child: <Widget>[
  //         Container(
  //           height: 700,
  //           width: 370,
  //           // margin: const EdgeInsets.only(bottom: 20),
  //           decoration: BoxDecoration(
  //             color: Colors.green,
  //             borderRadius: BorderRadius.circular(30),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black.withOpacity(0.6), // Shadow color
  //                 blurRadius: 15, // Spread of shadow
  //                 offset: Offset(6, 6), // Shift shadow to bottom and right
  //               ),
  //             ],
  //           ),
  //           clipBehavior:
  //               Clip.hardEdge, // Ensures the image follows the border radius
  //           child: Image(
  //             image: myPicture.image,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ]
  //           .addStack()
  //           .addSizedBox(
  //             width: context.screenWidth,
  //             height: context.percentHeight(s100),
  //             // height: context.screenHeight,
  //           )
  //           .addPadding(
  //             edgeInsets: context.percentPadding(
  //               r: s6,
  //             ),
  //           ),
  //     ),
  //   ]
  //       .addStack(
  //         alignment: Alignment.centerLeft,
  //       )
  //       .addSizedBox(
  //         width: context.screenWidth,
  //         height: context.screenHeight -
  //             Theme.of(context).appBarTheme.toolbarHeight!,
  //       );
  // }

  Widget desktopVersion() {
    return <Widget>[
      // Positioned(
      //   bottom: s0,
      //   left: s0,
      //   child: LeftStickLabel(
      //     textController: _textController!,
      //     stickController: _stickController!,
      //   ),
      // ),
      // Positioned(
      //   top: context.percentHeight(s10),
      //   right: context.percentWidth(s8),
      //   child: OutlinedText(
      //     text: ksNobody,
      //     fontSize: s100,
      //     strokeColor: kSecondary,
      //     textColor: kTransparent,
      //     fontWeight: FontWeight.w900,
      //   ),
      // ),
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
        // Positioned(
        //   left: s0,
        //   top: context.percentHeight(s32),
        //   child: SlideTransition(
        //     position: _earthSlideAnimation,
        //     child: SvgPicture.asset(
        //       kaEarth,
        //       semanticsLabel: 'Earth SVG',
        //       width: s80,
        //       height: s80,
        //     ),
        //   ),
        // ),
        // Positioned(
        //   right: s0,
        //   top: context.percentHeight(s48),
        //   child: SlideTransition(
        //     position: _galaxySlideAnimation,
        //     child: SvgPicture.asset(
        //       kaGalaxy,
        //       semanticsLabel: 'Galaxy SVG',
        //       width: s80,
        //       height: s80,
        //     ),
        //   ),
        // ),
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
