import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firstcroud/view_data.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State <MyApp> {
TextEditingController name =TextEditingController();
TextEditingController email =TextEditingController();
TextEditingController password =TextEditingController();

  // This widget is the root of your application.

Future<void> insertrecord() async
{
  if(name.text!="" || email.text!=""|| password.text!="") {
    try {
      String uri = "https://flutter123456.000webhostapp.com/insert_record.php";
      var res = await http.post(Uri.parse(uri), body: {
        "name":name.text,
        "email":email.text,
        "password":password.text,
      });
      
      var response=jsonDecode(res.body);
      if(response["success"]=="true")
        {
          print(" Record Insert ");
          name.text="";
          email.text="";
          password.text="";
        }
      else{
        print("Some issue");
      }
    }catch (e) {
        print(e);
      }
    }
  else {
    print('Por Favor, Preencha Todos Os Campos');
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Primeiro Flutter'),
        ),
      body: Column(children: [
        Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
            controller: name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text('Seu nome '))
            )
        ),
        Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
            controller: email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text(' Seu e-mail '))
            )
        ),
        Container(
            margin: const EdgeInsets.all(10),
            child: TextFormField(
            controller: password,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text(' Digite sua senha '))
            )
        ),
     Container(
         margin: const EdgeInsets.all(10),
         child: ElevatedButton(
           onPressed: (){
             insertrecord();
  },
           child: Text('Inset'),
         ),
     ),
        Container(
        margin: EdgeInsets.all(10),
          child: Builder(
            builder: (context) {
              return ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => view_data()));
              },
                  child: Text("View Data"));
          },
          ),
      )
      ]),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
