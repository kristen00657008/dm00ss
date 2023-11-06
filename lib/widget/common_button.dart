import 'package:flutter/material.dart';

/// 通用button，只有文字跟點擊事件
class MaterialCommonButton extends StatelessWidget {
  const MaterialCommonButton({
    Key? key,
    this.elevation = 0,
    required this.text,
    this.textColor,
    this.textStyle,
    this.textSize = 17,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(7.0),
    this.onTap,
  }) : super(key: key);

  /// 陰影
  final double elevation;

  /// 文字
  final String text;

  /// 自訂style
  final TextStyle? textStyle;

  /// 文字顏色
  final Color? textColor;

  /// 文字大小
  final double textSize;

  /// 文字顏色
  final Color? backgroundColor;

  /// 點擊事件
  final GestureTapCallback? onTap;

  /// 內部padding
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: Ink(
        color:
            onTap != null ? backgroundColor : backgroundColor?.withOpacity(0.4),
        child: InkWell(
          onTap: onTap,
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Container(
                padding: padding,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      TextStyle(
                        color: textColor,
                        fontSize: textSize,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
