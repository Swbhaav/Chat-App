
import 'package:chatapp/component/my_button.dart';
import 'package:chatapp/component/my_textfield.dart';
import 'package:chatapp/service/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _pwcontroller = TextEditingController();

  //Tap to go to register
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  // Login into app
  Login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          _emailcontroller.text, _pwcontroller.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }

    ///
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
            Text("Welcome to Login screen",
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
            MyButton(
              text: "Login",
              onTap: () => Login(context),
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Register now",
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
    );
  }
}
