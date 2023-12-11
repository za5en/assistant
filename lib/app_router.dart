import 'package:assistant/view/pages/competency.dart';
import 'package:assistant/view/pages/basic_competency.dart';
import 'package:assistant/view/pages/current_competency.dart';
import 'package:assistant/view/pages/profile.dart';
import 'package:assistant/view/pages/registration.dart';
import 'package:assistant/view/pages/settings.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter();
  Route onGenerateRoute(settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Profile());
      case '/registration':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Registration());
      case '/basic_competency':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const BasicCompetency());
      case '/current_competency':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const CurrentCompetency());
      case '/competency':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Competency());
      case '/settings':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Settings());
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
