import 'package:flutter/material.dart';

/// StatelessWidget与基础组件
class LessGroupPage  extends StatelessWidget {
  TextStyle textStyle = TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何使用flutter plugin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('StatelessWidget与基础组件'),leading: GestureDetector(
          onTap:(){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        )),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('I am Text',style: textStyle,),
              Icon(Icons.phone_iphone,size: 50,color:Colors.red),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.people),
                  label: Text('asdasd')
              ),
              Divider(
                height:100,//容器高度，不是线的高度，可以理解为上下撑开的高度，但是本身分割线高度没有设置
                indent: 10,//左侧间距
                color: Colors.orange,
              ),
              Card(
                //带有圆角，阴影，边框等效果的卡片
                color:Colors.blue,
                elevation: 5, //阴影
                margin: EdgeInsets.all(10),//上下左右都是10的边距
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text('i am card',style: textStyle,),
                ),
              ),
              AlertDialog(
                title: Text('没有闪'),
                content: Text('大衣了'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
