import 'package:flutter/material.dart';

class AAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AAppBar({Key? key, this.title, this.leading, this.actions, this.size})
      : super(key: key);
  final Widget? title;
  final Widget? leading;
  final double? size;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: title,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size ?? 70);
}
