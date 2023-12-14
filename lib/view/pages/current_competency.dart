import 'package:assistant/data/grade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/competency.dart';
import '../../widgets/a_app_bar.dart';
import '../../widgets/a_svg_icon.dart';

class CurrentCompetency extends StatefulWidget {
  const CurrentCompetency({super.key});

  @override
  State<CurrentCompetency> createState() => _CurrentCompetencyState();
}

class _CurrentCompetencyState extends State<CurrentCompetency> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var competencies = Hive.box<Competency>('competencies').values.toList();
    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: AAppBar(
          title: Text('Текущие компетенции',
              style: Theme.of(context).textTheme.titleMedium),
          leading: InkWell(
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
              child: const ASvgIcon(
                assetName: 'assets/images/arrow_left.svg',
                // height: 30,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
            child: Stack(children: [
          StreamBuilder<Object>(
              stream: Hive.box<Grade>('grades').watch(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: competencies.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30.0, left: 30.0, right: 30.0),
                          child: Column(
                            children: competencies[index]
                                .grades!
                                .where((element) => element.isFinished == true)
                                .map(
                                  (e) => InkWell(
                                    child: CurrentGradeCard(
                                        gradeName: e.gradeName,
                                        specName: e.specName),
                                    onTap: () {}, //! добавить что-нибудь
                                  ),
                                )
                                .toList(),
                          ));
                    });
              })
        ])));
  }
}

class CurrentGradeCard extends StatefulWidget {
  const CurrentGradeCard(
      {super.key, required this.gradeName, required this.specName});

  final String gradeName;
  final String specName;

  @override
  State<CurrentGradeCard> createState() => _CurrentGradeCardState();
}

class _CurrentGradeCardState extends State<CurrentGradeCard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 217, 217, 217),
        borderRadius: BorderRadius.all(Radius.circular(w * 0.027)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: w * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.gradeName,
                  style: const TextStyle(color: Colors.black, fontSize: 17),
                ),
                Text(
                  widget.specName,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
