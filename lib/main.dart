import 'package:flutter/material.dart';
import 'package:usercrudlite/Database.dart';

import 'ClientModel.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
List<Client> testClient=[
  Client(firstName: "Ahmed",lastName: "mohamed",blocked: false),
Client(firstName: "Mohamed",lastName: "Ali",blocked: true),
Client(firstName: "Adel",lastName: "Sami",blocked: true),

  
]


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("flutter crud")),
      body: FutureBuilder<List<Client>>(future: DBProvider.db.getAllClients(),
      builder:(BuildContext context,AsyncSnapshot<List<Client>> snapshot)
      {

        
      }
      ),


    )
    
    
    
     ;
  }
}
