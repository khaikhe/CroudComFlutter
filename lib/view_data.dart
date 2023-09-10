import 'dart:convert';

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
          if( userdata != null && userdata.isNotEmpty) {
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                leading: Icon(CupertinoIcons.heart),
                title: Text(userdata[index]['uname']??''),
                subtitle: Text(userdata[index]['uemail']??''),
              ),
            );
          }
          else{
            return Center(child: Text("Nenhum dado disponivel"));
          }
        }),
    );
  }
}