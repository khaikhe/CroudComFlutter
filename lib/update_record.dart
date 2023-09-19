import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateRecord extends StatefulWidget {
  final String name;
  final String email;
  final String password;

  UpdateRecord(this.name, this.email, this.password);

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> updateRecord() async {
    try {
      String uri = "https://flutter123456.000webhostapp.com/update_data.php";
      // You can use 'uri' to send data to your server for updating.
      var res=await http.post(Uri.parse(uri),body:
      {
      "name":name.text,
      "email":email.text,
      "password":password.text
      });
      var response=jsonDecode(res.body);
      if(response['success']=='true') {
        print('update');
      }
      else {
        print('some issue ');
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  void initState() {
    super.initState();
    name.text = widget.name;
    email.text = widget.email;
    password.text = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Record')),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text ( 'Seu nome')
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                  label: Text ( ' Digite seu email ')
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: password,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                  label: Text ( 'Digite sua senha ')
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                updateRecord();
              },
              child: Text('Atualizar'),
            ),
          ),
        ],
      ),
    );
  }
}
