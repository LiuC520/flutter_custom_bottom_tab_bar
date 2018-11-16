import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const double _kTabHeight = 46.0;
const double _kTextAndIconTabHeight = 72.0;

/**
 * TabBar 的tab
 * 就是 和 Tab 一样
 * 用途：可以用在顶部导航，也可以用在底部tab导航
 *
 */
class EachTab extends StatelessWidget {
  const EachTab(
      {Key key,
      this.text,
      this.textStyle,
      this.icon,
      this.child,
      this.padding,
      this.width,
      this.height,
      this.color,
      this.iconPadding,
      this.badge,
      this.badgeNo,
      this.badgeColor})
      : assert(text != null || child != null || icon != null),
        assert(!(text != null &&
            null !=
                child)), // TODO(goderbauer): https://github.com/dart-lang/sdk/issues/34180
        super(key: key);

  final double width; //这个是宽
  final double height; //这个是高
  final EdgeInsetsGeometry iconPadding; // 图片的padding
  final TextStyle textStyle; //文字的样式
  final Color color; //整个tab的背景颜色
  final String text; //文字

  final Widget child; //子view

  final Widget icon; //图标
  final EdgeInsetsGeometry padding; //整个tab的padding

  /// the Badge ,used for unread message ...
  final Widget badge;

  /// the Badge number , unread message ...
  final String badgeNo;

  final Color badgeColor; //badge的颜色，未读消息

  Widget _buildLabelText() {
    return child ??
        Text(
          text,
          softWrap: false,
          overflow: TextOverflow.fade,
          style: textStyle,
        );
  }

  Widget _buildBadge() {
    if (badge == null && (badgeNo == null || badgeNo.isEmpty)) {
      return Container();
    }
    if (badge != null) {
      return badge;
    }
    return Container(
      width: 24,
      padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: badgeColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Text(
        badgeNo,
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    double newHeight;
    Widget label;
    if (icon == null) {
      newHeight = _kTabHeight;
      label = _buildLabelText();
    } else if (text == null) {
      newHeight = _kTabHeight;
      label = icon;
    } else {
      newHeight = _kTextAndIconTabHeight;
      label = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: icon,
              padding: iconPadding ?? EdgeInsets.all(0),
            ),
            _buildLabelText()
          ]);
    }
    return Container(
      padding: padding ?? EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: width,
      color: color ?? Colors.transparent,
      child: SizedBox(
        height: height ?? newHeight,
        child: Center(
          child: Stack(
            fit: StackFit.passthrough,
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(right: 4, top: 4, child: _buildBadge()),
              Container(
                width: width,
                child: label,
              ),
            ],
          ),
          widthFactor: 1.0,
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text, defaultValue: null));
    properties
        .add(DiagnosticsProperty<Widget>('icon', icon, defaultValue: null));
  }
}
