import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// 基于ListView实现水平和垂直方式滚动的列表
class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

const CITY_NAMES = ["北京市","上海市","广州市","深圳市","杭州市","重庆市","武汉市","西安市","苏州市","天津市","成都市"];

class _ListViewPageState extends State<ListViewPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基于ListView实现水平和垂直方式滚动的列表'),
        leading: BackButton(),
      ),
        body: Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
              children: _buildList()
          ),
        )
      // body: ListView(
      //   children: _buildList()
      // )
    );
  }

  List<Widget> _buildList(){
    return CITY_NAMES.map((city) => _item(city)).toList();
  }

  Widget _item(city){
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(city,style: TextStyle(color: Colors.white,fontSize: 20),),
    );
  }

}
