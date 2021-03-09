import 'package:flutter/material.dart';

// 如何使用动画AnimatedBuilder
class AnimatedBuilderPage extends StatefulWidget {
  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  //构造方法，打括号括起来就是可选
  GrowTransition({this.child,this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child)=> Container(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
      child: child,
    );
  }

}


class _AnimatedBuilderPageState extends State<AnimatedBuilderPage> with SingleTickerProviderStateMixin {
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
            body: GrowTransition(animation: animation,child: LogoWidget(),)
        )
    );
  }

}
