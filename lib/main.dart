import 'package:assistant/view/resources/color_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

import 'app_router.dart';
import 'controllers/hive_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.systemLocale = await findSystemLocale();
  await initializeDateFormatting();
  await HiveController.initHive();

  runApp(const AssistantApp());
}

class AssistantApp extends StatefulWidget {
  const AssistantApp({super.key});

  @override
  State<AssistantApp> createState() => _AssistantAppState();
}

class _AssistantAppState extends State<AssistantApp> {
  final _appRouter = const AppRouter();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final settingsBox = Hive.box('settings');
    if (settingsBox.get('dark_theme') == null) {
      settingsBox.put('dark_theme',
          MediaQuery.of(context).platformBrightness == Brightness.dark);
    }

    return StreamBuilder<Object>(
      stream: settingsBox.watch(key: 'color_theme'),
      builder: (context, snapshot) {
        final initialRoute =
            settingsBox.get('initial_screen', defaultValue: '/registration');
        final theme =
            colorThemes[settingsBox.get('color_theme')] ?? ColorThemes.classic;
        return StreamBuilder<Object>(
          stream: settingsBox.watch(key: 'dark_theme'),
          builder: (context, snapshot) {
            return GetMaterialApp(
              onGenerateRoute: _appRouter.onGenerateRoute,
              debugShowCheckedModeBanner: false,
              initialRoute: initialRoute,
              theme: settingsBox.get('dark_theme', defaultValue: false)
                  ? theme.dark
                  : theme.light,
            );
          },
        );
      },
    );
  }
}

final colorThemes = {
  'blue': ColorThemes.blue,
  'cyan': ColorThemes.cyan,
  'classic': ColorThemes.classic,
};
