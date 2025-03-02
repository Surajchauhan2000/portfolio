import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/presentation/route/routes.dart';
import 'package:portfolio/presentation/utils/custom_scroll_behaviour.dart';
import 'package:portfolio/presentation/utils/extensions/theme_ex.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // Injection.setUp();
  // setPathUrlStrategy();
  runApp(const TucoYe());
}

class TucoYe extends StatelessWidget {
  const TucoYe({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: 'Portfolio',
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: context.theme(),
        initialRoute: initialRoute,
        onGenerateRoute: RouteGen.generateRoute,
      ),
    );
  }

  String get initialRoute => Routes.home;
}
