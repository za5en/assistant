import 'package:assistant/view/pages/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../widgets/a_app_bar.dart';
import '../../widgets/a_svg_icon.dart';

class MarkdownView extends StatefulWidget {
  const MarkdownView({super.key, this.header, this.compName});

  final String? header;
  final String? compName;

  @override
  State<MarkdownView> createState() => _MarkdownViewState();
}

class _MarkdownViewState extends State<MarkdownView> {
  final _markdownData = """
  # Основные принципы ООП.

#  **• Инкапсуляция** 

  > **Инкапсуляция** в программировании является объединением данных и кода, работающего с этими данными, в большинстве случае это сводится к тому, чтобы не давать доступа к важным данным напрямую. Вместо этого мы создаем ограниченный набор методов, с помощью которых можно работать с нашими данными.
  
#  **• Наследование** 

  > **Наследование** в какой-то степени похоже на биологическое наследование. Вы получаете какие-то черты от своих родителей, но, в то же время, отличаетесь от них. Или представьте это как базовую модель гаджета, к которой затем добавляются улучшенные версии с дополнительными функциями.
  
#  **• Полиморфизм** 

  > **Полиморфизм** немного напоминает универсальный пульт дистанционного управления, который может адаптироваться для управления различными устройствами. В программировании это означает, что один интерфейс может использоваться для управления разными методами, давая разные результаты в зависимости от контекста.
  """;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      drawer: ANavigationDrawer(
        compName: widget.compName,
      ),
      backgroundColor: theme.colorScheme.background,
      appBar: AAppBar(
        title: Text(widget.header ?? 'Выберите файл',
            style: Theme.of(context).textTheme.titleMedium),
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
      body: Visibility(
        visible: widget.header != null,
        child: SafeArea(
          child: Markdown(
            data: _markdownData,
            styleSheet: MarkdownStyleSheet(
                h1: const TextStyle(fontSize: 22),
                p: const TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
