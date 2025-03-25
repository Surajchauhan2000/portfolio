import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/extensions/context_ex.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';
import 'package:portfolio/presentation/views/project_details/widget/project_overview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../../data/model/showcase_project.dart';
import '../../utils/configs/constant_color.dart';
import '../../utils/configs/constant_icons.dart';
import '../../utils/configs/constant_sizes.dart';
import '../../widgets/animated_text_slide_box_transition.dart';
import '../../widgets/animated_vertical_stick.dart';
import '../../widgets/menu_button.dart';
import '../home/footer_page.dart';

class ProjectDetailsView extends StatefulWidget {
  const ProjectDetailsView({
    super.key,
    required this.project,
  });
  final ShowcaseProject project;
  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView>
    with TickerProviderStateMixin {
  late AnimationController _appBarController;
  late AnimationController _mouseIconController;
  late AnimationController _stickController;
  late AnimationController _titleController;
  late Animation<Offset> _appBarAnimation;
  late Animation<double> _mouseOpacityAnimation;
  final GlobalKey _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    _appBarController = AnimationController(vsync: this, duration: duration500);
    _stickController = AnimationController(vsync: this, duration: duration2000);
    _titleController = AnimationController(vsync: this, duration: duration1000);
    _mouseIconController =
        AnimationController(vsync: this, duration: duration500);

    _appBarAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(_appBarController);
    _mouseOpacityAnimation =
        Tween<double>(begin: s0, end: s1).animate(_mouseIconController);
    Future.delayed(duration2000, () {
      _appBarController.forward();
      _appBarController.addStatusListener(_appBarListener);
      _mouseIconController.forward();
      _stickController.repeat(
        reverse: true,
      );
    });
  }

  void _appBarListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _titleController.forward();
    }
  }

  @override
  void dispose() {
    _appBarController.dispose();
    _mouseIconController.dispose();
    _stickController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ShowcaseProject project = widget.project;
    return Scaffold(
      key: _key,
      body: <Widget>[
        <Widget>[
          Positioned(
            left: s0,
            right: s0,
            bottom: s0,
            top: s0,
            child: Image.asset(project.image,
                    width: context.percentWidth(context.adaptive(s20, s30)),
                    height: context.percentHeight(s0),
                    fit: BoxFit.contain)
                .addHero(tag: project.heroTag),
          ),
          <Widget>[
            SlideTransition(
              position: _appBarAnimation,
              child: <Widget>[
                AnimatedTextSlideBoxTransition(
                  width: (context.isMobile) ? 250.0 : double.infinity,
                  controller: _titleController,
                  text: project.title,
                  maxLines: 3,
                  textStyle: context.adaptive(
                    Theme.of(context).textTheme.bodyLarge,
                    Theme.of(context).textTheme.labelLarge,
                  ),
                  coverColor: kPrimary,
                ),
                MenuButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  hasMenuTapped: true,
                ),
              ]
                  .addRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  )
                  .addContainer(
                    height: s100,
                    width: context.screenWidth,
                    color: kTransparent,
                    padding: context.symmetricPadding(
                      h: context.adaptive(s5, s50),
                    ),
                  ),
            ),
            <Widget>[
              FadeTransition(
                opacity: _mouseOpacityAnimation,
                child: const Icon(
                  kiMouseScroll,
                  size: s38,
                ).addPadding(
                  edgeInsets: context.symmetricPadding(
                    v: s20,
                  ),
                ),
              ),
              AnimatedVerticalStick(
                controller: _stickController,
              ),
            ]
                .addColumn(
                  mainAxisSize: MainAxisSize.min,
                )
                .addAlign(
                  alignment: Alignment.bottomRight,
                )
                .addPadding(
                  edgeInsets: context.symmetricPadding(
                    h: s40,
                  ),
                ),
          ]
              .addColumn(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              )
              .addSizedBox(
                width: context.screenWidth,
                height: context.screenHeight,
              ),
        ].addStack(),
        ProjectOverview(
          project: project,
        ),
        SizedBox(
          height: 30,
        ),
        if (context.isMobile)
          ..._mobileImage(project.mobileImages ?? [], project.title)
        else
          ..._webImages(project.images ?? [], project.title),
        SizedBox(
          height: 50,
        ),
        const FooterPage(),
      ].addListView(
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}

