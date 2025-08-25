import 'package:flutter/material.dart';
import 'package:product_useing_api/controllers/product_controller.dart';
import 'package:product_useing_api/views/screens/home_screen.dart';
import 'package:product_useing_api/views/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadToken();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductController(),
      child: const MyApp(),
    ),
  );
}

String? savedToken;

Future<void> loadToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  savedToken = prefs.getString("token");
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: savedToken != null ? const HomeScreen() : const LoginScreen(),
    );
  }
}
