import 'package:chatapp/Pages/home_page.dart';
import 'package:chatapp/service/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


// This page or code listens auth stage changes i.e it checks if user is logged in or not

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context,snapshot){
        //user logged in or not
    if(snapshot.hasData){
      return HomePage();
    }

        //user not logged in
    else{
      return LoginOrRegister();
    }
    },
    ),
    );
  }
}
