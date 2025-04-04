import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/extensions/context_ex.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../utils/configs/constant_sizes.dart';
import '../../../utils/configs/constants_strings.dart';
import '../widgets/experience_step_card.dart';

class JobsListPage extends StatefulWidget {
  const JobsListPage({super.key});

  @override
  State<JobsListPage> createState() => _JobsListPageState();
}

class _JobsListPageState extends State<JobsListPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _textController;

  final Duration duration = duration1000;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration * ksExperiences.length,
    );
    _textController = AnimationController(vsync: this, duration: duration2000);
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey("jobs_list"),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          _controller.forward();
        }
        if (info.visibleFraction < 0.4 && _controller.isCompleted) {
          _controller.reverse();
        }
      },
      child: <Widget>[
        ...ksExperiences.map(
          (exp) {
            int index = ksExperiences.indexOf(exp);
            double start = index / ksExperiences.length;
            double end = (index + 1) > ksExperiences.length
                ? s1
                : (index + 1) / ksExperiences.length;
            return context.adaptive<Widget>(
              MobileExperienceStepCard(
                experience: exp,
                index: index + 1,
                animation: _controller,
                start: start,
                end: end,
              ),
              ExperienceStepCard(
                experience: exp,
                index: index + 1,
                animation: _controller,
                start: start,
                end: end,
              ),
            );
          },
        ).toList(),
      ]
          .addColumn()
          .addPadding(
            edgeInsets:
                context.symmetricPercentPadding(vPercent: s6, hPercent: s4),
          )
          .addScrollView(
            physics: const BouncingScrollPhysics(),
          ),
    );
  }
}
