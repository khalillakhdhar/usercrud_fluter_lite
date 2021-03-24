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
        if(snapshot.hasData)
        {
          return ListView.builder(
            itemCount: snapshot.data.length,
            // ignore: missing_return
            itemBuilder: (BuildContext context,int index)
            {
              Client item=snapshot.data[index];
              return Dismissible(key: UniqueKey(),background: Container(color: Colors.red),
              onDismissed:(direction){
                DBProvider.db.deleteClient(item.id);
              } ,
              child: ListTile(
                title: Text(item.firstName+" "+item.lastName),
                leading: Text(item.id.toString()),
                trailing: Checkbox(
                  onChanged: (bool value)
                  {
                    DBProvider.db.blockOrUnblock(item);
                    setState(() {
                      
                    },
                   
                    );
                  }
                  ,
                   value:item.blocked
                ),
              ),
               );
              
            }
            
            )
        }

      }
      ),


    )
    
    
    
     ;
  }
}
