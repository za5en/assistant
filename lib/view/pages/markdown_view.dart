import 'package:assistant/view/pages/navigation_drawer.dart';
import 'package:flutter/material.dart';

import '../../widgets/a_app_bar.dart';
import '../../widgets/a_svg_icon.dart';

class MarkdownView extends StatefulWidget {
  const MarkdownView({super.key});

  @override
  State<MarkdownView> createState() => _MarkdownViewState();
}

class _MarkdownViewState extends State<MarkdownView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      drawer: const ANavigationDrawer(),
      backgroundColor: theme.colorScheme.background,
      appBar: AAppBar(
        title:
            Text('filename.md', style: Theme.of(context).textTheme.titleMedium),
        leading: Builder(builder: (context) {
          return InkWell(
            child: Container(
              margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: ASvgIcon(
                assetName: 'assets/images/menu-button.svg',
                color: theme.colorScheme.tertiary,
                height: 30,
              ),
            ),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
    );
  }
}
