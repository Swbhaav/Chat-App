import 'package:chatapp/Pages/loginPage.dart';
import 'package:chatapp/Pages/register_page.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/service/auth/auth_gate.dart';
import 'package:chatapp/theme/light_mode.dart';
import 'package:chatapp/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  //This helps flutter to run plugin code to run before runapp
  WidgetsFlutterBinding.ensureInitialized();
  //This is used for connecting firebase to app with correct setting according to platform
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      ChangeNotifierProvider(create: (context) => ThemeProvider(), child: const MyApp(), ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: AuthGate(),
    );
  }
}




