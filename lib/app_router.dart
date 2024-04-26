import 'package:assistant/view/pages/markdown_view.dart';
import 'package:assistant/view/pages/new_competency.dart';
import 'package:assistant/view/pages/basic_competency.dart';
import 'package:assistant/view/pages/current_competency.dart';
import 'package:assistant/view/pages/profile.dart';
import 'package:assistant/view/pages/registration.dart';
import 'package:assistant/view/pages/settings.dart';
import 'package:assistant/view/pages/skill_select.dart';
import 'package:assistant/view/pages/testing_page.dart';
import 'package:flutter/material.dart';

import 'widgets/a_change_name.dart';

class AppRouter {
  const AppRouter();
  Route onGenerateRoute(settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Profile());
      case '/basic_competency':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const BasicCompetency());
      case '/change_name':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ChangeName());
      case '/competency':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const NewCompetency());
      case '/current_competency':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const CurrentCompetency());
      case '/markdown':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const MarkdownView());
      case '/registration':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Registration());
      case '/settings':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Settings());
      case '/skills':
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const Skills(
                  header: 'hard',
                  specName: 'spec',
                  skillsList: [],
                  edit: false,
                ));
      case '/testing':
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const Testing(
                  questionAmount: 1,
                  testQuestions: [],
                  testAnswers: [],
                  testRight: [],
                  hiveKey: null,
                ));
      default:
        throw ErrorDescription('Unknown route name: ${settings.name}');
    }
  }
}
