import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';

import '../utils/configs/constant_sizes.dart';

class HobbyItem extends StatelessWidget {
  const HobbyItem({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Icon(icon),
      verticalSpaceLarge,
      Text(
        label,
        maxLines: 3,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w200,
            ),
      ),
    ].addColumn(
      mainAxisSize: MainAxisSize.min,
    );
  }
}
