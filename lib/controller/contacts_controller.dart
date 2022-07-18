import 'package:flutter/material.dart';

class ContactsController extends StatefulWidget{
  const ContactsController({Key? key}) : super(key: key);

  ContactsControllerState createState() => ContactsControllerState();
}

class ContactsControllerState extends State<ContactsController>{


  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Contacts"),);
  }

}