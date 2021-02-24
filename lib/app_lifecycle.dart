import 'package:flutter/material.dart';

/// 如何获取 Flutter 应用的生命周期
/// WidgetsBindingObserver：是一个Widgets绑定观察器，通过它我们可以监听应用的生命周期、语言等的变化
class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver{
  /// 在初始化的时候，将这个类添加到监听器里面
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter 应用的生命周期'),leading: BackButton(),),
      body: Container(
        child: Text(' Flutter 应用的生命周期'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
    if(state == AppLifecycleState.paused){
      print('App进入后台');
    }else if(state == AppLifecycleState.resumed){
      print('App进入前台');
    }else if(state == AppLifecycleState.inactive){
      //不常用：当应用程序处于非活动状态，并且未接收用户输入时调用，比如：来了个电话
    }else if(state == AppLifecycleState.detached){
      // AppLifecycleState.suspended已更改为AppLifecycleState.detached
      //不常用：应用程序被挂起时调用，它不会在ios上触发
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
