import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api.dart';
import 'package:flutter_app/ecu_data_screen.dart';
import 'package:flutter_app/preferences_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: depend_on_referenced_packages
import 'package:window_manager/window_manager.dart';

void main() async {
  API.updateBaseURI();

  if (kDebugMode) {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(size: Size(800, 480), center: true);

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  final prefs = PreferencesService.instance;
  await prefs.init();

  runApp(const MyApp());
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(textTheme: GoogleFonts.latoTextTheme().apply(bodyColor: Colors.white, displayColor: Colors.white)),
      initialRoute: '/dash',
      routes: {"/dash": (context) => const EcuDataScreen()},
      builder: (BuildContext context, Widget? child) => Scaffold(body: child!),
    );
  }
}
