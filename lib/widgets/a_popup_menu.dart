import 'package:flutter/material.dart';

import 'a_pop_up_menu_data.dart';
import 'a_svg_icon.dart';

class APopupMenu extends StatefulWidget {
  final List<APopupMenuData> data;
  final Widget icon;
  final double? size;
  final void Function(dynamic)? onSelected;
  const APopupMenu(
      {Key? key,
      required this.data,
      required this.icon,
      this.size,
      this.onSelected})
      : super(key: key);

  @override
  APopupMenuState createState() => APopupMenuState();
}

class APopupMenuState extends State<APopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: widget.onSelected,
      elevation: 3,
      color: Theme.of(context).colorScheme.secondaryContainer,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.zero,
      iconSize: 30,
      itemBuilder: (BuildContext context) {
        var result = widget.data.asMap().entries.map((e) => _getPopupMenuItem(
            context,
            e.value.iconData,
            e.value.child,
            e.value.onTap,
            widget.size,
            e.key));
        return result.toList();
      },
      child: widget.icon,
    );
  }
}

PopupMenuItem _getPopupMenuItem(BuildContext context, String? icon,
        Widget child, Function()? onTap, double? size, int value) =>
    PopupMenuItem(
      onTap: onTap,
      value: value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size ?? 120,
            child: child,
          ),
          icon != null
              ? ASvgIcon(
                  assetName: icon,
                  color: Theme.of(context).colorScheme.tertiary,
                  height: 30,
                )
              : Container(),
        ],
      ),
    );
