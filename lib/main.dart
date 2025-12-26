import 'package:fekra/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FekraApp());
}

class FekraApp extends StatelessWidget {
  const FekraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fekra App',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Tajawal'),
      // دعم اللغة العربية
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar', '')],
      locale: const Locale('ar', ''),

      home: HomeScreen(),
    );
  }
}
