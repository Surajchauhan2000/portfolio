import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/extensions/context_ex.dart';
import 'package:portfolio/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';

import '../../../route/route_transitions.dart';
import '../../../utils/configs/constant_color.dart';
import '../../../utils/configs/constant_sizes.dart';
import '../../../utils/configs/constants_strings.dart';
import '../../../widgets/animated_horizontal_stick.dart';
import '../../../widgets/animated_text_slide_box_transition.dart';
import '../../../widgets/hobby_item.dart';
import '../../../widgets/slide_widget.dart';

class BackgroundInfo extends StatelessWidget {
  const BackgroundInfo({
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
          text: ksBgStory.toUpperCase(),
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
          Text(
            ksBriefAboutMe,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          verticalSpaceMedium,
          Text(
            ksMyLife,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          verticalSpaceSmall,
          verticalSpaceSmall,
          Text(
            ksProfession,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          verticalSpaceMedium,
          Text(
            ksWhatILove.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          verticalSpaceLarge,
          <Widget>[
            HobbyItem(
                icon: Icons.add,
                label: context.adaptive<String>(ksCodingMobile, ksCoding)),
            const HobbyItem(icon: Icons.coffee, label: ksCoffee),
            const HobbyItem(icon: Icons.read_more, label: ksReading),
            HobbyItem(
                icon: Icons.music_note,
                label: context.adaptive<String>(ksMusicMobile, ksMusic)),
            const HobbyItem(icon: Icons.movie, label: ksMovie),
            HobbyItem(
                icon: Icons.explore,
                label: context.adaptive<String>(ksExploreMobile, ksExplore)),
          ].addWrap(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: s10,
            vSpacing: s10,
          ),
        ]
            .addColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .addPadding(
              edgeInsets: context.symmetricPercentPadding(hPercent: s8),
            ),
        animation: infoController,
        slidePosition: SlidePosition.bottom,
      ),
    ].addColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
