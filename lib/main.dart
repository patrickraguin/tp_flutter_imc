import 'package:flutter/material.dart';
import 'package:flutter_calculator/l10n/L10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.lime,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              bodyMedium: TextStyle(fontSize: 14)),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.limeAccent,
              foregroundColor: Colors.green)),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[800],
      ),
      themeMode: themeMode,
      themeAnimationDuration: const Duration(seconds: 1),
      home: HomePage(
        setLightTheme: defineLightMode,
        setDarkTheme: defineDarkMode,
      ),
    );
  }

  void defineLightMode() {
    setState(() {
      themeMode = ThemeMode.light;
    });
  }

  void defineDarkMode() {
    setState(() {
      themeMode = ThemeMode.dark;
    });
  }
}
