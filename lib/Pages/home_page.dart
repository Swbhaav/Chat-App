import 'package:chatapp/Pages/chat_page.dart';
import 'package:chatapp/component/appBar.dart';
import 'package:chatapp/component/user_tile.dart';
import 'package:chatapp/service/auth/auth_service.dart';
import 'package:chatapp/component/my_drawer.dart';
import 'package:chatapp/service/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //Auth and chat service
  final _chatService = ChatService();
  final _authService = AuthService();

  HomePage({super.key});
  void logout() {
    //Get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  //build individual list title for user

  //Build the list of user except the logged in user
  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          //error
          if (snapshot.hasError) {
            return const Text("Error");
          }

          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading..");
          }

          //List view
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          //taped on user goes to chat page
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                        receiverEmail: userData["email"],
                        receiverID: userData["uid"],
                      )));
        },
      );
    } else {
      return Container();
    }
  }
}
