import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/presentation/route/routes.dart';
import 'package:portfolio/presentation/utils/custom_scroll_behaviour.dart';
import 'package:portfolio/presentation/utils/extensions/theme_ex.dart';

import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "your-api-key",
      appId: "your-app-id",
      messagingSenderId: "your-messaging-sender-id",
      projectId: "your-project-id",
      storageBucket: "your-storage-bucket",
      authDomain: "your-auth-domain",
    ),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Injection.setUp();
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
