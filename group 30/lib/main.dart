import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitalx/app/pages/doc_homepage/docHomePage.dart';
import 'package:hospitalx/app/pages/home_page/home_page.dart';
import 'package:hospitalx/app/pages/login_page/cubit/login_page_cubit.dart';
import 'package:hospitalx/app/pages/login_page/login_page.dart';
import 'package:hospitalx/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HospitalX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(
          const TextTheme(
            displaySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            headlineSmall: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
            titleLarge: TextStyle(
              fontSize: 20,
            ),
            bodyMedium: TextStyle(),
          ),
        ),
      ),
      home: const docHomePage(),
    );
  }
}
