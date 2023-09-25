import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class UpdateRecord extends StatefulWidget {
  String name;
  String email;
  String password;
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

      // Certifique-se de que os controladores de texto não sejam nulos ou vazios
      if (name != null && email != null && password != null) {
        // Faça algo com a URI, como fazer uma solicitação HTTP, aqui
        print("URI: $uri");
      } else {
        print("Erro: Alguns controladores de texto são nulos ou vazios.");
      }
    } catch (e) {
      print("Erro ao atualizar o registro: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    name.text = widget.name ?? ""; // Use "" como valor padrão se widget.name for nulo
    email.text = widget.email ?? ""; // Use "" como valor padrão se widget.email for nulo
    password.text = widget.password ?? ""; // Use "" como valor padrão se widget.password for nulo
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
                updateRecord();
              },
              child: const Text('Atualizar'),
            ),
          ),
        ],
      ),
    );
  }
}