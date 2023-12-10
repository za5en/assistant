import 'package:assistant/view/pages/registration.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter();
  Route onGenerateRoute(settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const Registration()); //! change to Profile
      case '/registration':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Registration());
      // case '/competency':
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => const Competency());
      // case '/skills':
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => const Skills());
      // case '/markdown':
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => const MarkdownView());
      // case '/testing':
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => const Testing());
      default:
        throw ErrorDescription('Unknown route name: ${settings.name}');
    }
  }
}
