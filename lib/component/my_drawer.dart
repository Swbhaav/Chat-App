import 'package:chatapp/Pages/setting_page.dart';
import 'package:chatapp/service/auth/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout() {
    //getting authservice
    final auth = AuthService();
    auth.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Logo
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.message,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 40,
                ),
              ),

              //home list title
              Padding(padding: EdgeInsets.only(left:25.0),
                child: ListTile(
                  title: Text("H O M E", style: TextStyle( color: Theme.of(context).colorScheme.inversePrimary),),
                  leading: Icon(Icons.home,color: Theme.of(context).colorScheme.inversePrimary ,),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              Padding(padding: EdgeInsets.only(left:25.0),
                child: ListTile(
                  title: Text("S E T T I N G",style: TextStyle( color: Theme.of(context).colorScheme.inversePrimary),),
                  leading: Icon(Icons.settings,color: Theme.of(context).colorScheme.inversePrimary ,),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage(),),);
                  },
                ),
              ),
            ],
          ),

          Padding(padding: EdgeInsets.only(left:25.0, bottom: 25.0),
            child: ListTile(
              title: Text("L O G O U T",style: TextStyle( color: Theme.of(context).colorScheme.inversePrimary),),
              leading: Icon(Icons.logout_outlined,color: Theme.of(context).colorScheme.inversePrimary ,),
              onTap: logout,
            ),
          ),

        ],
      ),
    );
  }
}
