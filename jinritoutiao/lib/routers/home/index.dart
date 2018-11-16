import 'package:flutter/material.dart';
import 'package:cool_ui/cool_ui.dart';
import 'dart:math' as m;
import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import '../../rewrite/super_tooltip.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_bottom_tab_bar/tabbar.dart';
import 'package:flutter_custom_bottom_tab_bar/eachtab.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<String> tabs = [];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    tabs = <String>['关注', '推荐', '科技', '懂车帝', '直播', '医疗信息化', '火锅配菜'];
    _tabController =
        new TabController(vsync: this, initialIndex: 0, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.5,
          title: TextField(
            maxLines: 1,
            style: TextStyle(color: Colors.black, fontSize: 14),
            decoration: InputDecoration(
              hintText: '医疗信息化 | 火锅配菜 | 智能家居',
              hintStyle: TextStyle(color: Colors.black, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ), //默认带有下划线，none就是下划线没有了
              contentPadding: EdgeInsets.all(10),
              filled: true,
              fillColor: Colors.white, //filled为true，才能有背景颜色
              prefixIcon: Icon(
                Icons.search,
                size: 20,
                color: Colors.grey,
              ),
            ),
            cursorColor: Colors.black,
            cursorWidth: 1,
            obscureText: false, //显示星星，加密
            onSubmitted: (d) => null,
            onChanged: (d) => null,
          ),
          actions: <Widget>[
            Builder(
                builder: (BuildContext c) => new WillPopScope(
                      onWillPop: _willPopCallback,
                      child: new GestureDetector(
                        onTap: () => onTap(c),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Icon(Icons.photo_camera),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                child: Text(
                                  '发布',
                                  style: TextStyle(fontSize: 10),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
          ],
          bottom: TabContainer(
              // alignment: Alignment.center,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Stack(
                overflow: Overflow.clip,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
                    child: new TabBar(
                      isScrollable: true,
                      controller: _tabController,
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.red,
                      labelPadding: EdgeInsets.all(0),
                      unselectedLabelColor: Colors.black,
                      tabs: <Widget>[
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            height: 46,
                            child: Stack(
                              alignment: AlignmentDirectional.centerStart,
                              children: <Widget>[
                                Positioned(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // borderRadius:
                                      // BorderRadius.all(Radius.circular(4)),
                                      border: Border.all(
                                          width: 2, color: Colors.grey[200]),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle),
                                      height: 8,
                                      width: 8,
                                    ),
                                  ),
                                  right: 0,
                                  top: 10,
                                ),
                                Text(tabs[0])
                              ],
                            )),
                        EachTab(
                          text: tabs[1],
                        ),
                        EachTab(
                          text: tabs[2],
                        ),
                        new EachTab(
                          text: tabs[3],
                        ),
                        new EachTab(
                          text: tabs[4],
                        ),
                        new EachTab(
                          text: tabs[5],
                        ),
                        new EachTab(
                          text: tabs[6],
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child: Row(
                      children: <Widget>[
                        Image.asset('assets/imgs/home_divider.png'),
                        new Icon(Icons.menu),
                      ],
                    ),
                    right: 0,
                    top: 0,
                    bottom: 0,
                  ),
                ],
              ))),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text(tabs[0]),
          Text(tabs[1]),
          Text(tabs[2]),
          Text(tabs[3]),
          Text(tabs[4]),
          Text(tabs[5]),
          Text(tabs[6]),
        ],
      ),
    );
  }

  SuperTooltip tooltip;
  var textStyle = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
  );

  Future<bool> _willPopCallback() async {
    // If the tooltip is open we don't pop the page on a backbutton press
    // but close the ToolTip
    if (tooltip.isOpen) {
      tooltip.close();
      return false;
    }
    return true;
  }

  void onTap(BuildContext c) {
    if (tooltip != null && tooltip.isOpen) {
      tooltip.close();
      return;
    }

    tooltip = SuperTooltip(
        popupDirection: TooltipDirection.down,
        arrowTipDistance: 28.0,
        offset: Offset(-2, 0), //这是箭头的位置
        maxWidth: 150.0,
        hasShadow: false,
        minimumOutSidePadding: 6,
        arrowLength: 10,
        arrowBaseWidth: 12,
        borderRadius: 4,
        borderColor: Colors.transparent,
        backgroundColor: Colors.grey[600],
        showCloseButton: ShowCloseButton.none,
        padding: 0,
        content: new Container(
          height: 180,
          decoration: BoxDecoration(
              color: Colors.grey[600],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.chrome_reader_mode,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        '发图文',
                        style: textStyle,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.white54,
                height: 0,
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.fiber_dvr,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          '拍小视频',
                          style: textStyle,
                        ),
                      )
                    ],
                  )),
              Divider(
                color: Colors.white54,
                height: 0,
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.video_call,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          '发视频',
                          style: textStyle,
                        ),
                      )
                    ],
                  )),
              Divider(
                color: Colors.white54,
                height: 0,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.radio_button_checked,
                      color: Colors.white,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        '提问',
                        style: textStyle,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
    tooltip.show(c);
  }
}
