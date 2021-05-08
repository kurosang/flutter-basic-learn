import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// shared_preferences本地存储
class SharedPreferencesPage extends StatefulWidget {
  @override
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  String countString = "";
  String localCount = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shared_preferences本地存储'),
        leading: BackButton(),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _incrementCounter,child: Text('Increment Count'),),
          ElevatedButton(onPressed: _getCounter,child: Text('Get Count'),),
          Text(countString,style: TextStyle(fontSize: 20),),
          Text(localCount,style: TextStyle(fontSize: 20),)
        ],
      )
    );
  }

  _incrementCounter() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + ' 1';
    });
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }

  _getCounter() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();
    });
  }
}
