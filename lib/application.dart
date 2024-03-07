import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/router/router.dart';
import 'package:flutter_application_3/feature/presentation/screens/about/about_screen.dart';
import 'package:flutter_application_3/feature/presentation/screens/home/home_screen.dart';
import 'package:flutter_application_3/feature/presentation/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class Application extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Application({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: AppRouter.splash,
      getPages: [
        GetPage(name: AppRouter.splash, page: () => const SplashScreen()),
        GetPage(name: AppRouter.home, page: () => const HomeScreen()),
        GetPage(name: AppRouter.about, page: () => const AboutScreen()),
      ],
    );
  }
}
