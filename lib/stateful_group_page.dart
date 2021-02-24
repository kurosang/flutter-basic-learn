import 'package:flutter/material.dart';

/// StatefulWidget与基础组件
class StateFulGroup extends StatefulWidget {
  @override
  _StateFulGroupState createState() => _StateFulGroupState();
}

class _StateFulGroupState extends State<StateFulGroup> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatefulWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('StatefulWidget与基础组件'),leading: GestureDetector(
          onTap:(){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        )),
        bottomNavigationBar: BottomNavigationBar(currentIndex: _currentIndex,
          onTap: (i){
          setState(() {
            _currentIndex = i;
          });
        },items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color:Colors.grey),
              activeIcon: Icon(Icons.home,color: Colors.blue,),
              label: '首页'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list,color:Colors.grey),
              activeIcon: Icon(Icons.list,color: Colors.blue,),
              label: '列表'
          )
        ],),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child:Text('点我')
        ),
        body: _currentIndex == 0? RefreshIndicator(child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Image.network('https://resource.ghzs.com/image/article/large/601e48996aaf2d6fec12349d.png',
                  width: 100,
                  height: 100,),
                  TextField(
                    //输入文本的样式
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      hintText: '请输入',
                      hintStyle: TextStyle(fontSize: 15)
                    ),

                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(top:10),
                    decoration: BoxDecoration(color: Colors.lightBlueAccent),//container背景
                    child:PageView(
                      children: [
                        _item('Page1',Colors.deepPurple),
                        _item('Page2',Colors.blue),
                        _item('Page3',Colors.green),
                      ],
                    )
                  )
                ],
              ),
            )
          ],
        ), onRefresh: _handleRefresh):Text("list"),
      ),
    );
  }

  // 异步方法
  Future<Null> _handleRefresh() async{
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }
  // 方法生成组件
  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color:color),
      child: Text(title,style: TextStyle(fontSize: 22,color:Colors.white)),
    );
  }
}
