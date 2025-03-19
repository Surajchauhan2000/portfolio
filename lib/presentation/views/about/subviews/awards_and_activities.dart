import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/extensions/context_ex.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:portfolio/presentation/utils/extensions/string_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';

import '../../../../data/model/activity.dart';
import '../../../route/route_transitions.dart';
import '../../../utils/configs/constant_color.dart';
import '../../../utils/configs/constant_sizes.dart';
import '../../../utils/configs/constants_strings.dart';
import '../../../widgets/animated_horizontal_stick.dart';
import '../../../widgets/animated_text_slide_box_transition.dart';
import '../../../widgets/slide_widget.dart';

class AwardsAndActivities extends StatelessWidget {
  const AwardsAndActivities({
    super.key,
    required this.stickController,
    required this.textController,
    required this.infoController,
  });

  final AnimationController stickController;
  final AnimationController textController;
  final AnimationController infoController;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        AnimatedHorizontalStick(
          controller: stickController,
        ),
        horizontalSpaceMedium,
        AnimatedTextSlideBoxTransition(
          text: ksAwardsAndActivities.toUpperCase(),
          controller: textController,
          coverColor: kPrimary,
          textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ].addRow(),
      verticalSpaceMassive,
      SlideWidget(
        <Widget>[
          ...ksActivityList
              .map(
                (activity) => ActivityContainer(
                  activity: activity,
                ),
              )
              .toList(),
        ].addColumn(
          mainAxisSize: MainAxisSize.min,
        ),
        animation: infoController,
        slidePosition: SlidePosition.bottom,
      ),
    ].addColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}

class ActivityContainer extends StatelessWidget {
  const ActivityContainer({
    super.key,
    required this.activity,
  });

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      activity.title != null
          ? Text(
              activity.title!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            )
          : noSpace,
      activity.title != null ? verticalSpaceMedium : noSpace,
      <Widget>[
        <Widget>[
          Icon(
            activity.icon,
            size: context.adaptive(s18, s24),
          ),
          horizontalSpaceMedium,
          Text(
            activity.name,
            maxLines: 3,
            style: context
                .adaptive(Theme.of(context).textTheme.bodyMedium,
                    Theme.of(context).textTheme.bodyLarge)
                ?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
        ].addWrap(),
        link(context),
      ].addWrap(
        alignment: activity.link == null
            ? WrapAlignment.start
            : WrapAlignment.spaceBetween,
      ),
      verticalSpaceSmall,
      Text(activity.details).addPadding(
        edgeInsets: context.percentPadding(
          l: s3,
          b: s3,
        ),
      ),
    ]
        .addColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        )
        .addPadding(
          edgeInsets: context.symmetricPercentPadding(hPercent: s8),
        );
  }

  Widget link(BuildContext context) {
    if (activity.link != null) {
      return <Widget>[
        Icon(
          Icons.link,
          size: context.adaptive(s14, s24),
        ),
        horizontalSpaceMedium,
        GestureDetector(
          onTap: () {
            activity.link!.launchWebsite();
          },
          child: Text(
            activity.link!,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dotted,
              decorationColor: kBlack26,
            ),
          ),
        ),
      ].addRow(
        mainAxisSize: MainAxisSize.min,
      );
    } else {
      return noSpace;
    }
  }
}
