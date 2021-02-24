import 'package:flutter/material.dart';

/// Flutter布局开发
class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'Flutter布局开发',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter布局开发'),leading: GestureDetector(
          onTap:(){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),),
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
                  Row(
                    children: [
                      ClipOval(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network('https://resource.ghzs.com/image/article/large/601e48996aaf2d6fec12349d.png'),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        // 圆角
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Opacity(
                          opacity: 0.6,//60%透明度
                          child: Image.network('https://resource.ghzs.com/image/article/large/601e48996aaf2d6fec12349d.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),)
                    ],
                  ),
                  Container(
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child:
                      PhysicalModel(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        clipBehavior: Clip.antiAlias,// 裁切的边是否抗锯齿
                        child: PageView(
                          children: [
                            _item('Page1',Colors.deepPurple),
                            _item('Page2',Colors.blue),
                            _item('Page3',Colors.green),
                          ],
                        ),
                      )
                  ),
                  Column(
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          decoration: BoxDecoration(color:Colors.green),
                          child: Text("宽度撑满"),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Image.network('https://resource.ghzs.com/image/article/large/601e48996aaf2d6fec12349d.png',
                  width: 100,
                  height: 100,
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Image.network('https://resource.ghzs.com/image/article/large/601e48996aaf2d6fec12349d.png',
                  width: 36,
                  height: 36,
                ),)
              ],
            ),
            Wrap(
              // 创建wrap布局，从左向右进行排列，会自动换行
              spacing: 8, // 水平边距
              runSpacing: 6,// 垂直边距
              children: [
                _chip('Flutter'),
                _chip('进阶'),
                _chip('布局'),
              ],
            )
          ],
        ), onRefresh: _handleRefresh):Column(
          children: [
            Text("list"),
            Expanded(child: Container(
              decoration:BoxDecoration(color:Colors.red) ,
              child: Text('拉伸填满高度'),
            ))
          ],
        ),
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

  _chip(String label) {
    return Chip(label: Text(label),
    avatar: CircleAvatar(
      backgroundColor: Colors.blue.shade900,
      child: Text(label.substring(0,1),style: TextStyle(fontSize: 10)),
    ),);
  }
}
