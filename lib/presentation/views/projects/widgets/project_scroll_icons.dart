import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/extensions/context_ex.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';

import '../../../utils/configs/constant_icons.dart';
import '../../../utils/configs/constant_sizes.dart';

class ProjectScrollIcons extends StatelessWidget {
  const ProjectScrollIcons({
    super.key,
    required this.scrollController,
    required this.cardWidth,
  });
  final ScrollController scrollController;
  final double cardWidth;
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          double currentOffset = scrollController.offset;
          double minOffset = scrollController.position.minScrollExtent;
          if (currentOffset >= minOffset) {
            double previousScroll = currentOffset - cardWidth;
            scrollController.animateTo(
              previousScroll < minOffset ? s0 : previousScroll,
              duration: duration500,
              curve: Curves.easeInOut,
            );
          }
        },
        icon: const Icon(kiArrowBack),
      ),
      horizontalSpaceMassive,
      IconButton(
        onPressed: () {
          double currentOffset = scrollController.offset;
          double maxOffset = scrollController.position.maxScrollExtent;
          if (currentOffset <= maxOffset) {
            double nextScroll = currentOffset + cardWidth;
            scrollController.animateTo(
              nextScroll > maxOffset ? maxOffset : nextScroll,
              duration: duration500,
              curve: Curves.easeInOut,
            );
          }
        },
        icon: const Icon(kiArrowNext),
      ),
    ]
        .addRow(
          mainAxisSize: MainAxisSize.min,
        )
        .addPadding(
          edgeInsets: context.symmetricPadding(
            h: s40,
            v: s20,
          ),
        );
  }
}
