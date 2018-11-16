# flutter_bottom_tab_bar
# custom_bottom_tab_bar

和另外一个bottom_tab_bar的区别：[https://github.com/LiuC520/flutter_bottom_tab_bar](https://github.com/LiuC520/flutter_bottom_tab_bar)
bottom_tab_bar是通过改变state来控制每一个tab的点击的点击事件，然后改变上面的显示内容，这样的方法比较慢比较卡，并不能满足我们的日常使用

本文的具体的用法参考了，顶部tab的切换来做的，比较快


自定义底部导航tab

#### 官方的tab导航，tabbar无法改变宽高，因此无法自定义

## TabContainer
```
 * 自定义的TabBar
 * 这里是自定义的，实现了PreferredSizeWidget，因为在AppBar的bottom属性里，只支持PreferredSizeWidget这样的widget
同时是此控件还能设置padding

```
*   **```alignment```**,    //对齐方式
*    **```padding```**,//内边距
*   **```Color color```**,// 背景颜色
*   **```Decoration decoration```**,//在child背后显示的装饰样式
*   **```foregroundDecoration```**,//在child之前显示的装饰样式
*   **```width```**,//宽度
*   **```height```**,// 高度
*   **```BoxConstraints constraints```**, //约束
*   **```margin```**,//外边距
*   **```transform```**,//矩阵转换，可以是用缩放，平移、旋转
*   **```child```**,//子view


## EachTab
```
  TabBar 的tab
  就是 和 Tab 一样
  用途：可以用在顶部导航，也可以用在底部tab导航
```

*   **```text```**, //tab的文字
*   **```textStyle```**,//tab文字的样式
*   **```icon,```** // 图标
*   **```child```**,// 可以用不用text和child，可以自定义child
*   **```padding```**,//每个tab的内边距
*   **```width```**,//宽度
*   **```height```**,//高度
*   **```color```**,//背景颜色
*   **```iconPadding```**,// 图标 padding
*   **```badge```**, //未读消息的widget
*   **```badgeNo```**,//未读消息的数量
*   **```badgeColor```** //未读消息的背景颜色


## Example

```

class Entry extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EntryState();
  }
}

class EntryState extends State<Entry> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;
  var titles = ['首页', '西瓜视频', '找人', '小视频', '我的'];
  var icons = [
    Icons.home,
    Icons.play_arrow,
    Icons.child_friendly,
    Icons.fiber_new,
    Icons.mic_none
  ];
  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(vsync: this, initialIndex: 0, length: titles.length);
    _tabController.addListener(() {
      setState(() => _selectedIndex = _tabController.index);
      print("liucheng-> ${_tabController.indexIsChanging}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 46,
        child: Column(
          children: <Widget>[
            Divider(
              height: 2,
            ),
            new TabBar(
              isScrollable: false,
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.red,
              labelPadding: EdgeInsets.all(0),
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                EachTab(
                    width: 70,
                    badgeNo: '12',
                    badgeColor: Colors.red,
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 0
                        ? Image.asset(
                            'assets/imgs/tab_home_selected.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'assets/imgs/tab_home.png',
                            width: 20,
                            height: 20,
                          ),
                    text: titles[0],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
                EachTab(
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 1
                        ? Image.asset(
                            'assets/imgs/tab_xigua_selected.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'assets/imgs/tab_xigua.png',
                            width: 20,
                            height: 20,
                          ),
                    text: titles[1],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
                EachTab(
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 2
                        ? Image.asset(
                            'assets/imgs/tab_find_selected.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'assets/imgs/tab_find.png',
                            width: 20,
                            height: 20,
                          ),
                    text: titles[2],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
                EachTab(
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 3
                        ? Image.asset(
                            'assets/imgs/tab_video_selected.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'assets/imgs/tab_video.png',
                            width: 20,
                            height: 20,
                          ),
                    text: titles[3],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
                EachTab(
                    height: 40,
                    padding: EdgeInsets.all(0),
                    icon: _selectedIndex == 4
                        ? Image.asset(
                            'assets/imgs/tab_me_selected.png',
                            width: 20,
                            height: 20,
                          )
                        : Image.asset(
                            'assets/imgs/tab_me.png',
                            width: 20,
                            height: 20,
                          ),
                    text: titles[4],
                    iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                    textStyle: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
      ),

      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), //设置滑动的效果，这个禁用滑动
        controller: _tabController,
        children: <Widget>[
          Home(),
          Text(titles[1]),
          Text(titles[2]),
          Text(titles[3]),
          Text(titles[4]),
        ],
      ),
    );
  }
}


```
