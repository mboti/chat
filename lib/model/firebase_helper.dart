

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

/// comment s'authentifier firebase
class FirebaseHelper{

  final auth = FirebaseAuth.instance;

  /// authentification
  Future<User?> handleSignIn(String mail, String mdp) async{
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: mail, password: mdp);
    final User? user = userCredential.user;
    return user;
  }

  /// create count
  Future<User?> create(String mail, String mdp, String prenom, String nom) async{
    final create = await auth.createUserWithEmailAndPassword(email: mail, password: mdp);
    final User? user = create.user;
    String uid = user!.uid;
    Map<String, String> map = {
      "prenom": prenom,
      "nom": nom,
      "uid": uid
    };
    addUser(uid, map);
    return user;
  }

  /// database
  // Realtime Database : https://chat-49129-default-rtdb.europe-west1.firebasedatabase.app/
  static final entryPoint = FirebaseDatabase.instance.ref();
  final entryUser = entryPoint.child("users");

  addUser(String uid, Map map){
    entryUser.child(uid).set(map);
  }


}