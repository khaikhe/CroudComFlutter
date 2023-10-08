import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class update_record extends StatefulWidget {
  String name;
  String email;
  String password;
  update_record(this.name, this.email, this.password);

  @override
  State<update_record> createState() => _update_recordState();
}

class _update_recordState extends State<update_record> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> updaterecord() async {
    try {
      String uri = "https://flutter123456.000webhostapp.com/update_data.php";
      var res = await http.post(Uri.parse(uri), body:
      {
        "name": name.text,
        "email": email.text,
        "password": password.text
      });
      var response = jsonDecode(res.body);
      if(response["success"]=="true")
      {
        print("Atualizado com sucesso!");
      }else {
        print(" Erro ao atualizar ");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    name.text = widget.name ;
    email.text = widget.email ;
    password.text = widget.password ;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(' Atualização ')),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Seu nome',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Seu e-mail',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              controller: password,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite sua senha',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                updaterecord();
              },
              child: const Text('Atualizar'),
            ),
          ),
        ],
      ),
    );
  }
}