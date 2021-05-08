import 'package:flutter/material.dart';
import 'package:flutter_tt/animated_builder.dart';
import 'package:flutter_tt/animation.dart';
import 'package:flutter_tt/app_lifecycle.dart';
import 'package:flutter_tt/flutter_layout_page.dart';
import 'package:flutter_tt/flutter_widget_lifecycle.dart';
import 'package:flutter_tt/future_page.dart';
import 'package:flutter_tt/launch_page.dart';
import 'package:flutter_tt/less_group_page.dart';
import 'package:flutter_tt/listview_page.dart';
import 'package:flutter_tt/photo_page.dart';
import 'package:flutter_tt/plugin_use.dart';
import 'package:flutter_tt/res_page.dart';
import 'package:flutter_tt/shared_preferences_page.dart';
import 'package:flutter_tt/stateful_group_page.dart';

import 'animated_widget.dart';
import 'gesture_page.dart';

void main() {
  runApp(DynamicTheme());
}


class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness=Brightness.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: 'AkayaTelivigala', // 将该字体运用到全局
        brightness: _brightness, // 夜间模式
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("flutter基础"),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network('https://www.devio.org/img/avatar.png'),
              ElevatedButton(onPressed: (){
                setState(() {
                  _brightness = _brightness == Brightness.dark ? Brightness.light: Brightness.dark;
                });
              },child: Text('切换模式change',style: TextStyle(fontFamily: 'AkayaTelivigala'),),),
              RouteNavigator()
            ],
          ),
        )
      ),
      routes: <String, WidgetBuilder>{
        'plugin': (BuildContext context) => PluginUse(),
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StateFulGroup(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'gesture': (BuildContext context) => GesturePage(),
        'res': (BuildContext context) => ResPage(),
        'launch': (BuildContext context) => LaunchPage(),
        'widgetLifecycle': (BuildContext context) => WidgetLifecycle(),
        'appLifecycle': (BuildContext context) => AppLifecycle(),
        'photoApp': (BuildContext context) => PhotoApp(),
        'animation': (BuildContext context) => AnimationPage(),
        'animatedWidget': (BuildContext context) => AnimatedWidgetPage(),
        'animatedBuilder': (BuildContext context) => AnimatedBuilderPage(),
        'future': (BuildContext context) => FuturePage(),
        'sharedPreferences': (BuildContext context) => SharedPreferencesPage(),
        'listView': (BuildContext context) => ListViewPage(),
      },
    );
  }

}




class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SwitchListTile(title: Text('${byName?'':'不'}通过路由名跳转'),value: byName, onChanged: (val){
          setState(() {
            byName = val;
          });
        }),
        _item('如何使用flutter plugin', PluginUse(), 'plugin'),
        _item('StatelessWidget与基础组件', LessGroupPage(), 'less'),
        _item('StatefulWidget与基础组件', StateFulGroup(), 'ful'),
        _item('Flutter布局开发', FlutterLayoutPage(), 'layout'),
        _item('如何检测用户手势以及处理点击事件', GesturePage(), 'gesture'),
        _item('如何导入和使用 Flutter 的资源文件', ResPage(), 'res'),
        _item('如何打开第三方应用', LaunchPage(), 'launch'),
        _item('Flutter页面生命周期', WidgetLifecycle(), 'widgetLifecycle'),
        _item('Flutter应用的生命周期', AppLifecycle(), 'appLifecycle'),
        _item('拍照APP开发', PhotoApp(), 'photoApp'),
        _item('如何使用动画animation', AnimationPage(), 'animation'),
        _item('如何使用动画animatedWidget', AnimatedWidgetPage(), 'animatedWidget'),
        _item('如何使用动画animatedBuilder', AnimatedBuilderPage(), 'animatedBuilder'),
        _item('Future与FutureBuilder实用技巧', FuturePage(), 'future'),
        _item('shared_preferences本地存储', SharedPreferencesPage(), 'sharedPreferences'),
        _item('基于ListView实现水平和垂直方式滚动的列表', ListViewPage(), 'listView'),
      ],),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: ElevatedButton(onPressed: (){
        // 两种方式跳转
        // 有配置routes则使用第一种
        if(byName){
          Navigator.pushNamed((context), routeName);
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=> page));
        }
      },
      child: Text(title),)
    );
  }
}
