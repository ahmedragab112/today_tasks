import 'package:flutter/material.dart';

import 'package:notehive/router/routes.dart';
import 'package:notehive/views/home/home.dart';

class AppRouter {
  static Route<Widget> generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeNote:
        return MaterialPageRoute(
          builder: (_) => const HomeNote(),
        );
   
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeNote(),
        );
    }
  }
}
