import 'package:flutter/material.dart';
import 'package:portfolio/presentation/views/projects/projects_view.dart';

import '../views/about/about_view.dart';
import '../views/contact_me/contact_me_view.dart';
import '../views/experience/experience_view.dart';
import '../views/home/home_page.dart';
import 'route_transitions.dart';

class RouteGen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return _buildRoute(const HomePage(), settings: settings);
      case Routes.projects:
        return _buildRoute(const ProjectsView(), settings: settings);
      case Routes.projectDetails:
      // return _buildRoute(
      //   Container(),
      //   // ProjectDetailsView(
      //   //   project: arguments as ShowcaseProject,
      //   // ),
      //   settings: RouteSettings(
      //     name: '${settings.name}/${arguments?.title}',
      //   ),
      // );
      case Routes.experience:
        return _buildRoute(const ExperienceView(), settings: settings);
      case Routes.about:
        return _buildRoute(const AboutView(), settings: settings);
      case Routes.contact:
        return _buildRoute(const ContactMeView(), settings: settings);
      default:
        return _buildRoute(const ErrorView(), settings: settings);
    }
  }

  static PageRouteBuilder _buildRoute(Widget child, {RouteSettings? settings}) {
    return SlideRouteTransition(
      settings: settings,
      enterWidget: child,
    );
  }
}

class Routes {
  static const home = "/";
  static const projects = "/projects";
  static const experience = "/experience";
  static const projectDetails = "/project_details";
  static const about = "/about";
  static const contact = "/contact_me";
}

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: const Center(
        child: Text(
          "404 - Page Not Found!",
          // style: context.titleLarge,
        ),
      ),
    );
  }
}
