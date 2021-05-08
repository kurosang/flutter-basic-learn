import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Future与FutureBuilder实用技巧
class FuturePage extends StatefulWidget {
  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String showResult = "";
  Future<CommonModel> fetchPost() async{
    final response = await http.get('https://cnodejs.org/api/v1/topic/5f322ce36c9ee864cf0e4751');
    Utf8Decoder utf8decoder = Utf8Decoder();//fix 中文乱码
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
    print(result['data']);
    return CommonModel.fromJson(result['data']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future与FutureBuilder实用技巧'),
        leading: BackButton(),
      ),
      body: FutureBuilder<CommonModel>(
        future: fetchPost(),
        // snapshot就是我们future所执行之后的一个快照
        builder: (BuildContext context, AsyncSnapshot<CommonModel> snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
            return Text('Input a URL to start');
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.active:
            return Text("");
          case ConnectionState.done:
            if(snapshot.hasError){
              return Text(
                '${snapshot.error}',
                style: TextStyle(color: Colors.red),
              );
            }else{
              return Column(children: [
                Text('title:${snapshot.data.title}'),
                Text('id:${snapshot.data.id}'),
              ],);
            }
        }
        return Text("");
      },)
    );
  }
}

class CommonModel {
  final String title;
  final String id;

  CommonModel({this.id,this.title,});
  factory CommonModel.fromJson(Map<String,dynamic>json){
    return CommonModel(
      title: json['title'],
      id: json['id'],
    );
  }
}