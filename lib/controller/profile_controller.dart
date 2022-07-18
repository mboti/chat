import 'package:flutter/material.dart';

class ProfileController extends StatefulWidget{
  const ProfileController({Key? key}) : super(key: key);

  ProfileControllerState createState() => ProfileControllerState();
}


class ProfileControllerState extends State<ProfileController>{

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile"),);
  }

}