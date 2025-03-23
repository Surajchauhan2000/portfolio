import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/extensions/context_ex.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../data/model/showcase_project.dart';
import '../../../utils/configs/constant_color.dart';
import '../../../utils/configs/constant_sizes.dart';
import '../../../widgets/animated_text_slide_box_transition.dart';
import 'info_section.dart';

class ProjectOverview extends StatefulWidget {
  const ProjectOverview({super.key, required this.project});
  final ShowcaseProject project;

  @override
  State<ProjectOverview> createState() => _ProjectOverviewState();
}

class _ProjectOverviewState extends State<ProjectOverview>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _contentController;
  void detectVisibility(VisibilityInfo info) {
    if (info.visibleFraction > 0.45) {
      _titleController.forward();
      _titleController.addStatusListener(_titleControllerListener);
    } else {
      if (_titleController.isCompleted) {
        _titleController.reset();
      }
      if (_contentController.isCompleted) {
        _contentController.reset();
      }
    }
  }

  void _titleControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _contentController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(vsync: this, duration: duration1000);
    _contentController =
        AnimationController(vsync: this, duration: duration1000);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      AnimatedTextSlideBoxTransition(
        controller: _titleController,
        text: 'Project Overview',
        coverColor: kPrimary,
        textStyle: context.adaptive(
          Theme.of(context).textTheme.bodyLarge,
          Theme.of(context).textTheme.titleMedium,
        ),
      ),
      verticalSpaceMassive,
      AnimatedTextSlideBoxTransition(
        controller: _contentController,
        text: widget.project.description,
        coverColor: kPrimary,
        textStyle: context.adaptive(
          Theme.of(context).textTheme.bodyMedium,
          Theme.of(context).textTheme.bodyLarge,
        ),
        maxLines: 20,
      ),
      context.percentSizedBox(
        pHeight: s5,
      ),
      <Widget>[
        if (context.isMobile)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.laptop_chromebook),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Tools & technology",
                        style: context
                            .adaptive(Theme.of(context).textTheme.bodyMedium,
                                Theme.of(context).textTheme.bodyLarge)
                            ?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "- FLUTTER",
                    style: context
                        .adaptive(Theme.of(context).textTheme.bodyMedium,
                            Theme.of(context).textTheme.bodyLarge)
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  Text(
                    "- DART",
                    style: context
                        .adaptive(Theme.of(context).textTheme.bodyMedium,
                            Theme.of(context).textTheme.bodyLarge)
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.laptop_chromebook),
                      SizedBox(
                        width: 7,
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          "Available platform",
                          style: context
                              .adaptive(Theme.of(context).textTheme.bodyMedium,
                                  Theme.of(context).textTheme.bodyLarge)
                              ?.copyWith(fontWeight: FontWeight.w700),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "- ANDROID",
                    style: context
                        .adaptive(Theme.of(context).textTheme.bodyMedium,
                            Theme.of(context).textTheme.bodyLarge)
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  Text(
                    "- IOS",
                    style: context
                        .adaptive(Theme.of(context).textTheme.bodyMedium,
                            Theme.of(context).textTheme.bodyLarge)
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                  Text(
                    "- WEB",
                    style: context
                        .adaptive(Theme.of(context).textTheme.bodyMedium,
                            Theme.of(context).textTheme.bodyLarge)
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
            ],
          )
        else
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoSection(
                    controller: _contentController,
                    info: widget.project.tech,
                  ),
                  InfoSection(
                    controller: _contentController,
                    info: widget.project.platform,
                  ),
                ],
              )
            ],
          ),
      ].addWrap(),
    ]
        .addColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .addContainer(
          padding: context.symmetricPercentPadding(
            hPercent: context.adaptive(s4, s10),
            vPercent: s0,
          ),
        )
        .addVisibilityDetector(onDetectVisibility: detectVisibility);
  }
}
