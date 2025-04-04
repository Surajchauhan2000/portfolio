import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';

import 'home/home_page.dart';

const double lineHeight = 2;
Color defaultLineColor = const Color(0xFFC7D3B6);

class LoadingHomePageAnimation extends StatefulWidget {
  LoadingHomePageAnimation({
    Key? key,
    required this.text,
    required this.style,
    required this.onLoadingDone,
    this.settings,
    this.lineColor,
  }) : super(key: key);
  final String text;
  final TextStyle? style;
  final VoidCallback onLoadingDone;
  final Color? lineColor;
  final RouteSettings? settings;

  @override
  _LoadingHomePageAnimationState createState() =>
      _LoadingHomePageAnimationState();
}

class _LoadingHomePageAnimationState extends State<LoadingHomePageAnimation>
    with TickerProviderStateMixin {
  late AnimationController _fadeOutController;
  late AnimationController _containerController;
  late AnimationController _scaleOpacityController;
  late Animation<double> containerAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;
  late Animation<double> fadeAnimation;
  late Color lineColor;
  final Duration _scaleDuration = Duration(milliseconds: 750);
  final Duration _leftRightContainerDuration = Duration(milliseconds: 750);
  final Duration _containerDuration = Duration(milliseconds: 2000);
  bool _leftRightAnimationStarted = false;
  bool _leftRightAnimationDone = false;
  bool _isAnimationOver = false;
  // late Size size = 0.0;
  late double textWidth;
  late double textHeight;

  @override
  void initState() {
    super.initState();
    setTextWidthAndHeight();
    lineColor = widget.lineColor ?? defaultLineColor;
    _scaleOpacityController = AnimationController(
      vsync: this,
      duration: _scaleDuration,
    );
    _containerController = AnimationController(
      vsync: this,
      duration: _containerDuration,
    );
    _fadeOutController = AnimationController(
      vsync: this,
      duration: _leftRightContainerDuration,
    );
    scaleAnimation = Tween<double>(begin: 0.9, end: 0.5).animate(
      CurvedAnimation(
        parent: _scaleOpacityController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleOpacityController,
        curve: Curves.easeIn,
      ),
    );
    fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _fadeOutController,
        curve: Curves.easeIn,
      ),
    );
    containerAnimation = Tween<double>(begin: 0, end: textWidth).animate(
      CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    _scaleOpacityController.forward();
    _scaleOpacityController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _containerController.forward();
        });
      }
    });
    _containerController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _leftRightAnimationStarted = true;
          _fadeOutController.forward();
        });
      }
    });

    _fadeOutController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _leftRightAnimationDone = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _fadeOutController.dispose();
    _scaleOpacityController.dispose();
    _containerController.dispose();
    super.dispose();
  }

  void setTextWidthAndHeight() {
    textWidth = 500;
    textHeight = 100;
  }

  @override
  Widget build(BuildContext context) {
    setTextWidthAndHeight();
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    double halfHeightOfScreen = screenHeight / 2;
    double widthOfLeftLine = (context.isMobile) ? 10 : 1000 - (textWidth / 2);
    double widthOfRightLine =
        (context.isMobile) ? 10 : screenWidth - (widthOfLeftLine + textWidth);
    double leftContainerStart =
        (context.isMobile) ? 10 : (screenWidth / 2) - (textWidth / 2);

    TextStyle? titleTextStyle = context.adaptive(
      Theme.of(context).textTheme.titleSmall,
      Theme.of(context).textTheme.headlineSmall,
      md: Theme.of(context).textTheme.titleLarge,
    );

    return _isAnimationOver
        ? SizedBox.shrink()
        : Stack(
            children: [
              AnimatedContainer(
                width: screenWidth,
                height: _leftRightAnimationDone ? 0 : halfHeightOfScreen,
                duration: _scaleDuration,
                color: Colors.black,
                onEnd: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  setState(() {
                    _isAnimationOver = true;
                  });
                },
              ),
              Positioned(
                bottom: 0,
                child: AnimatedContainer(
                  width: screenWidth,
                  height: _leftRightAnimationDone ? 0 : halfHeightOfScreen,
                  duration: _scaleDuration,
                  color: Colors.black,
                ),
              ),
              Container(
                width: (context.isMobile) ? 200 : 1440,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Container(
                            width: textWidth,
                            child: FadeTransition(
                              opacity: fadeAnimation,
                              child: AnimatedBuilder(
                                animation: _scaleOpacityController,
                                child: Text(
                                  widget.text,
                                  textAlign: TextAlign.center,
                                  style: titleTextStyle?.copyWith(
                                      fontSize: context.isMobile
                                          ? MediaQuery.sizeOf(context).width *
                                              0.07
                                          : 55,
                                      color: Colors.white),
                                ),
                                builder: (context, child) => Transform.scale(
                                  scale: 2 * scaleAnimation.value,
                                  alignment: Alignment.center,
                                  child: AnimatedOpacity(
                                    opacity: opacityAnimation.value,
                                    child: child,
                                    duration: _scaleDuration,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: widthOfLeftLine,
                            child: Stack(
                              children: [
                                Container(
                                  width: widthOfLeftLine,
                                  height: lineHeight,
                                  color: lineColor,
                                ),
                                Positioned(
                                  child: AnimatedContainer(
                                    width: _leftRightAnimationStarted
                                        ? 0
                                        : leftContainerStart,
                                    height: lineHeight,
                                    color: Colors.black,
                                    duration: _leftRightContainerDuration,
                                    // curve: Curves.ease,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          containerAnimationBuilder(
                            controller: _containerController,
                            animation: containerAnimation,
                            color: lineColor,
                          ),
                          Container(
                            width: widthOfRightLine,
                            child: Stack(
                              children: [
                                Container(
                                  width: widthOfRightLine,
                                  height: lineHeight,
                                  color: lineColor,
                                ),
                                Positioned(
                                  right: 0,
                                  child: AnimatedContainer(
                                    width: _leftRightAnimationStarted
                                        ? 0
                                        : widthOfRightLine,
                                    height: lineHeight,
                                    color: Colors.black,
                                    duration: _leftRightContainerDuration,
                                    onEnd: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget containerAnimationBuilder({
    required Animation<double> animation,
    required AnimationController controller,
    Color color = Colors.white,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        height: lineHeight,
        width: animation.value,
        color: color,
      ),
    );
  }
}
