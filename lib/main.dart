import 'package:totofood/pages/welcome_page.dart';
import 'package:totofood/routes.dart';
import 'package:totofood/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String token="";

  @override
  void initState() {
    getToken(); // Call the asynchronous method without await
    super.initState();
  }

  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token') ?? "";  // Handle the case where 'token' is null
      print(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "TocoToco Food",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: token.isEmpty ? const WelcomePage() : const HomeScreen(), // Use isEmpty to check for an empty token
      routes: routes,
    );
  }
}
