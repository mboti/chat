import 'package:flutter/material.dart';

class MessagesController extends StatefulWidget{
  const MessagesController({Key? key}) : super(key: key);

  MessagesControllerState createState() => MessagesControllerState();
}


class MessagesControllerState extends State<MessagesController>{

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Messages"),);
  }

}