_webImages(List<String> img, String title) {
  List<Widget> item = [];
  for (int i = 0; i < img.length; i++) {
    print("index is :::::: $i");
    if (i == 2 && title == "Faircado (second-hand alternatives)") {
      item.add(VideoController());
    }

    if ((i == 0 || i == 11) && title == "Faircado (second-hand alternatives)") {
      item.add(
        GestureDetector(
          onTap: () async {
            // Define your action here when the first image is clicked
            print('First image clicked!');
            const url =
                'https://apps.apple.com/gb/app/faircado/id6447126890?platform=iphone'; // Replace with your desired URL
            Uri uri =
                Uri.parse(url); // You can replace 'link' with any dynamic URL.
            if (await canLaunch(uri.toString())) {
              await launch(uri.toString());
            }
          },
          child: Image.asset(
            img[i] ?? '',
            fit: BoxFit.contain,
          ),
        ),
      );
    } else {
      item.add(
        Image.asset(
          img[i] ?? '',
          fit: BoxFit.contain,
        ),
      );
    }

    SizedBox(
      height: 100,
    );
  }
  return item;
}

_mobileImage(List<String> img, String title) {
  List<Widget> item = [];
  for (int i = 0; i < img.length; i++) {
    if (i == 2 && title == "Faircado (second-hand alternatives)") {
      item.add(VideoController());
    }

    if ((i == 0) && title == "Faircado (second-hand alternatives)") {
      item.add(
        GestureDetector(
          onTap: () async {
            // Define your action here when the first image is clicked
            const url =
                'https://apps.apple.com/gb/app/faircado/id6447126890?platform=iphone'; // Replace with your desired URL
            Uri uri =
                Uri.parse(url); // You can replace 'link' with any dynamic URL.
            if (await canLaunch(uri.toString())) {
              await launch(uri.toString());
            }
          },
          child: Image.asset(
            img[i] ?? '',
            fit: BoxFit.contain,
          ),
        ),
      );
    } else {
      item.add(
        Image.asset(
          img[i] ?? '',
          fit: BoxFit.contain,
        ),
      );
    }

    SizedBox(
      height: 100,
    );
  }
  return item;
}

class VideoController extends StatefulWidget {
  @override
  State<VideoController> createState() => _VideoControllerState();
}

class _VideoControllerState extends State<VideoController> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://faircado.com/wp-content/uploads/2025/01/Faircado_App_v06.mp4',
      ),
    )..initialize().then((_) {
        setState(() {}); // Update UI when video is loaded
        _videoController.play(); // Auto-play the video
        _videoController.setLooping(true); // Loop the video
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (context.isMobile)
      return Container(
        color: Colors.white,
        height: 500,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: _videoController.value.isInitialized
                    ? Transform.scale(
                        scaleX: 1.30, // Scale the video horizontally
                        scaleY: 1.10,
                        child: AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        ),
                      )
                    : Center(child: const CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      );
    else
      return Container(
          color: Colors.white,
          height: 800,
          width: 550,
          child: Stack(
            children: [
              // ✅ Bottom-right image
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: _videoController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        )
                      : Center(child: const CircularProgressIndicator()),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 18,
                child: Image.asset(
                  'assets/images/projects/faircado/one_place.png',
                  width: 600, // Adjust size as needed
                  height: 230,
                ),
              ),
              Positioned(
                top: 0,
                left: 96,
                child: Image.asset(
                  'assets/images/projects/faircado/second_hand.png',
                  width: 500, // Adjust size as needed
                  // height: 240,
                ),
              ),
            ],
          ));
  }
}
