import 'package:chat/controller/contacts_controller.dart';
import 'package:chat/controller/messages_controller.dart';
import 'package:chat/controller/profile_controller.dart';
import 'package:chat/model/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAppController extends StatelessWidget{

  User? user = FirebaseHelper().auth.currentUser;

  MainAppController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final current = Theme.of(context).platform;
    if(current != TargetPlatform.iOS){
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.blue,
            activeColor: Colors.black,
            inactiveColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.message)),
              BottomNavigationBarItem(icon: Icon(Icons.supervisor_account)),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle)),
            ],
          ),
          tabBuilder: (BuildContext ctx, int index){
            Widget controllerSelected = controllers()[index];
            return Scaffold(
              appBar: AppBar(title: const Text("Flutter Chat")),
              body: controllerSelected,
            );
          },
      );
    }else{
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Chat"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.message)),
                Tab(icon: Icon(Icons.supervisor_account)),
                Tab(icon: Icon(Icons.account_circle))
              ],
            ),
          ),
            body: TabBarView(
                children: controllers()
            )
        )
      );
    }
  }

  List<Widget> controllers (){
    return [
      MessagesController(),
      ContactsController(),
      ProfileController()
    ];
  }

}