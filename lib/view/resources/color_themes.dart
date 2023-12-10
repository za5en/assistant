import 'package:flutter/material.dart';

class AssistantColorTheme {
  final ThemeData _light;
  ThemeData get light => _light;
  final ThemeData _dark;
  ThemeData get dark => _dark;

  AssistantColorTheme(this._light, this._dark);
}

class ColorThemes {
  static AssistantColorTheme get blue => AssistantColorTheme(
        _light.copyWith(
          colorScheme: _light.colorScheme.copyWith(
            secondary: const Color.fromARGB(255, 0, 184, 252),
            tertiary: const Color.fromARGB(255, 0, 184, 252),
            onTertiary: const Color.fromARGB(255, 38, 71, 86),
            tertiaryContainer: const Color.fromARGB(255, 164, 164, 164),
          ),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 195, 239, 255),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(38, 71, 86, 1.0),
            ),
            titleSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(38, 71, 86, 0.5),
            ),
            titleLarge: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(38, 71, 86, 1),
            ),
            bodyLarge: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(38, 71, 86, 1.0),
            ),
            bodyMedium: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(38, 71, 86, 1.0),
            ),
            bodySmall: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(38, 71, 86, 0.7),
            ),
            headlineMedium: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(38, 71, 86, 0.5),
            ),
            headlineLarge: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(38, 71, 86, 0.7),
            ),
            headlineSmall: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(38, 71, 86, 1.0),
            ),
            labelMedium: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(38, 71, 86, 1),
            ),
            displayMedium: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
        _dark.copyWith(
          colorScheme: _dark.colorScheme.copyWith(
            secondary: const Color.fromARGB(255, 0, 184, 252),
            tertiary: const Color.fromARGB(255, 195, 239, 255),
            onTertiary: const Color.fromARGB(255, 195, 239, 255),
            tertiaryContainer: Colors.white,
          ),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 195, 239, 255),
          ),
        ),
      );

  static AssistantColorTheme get cyan => AssistantColorTheme(
        _light.copyWith(
          colorScheme: _light.colorScheme.copyWith(
            secondary: const Color.fromARGB(255, 116, 200, 204),
            tertiary: const Color.fromARGB(255, 116, 200, 204),
            onTertiary: const Color.fromARGB(255, 12, 56, 58),
            tertiaryContainer: const Color.fromARGB(255, 164, 164, 164),
          ),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 175, 236, 239),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(12, 56, 58, 1.0),
            ),
            titleSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(25, 86, 89, 0.5),
            ),
            titleLarge: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(12, 56, 58, 1),
            ),
            bodyLarge: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(12, 56, 58, 1.0),
            ),
            bodyMedium: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(12, 56, 58, 1.0),
            ),
            bodySmall: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(25, 86, 89, 0.7),
            ),
            headlineMedium: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(25, 86, 89, 0.5),
            ),
            headlineLarge: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(25, 86, 89, 0.7),
            ),
            headlineSmall: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(12, 56, 58, 1.0),
            ),
            labelMedium: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(12, 56, 58, 1),
            ),
            displayMedium: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
        _dark.copyWith(
          colorScheme: _dark.colorScheme.copyWith(
            secondary: const Color.fromARGB(255, 116, 200, 204),
            tertiary: const Color.fromARGB(255, 175, 236, 239),
            onTertiary: const Color.fromARGB(255, 175, 236, 239),
            tertiaryContainer: Colors.white,
          ),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 175, 236, 239),
          ),
        ),
      );

  static AssistantColorTheme get classic => AssistantColorTheme(
        _light.copyWith(
          colorScheme: _light.colorScheme.copyWith(
            secondary: const Color.fromARGB(255, 140, 149, 181),
            tertiary: const Color.fromARGB(255, 140, 149, 181),
            onTertiary: const Color.fromARGB(255, 30, 32, 36),
            tertiaryContainer: const Color.fromARGB(255, 164, 164, 164),
          ),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 184, 194, 228),
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(30, 32, 36, 1.0),
            ),
            titleSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(30, 32, 36, 0.5),
            ),
            titleLarge: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(30, 32, 36, 1),
            ),
            bodyLarge: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(30, 32, 36, 1.0),
            ),
            bodyMedium: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(30, 32, 36, 1.0),
            ),
            bodySmall: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(30, 32, 36, 0.7),
            ),
            headlineMedium: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(30, 32, 36, 0.5),
            ),
            headlineLarge: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(30, 32, 36, 0.7),
            ),
            headlineSmall: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(30, 32, 36, 1.0),
            ),
            labelMedium: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(30, 32, 36, 1),
            ),
            displayMedium: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
        _dark.copyWith(
          colorScheme: _dark.colorScheme.copyWith(
            secondary: const Color.fromARGB(255, 140, 149, 181),
            tertiary: const Color.fromARGB(255, 197, 208, 250),
            onTertiary: const Color.fromARGB(255, 197, 208, 250),
            tertiaryContainer: Colors.white,
          ),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 184, 194, 228),
          ),
        ),
      );
}

