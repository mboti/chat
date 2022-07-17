import 'package:chat/controller/log_controller.dart';
import 'package:chat/controller/main_app_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  /// Permet de nous assurer que les Widgets ajouter au niveau du main soit bien initialisé
  WidgetsFlutterBinding.ensureInitialized();
  /// Initialiser Firebase
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _handleAuth(),
    );
  }
}

Widget _handleAuth() {
  return StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder:(BuildContext context, snapshot){
      if(snapshot.hasData){
        // Accès à l'Application
        return MainAppController();
      }else{
        // Aucun accès
        return LogController();
      }
    },
  );
}
