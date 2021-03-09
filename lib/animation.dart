import 'package:flutter/material.dart';

// 如何使用动画animation
class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化controller
    //vsync：当页面不可见的时候，做一些资源的回收，需要 with SingleTickerProviderStateMixin
    controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
    ///两个点表示返回值，以下两个写法等价：
    /// 1）
    ///animation = Tween<double>(begin: 0,end:300).animate(controller)
    ///..addListener(() { })
    /// 2）
    /// animation = Tween<double>(begin: 0,end:300).animate(controller);
    ///  animation.addListener(() { })
    ///
    ///  Tween：
    ///  在补间动画中，定义了开始点和结束点、时间线以及定义转换时间和速度的曲线。然后由框架计算如何从开始点过渡到结束点。
    ///  在正在执行动画的对象所使用的数据范围之间生成值。例如，Tween可生成从红到蓝之间的色值，或者从0到255；
    animation = Tween<double>(begin: 0,end:300).animate(controller)
    // 监听器，动画的值发生变化时
    ..addListener(() {
      setState(() {
        animationValue = animation.value;
      });
    })
    // 监听器，动画的状态发生变化时
    ..addStatusListener((AnimationStatus status) {
      setState(() {
        animationStatus = status;
      });
    });
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
              title: Text("如何使用动画animation?"),
              leading: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),
            ),
            body: Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      //初始化
                      controller.reset();
                      controller.forward();
                    },
                    child: Text('Start',textDirection: TextDirection.ltr,),
                  ),
                  Text('State:' + animationStatus.toString(),textDirection: TextDirection.ltr,),
                  Text('Value:' + animationValue.toString(),textDirection: TextDirection.ltr,),
                  Container(
                    height: animation.value,
                    width: animation.value,
                    child: FlutterLogo(),
                  )
                ],
              ),
            )
        )
    );
  }

}
