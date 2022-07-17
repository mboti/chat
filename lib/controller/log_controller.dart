

import 'package:flutter/material.dart';

class LogController extends StatefulWidget{
  const LogController({Key? key}) : super(key: key);

  @override
  LogControllerState createState()=> LogControllerState();

}

class LogControllerState extends State<LogController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Authentification")),
      body: const Center(
        child: Text("Auth"),
      ),
    );
  }
  
}