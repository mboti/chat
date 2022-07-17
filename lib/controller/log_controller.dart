

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogController extends StatefulWidget{
  const LogController({Key? key}) : super(key: key);

  @override
  LogControllerState createState()=> LogControllerState();

}

class LogControllerState extends State<LogController>{

  bool _log = true;
  String? _adresseMail;
  String? _password;
  String? _prenom;
  String? _nom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Authentification")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width-40,
                height: MediaQuery.of(context).size.height/2,
                child: Card(
                  elevation: 7.5,
                  child: Container(
                    margin: EdgeInsets.only(left: 5,right: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: textFields(),
                    ),
                  ),
                ),
              ),


              TextButton(
                  onPressed: (){
                    setState((){
                      _log = !_log;
                    });
                  },
                  child: Text((_log) ? "Authentification" : "Création de compte"),
              ),

              TextButton(
                //onPressed: _handleLog(),
                onPressed: (){
                  setState((){
                    _handleLog();
                  });
                },
                child:const Text("C'est parti"),
              ),
            ],
          ),
        )
      ),
    );
  }



  _handleLog(){
    if(_adresseMail!=null){
      if(_password !=null){
        if(_log){
          //Connexion
        }else{


          //Création connexion
          if(_prenom!=null){
            if(_nom!=null){

            }else{
              //Alerte Pas de nom
              alerte("Aucun nom n'a été renseignée");
            }
          }else{
            //Alerte Pas de prénom
            alerte("Aucun prénom n'a été renseignée");
          }

        }
      }else{
        //Alerte pas de mot de passe
        alerte("Aucun mot de passe n'a été renseignée");
      }
    }else{
      //Alerte pas de mail
      alerte("Aucune adresse mail n'a été renseignée");
    }
  }


  List<Widget> textFields(){
    List<Widget> widgets = [];

    widgets.add(
        TextField(
          decoration: const InputDecoration(hintText: "Adresse mail"),
          onChanged: (string){
            setState((){
              _adresseMail = string;
            });
          },
        )
    );

    widgets.add(
        TextField(
          decoration: const InputDecoration(hintText: "Mot de passe"),
          obscureText: true,
          onChanged: (string){
            setState((){
              _password = string;
            });
          },
        )
    );

    if(!_log){
      widgets.add(
          TextField(
            decoration: const InputDecoration(hintText: "Prénom"),
            onChanged: (string){
              setState((){
                _prenom = string;
              });
            },
          )
      );

      widgets.add(
          TextField(
            decoration: const InputDecoration(hintText: "Nom"),
            onChanged: (string){
              setState((){
                _nom = string;
              });
            },
          )
      );
    }
    return widgets;
  }


  Future<void> alerte(String message) async{
    Text title = const Text("Erreur");
    Text msg = Text(message);

    TextButton okButton = TextButton(

      // onPressed: ()=> Future.delayed(Duration.zero, () {
      //   Navigator.of(context).pop(context);
      //   //Navigator.of(context).pop(ModalRoute.withName(Navigator.defaultRouteName));
      // }),

      onPressed: ()=> Navigator.of(context).pop(),

      child: const Text("OK"),
    );
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return Theme.of(context).platform == TargetPlatform.iOS
              ? CupertinoAlertDialog(title: title, content: msg,actions: <Widget>[okButton],)
              : AlertDialog(title: title, content: msg,actions: <Widget>[okButton],);
        },
    );
  }

}