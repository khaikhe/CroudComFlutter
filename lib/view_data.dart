import 'dart:convert';

import 'package:firstcroud/update_record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class view_data extends StatefulWidget {
  view_data({Key? key}) : super (key: key);

  @override
  State<view_data> createState() => _view_dataState();

}

class _view_dataState extends State<view_data> {
  List userdata= [];
  Future<void> delrecord(String id) async {
    try{
       String uri = "https://flutter123456.000webhostapp.com/delete_data.php";

       var res =await http.post(Uri.parse(uri),body:{"id": id});
       var response = jsonDecode(res.body);
       if(response['success'] == 'true'){
         print(" Conta Deletada Com Sucesso! ");
         getrecord();
       }else{
         print(" Falha ao deletar conta! ");
    }
    }
    catch(e){print(e);}
  }

  Future<void> getrecord() async {
      String uri = "https://flutter123456.000webhostapp.com/view_data.php";
    try
        {
          var response= await http.get(Uri.parse(uri));
          setState(() {
            userdata = jsonDecode(response.body);
          });
        }
        catch(e)
        {print(e);}
  }
  @override
  void initState() {
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:  Text(" Ver Historico ")),
      body: ListView.builder(
        itemCount: userdata.length,
        itemBuilder:(context,index) {
          if( userdata.isNotEmpty) {
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                onTap: () { Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => update_record(
                          userdata[index]['uname']??'',
                          userdata[index]['uemail']??'',
                          userdata[index]['upassword']??'',
                        )));},
                leading: const Icon(CupertinoIcons.heart,color: Colors.pinkAccent,
                ),
                title: Text(userdata[index]['uname']??''),
                subtitle: Text(userdata[index]['uemail']??''),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                onPressed: (){
                    delrecord(userdata[index]["uid"]);
              },
              ),
            ),
            );
          }
          else{
            return const Center(child: Text("Nenhum dado disponivel"));
          }
        }),
    );
  }
}