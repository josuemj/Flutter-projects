import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calculator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Configurar la UI del sistema (barra de estado y navegación)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF212121),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFFF9800),
          secondary: const Color(0xFF4CAF50),
          surface: const Color(0xFF212121),
          error: const Color(0xFFEF5350),
        ),
        scaffoldBackgroundColor: const Color(0xFF212121),
      ),
      home: const CalculatorApp(),
    );
  }
}
