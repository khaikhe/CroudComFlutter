import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class view_data extends StatefulWidget {
  view_data({Key? key}) : super (key: key);

  @override
  State<view_data> createState() => _view_dataState();

}

class _view_dataState extends State<view_data> {
  getrecord() async {}
  @override
  void initState() {
    //TODO: Implement initState
    getrecord();
    super.initState();
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:  Text("View Data")),
      body: ListView(),
    );
  }
}