final _light = ThemeData(
  fontFamily: 'OpenSans',
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(38, 71, 86, 1.0),
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(38, 71, 86, 0.5),
    ),
    titleLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(38, 71, 86, 1),
    ),
    bodyLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(38, 71, 86, 1.0),
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(38, 71, 86, 1.0),
    ),
    bodySmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(38, 71, 86, 0.7),
    ),
    headlineMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(38, 71, 86, 0.5),
    ),
    headlineLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(38, 71, 86, 0.7),
    ),
    headlineSmall: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(38, 71, 86, 1.0),
    ),
    labelMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(38, 71, 86, 1)),
    displayLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 12,
      color: Color.fromRGBO(22, 27, 28, 1),
    ),
  ),
  colorScheme: const ColorScheme(
    background: Color.fromARGB(255, 247, 249, 251), //! already set
    brightness: Brightness.light,
    error: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    primary: Colors.white, //! already set
    secondary: Colors.white, //! color for different themes
    surface: Colors.white, //! already set
    secondaryContainer: Colors.white, //! already set
    onSecondaryContainer: Color.fromRGBO(215, 215, 215, 1), //! already set
    onTertiaryContainer: Color.fromRGBO(215, 215, 215, 1), //! already set
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: const Color.fromARGB(255, 160, 160, 160),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color.fromARGB(255, 247, 249, 251),
  ),
  dividerTheme: const DividerThemeData(
    color: Color.fromARGB(50, 195, 239, 255),
    thickness: 2,
  ),
);

final _dark = ThemeData(
  fontFamily: 'OpenSans',
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(255, 255, 255, 0.5),
    ),
    titleLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
    bodyLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(255, 255, 255, 0.8),
    ),
    bodySmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(255, 255, 255, 0.7),
    ),
    headlineMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(255, 255, 255, 0.5),
    ),
    headlineLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: Color.fromRGBO(255, 255, 255, 0.7),
    ),
    headlineSmall: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(255, 255, 255, 0.6),
    ),
    labelMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(255, 255, 255, 1)),
    displayLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displayMedium: TextStyle(
      fontSize: 12,
      color: Color.fromRGBO(22, 27, 28, 1),
    ),
  ),
  colorScheme: const ColorScheme(
    background: Color.fromARGB(255, 22, 27, 28), //! already set
    brightness: Brightness.dark,
    error: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    primary: Color.fromARGB(255, 31, 35, 38), //! already set
    secondary: Colors.white, //! color for different themes
    surface: Color.fromRGBO(215, 215, 215, 1), //! already set
    secondaryContainer: Color.fromARGB(255, 33, 37, 38), //! already set
    onSecondaryContainer: Color.fromRGBO(215, 215, 215, 1), //! already set
    onTertiaryContainer: Colors.white, //! already set
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 31, 35, 38),
      foregroundColor: const Color.fromARGB(255, 120, 120, 120),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color.fromARGB(255, 22, 27, 28),
  ),
  dividerTheme: const DividerThemeData(
    color: Color.fromARGB(50, 195, 239, 255),
    thickness: 2,
  ),
);
