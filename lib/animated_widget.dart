import 'package:flutter/material.dart';

// 如何使用动画animatedWidget 而不是 StatefulWidget
class AnimatedWidgetPage extends StatefulWidget {
  @override
  _AnimatedWidgetPageState createState() => _AnimatedWidgetPageState();
}

class AnimatedLogo extends AnimatedWidget{
  AnimatedLogo({Key key,Animation<double> animation}):super(key: key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }

}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化controller
    //vsync：当页面不可见的时候，做一些资源的回收，需要 with SingleTickerProviderStateMixin
    controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
    ///  Tween是一种动画类型
    animation = Tween<double>(begin: 0,end:300).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {



    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("如何使用动画animatedWidget?"),
              leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),
            ),
            body: AnimatedLogo(animation: animation,)
        )
    );
  }

}
