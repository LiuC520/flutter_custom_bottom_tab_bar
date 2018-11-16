library routers;

import 'package:flutter/material.dart';
import 'entry.dart';
// final routerNames = ['row--水平布局', 'transform', 'scale', 'rotation'];

// final routes = {
//   '/row': (BuildContext context) => new Row1(),
//   '/transform': (BuildContext context) => new Transform1(),
//   '/scale': (BuildContext context) => new Scale1(),
//   '/rotation': (BuildContext context) => new Rotation1(),
//   '/': (BuildContext context) => new Home(),
// };

/**
 * 两种路由的写法，上面是直接写到了一起，
 * 下面用了循环的方式生成了路由
 */
/**
 * 路由的名字
 */
List<String> routerNames = [
  'gesture',
];
/**
 * 路由中文
 */
List<String> routerNamesCN = [
  '手势密码',
];
/**
 * 路由的widget
 */
var widgets = [Entry()];

/**
 * 生成路由map
 */
Map<String, WidgetBuilder> getRouters() {
  Map<String, WidgetBuilder> maps = new Map();
  maps.putIfAbsent('/', () => (BuildContext context) => Entry());
  for (var i = 0; i < routerNames.length; i++) {
    maps.putIfAbsent(
        '/${routerNames[i]}', () => (BuildContext context) => widgets[i]);
  }
  return maps;
}
