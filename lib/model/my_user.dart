import 'package:firebase_database/firebase_database.dart';

class MyUser{
  String? uid;
  String? prenom;
  String? nom;
  String? imgUrl;
  String? intiales;

  MyUser(DataSnapshot snapshot){
    uid = snapshot.key;
    Map? map = snapshot.value as Map?;
    prenom = map!["prenom"];
    nom = map["nom"];
    imgUrl = map["imgUrl"];
    intiales = map["intiales"];
    if(prenom != null && prenom!.isNotEmpty){
      intiales = prenom![0];
    }
    if (nom != null && nom!.isNotEmpty) {
      if(intiales!=null){
        intiales = "$intiales${nom![0]}";
      }else{
        intiales = nom![0];
      }
    }
  }


  Map toMap(){
    return {
      "prenom": prenom,
      "nom": nom,
      "imgUrl": imgUrl,
      "uid": uid
    };
  }

}