import 'package:flutter/material.dart';

import 'package:delivery_app/src/views/home/home_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      '/': (context) => const HomePage(),
      'home': (context) => const HomePage(),
    };
  }
}
