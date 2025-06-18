import 'package:chatapp/component/my_button.dart';
import 'package:chatapp/component/my_textfield.dart';
import 'package:chatapp/service/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();
  final TextEditingController _confirmpwcontroller = TextEditingController();

  //Tap to go to Login
  final void Function ()? onTap;
  RegisterPage({super.key, required this .onTap});

//Register method
  void Register(BuildContext context) async{
    //Getting authService
    final _auth = AuthService();
    if(_pwcontroller.text == _confirmpwcontroller.text){
      try {
        await _auth.signUpWithEmailPassword(_emailcontroller.text, _pwcontroller.text) ;

    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ));
    }
    }
    //If password doesn't match show error
    else{
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Passwords don't match"),
          ),
      );

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            Icon(
              Icons.chat_bubble,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 50),
            //Welcome message
            Text("Let's create an account for you",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20)),
            SizedBox(height: 25),
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailcontroller,
            ),
            SizedBox(height: 10),
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwcontroller,
            ),

            SizedBox(height: 10),
            MyTextfield(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmpwcontroller,
            ),

            SizedBox(height: 10),
            MyButton(
              text: "Register",
              onTap: () => Register(context) ,
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account ",
                  style:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );;
  }
}
