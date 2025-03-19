import 'package:flutter/material.dart';
import 'package:portfolio/presentation/utils/extensions/widget_ex.dart';
import 'package:portfolio/presentation/views/experience/subviews/experience_title_page.dart';
import 'package:portfolio/presentation/views/experience/subviews/jobs_list_page.dart';

import '../wrapper.dart';

class ExperienceView extends StatefulWidget {
  const ExperienceView({super.key});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      page: const <Widget>[
        ExperienceTitlePage(),
        JobsListPage(),
      ].addListView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
