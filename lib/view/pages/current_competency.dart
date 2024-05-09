import 'package:assistant/data/grade.dart';
import 'package:assistant/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/competency.dart';
import '../../widgets/a_svg_icon.dart';

class CurrentCompetency extends StatefulWidget {
  const CurrentCompetency({super.key});

  @override
  State<CurrentCompetency> createState() => _CurrentCompetencyState();
}

class _CurrentCompetencyState extends State<CurrentCompetency> {
  var query = '';
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var competencies = Hive.box<Competency>('competencies').values.toList();
    var searchList = [];
    for (var i = 0; i < competencies.length; i++) {
      var grades = competencies[i].grades;
      searchList.addAll(grades!
          .where((element) =>
              element.specName.toLowerCase().contains(query.toLowerCase()))
          .toList());
      print(query);
    }
    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        appBar: SearchAppBar(
          title: Text('Текущие компетенции',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 20)),
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
          onSearchChanged: (text) {
            setState(() => query = text);
          },
          onSearchReset: () {
            setState(() => query = '');
          },
        ),
        body: SafeArea(
            child: Stack(children: [
          StreamBuilder<Object>(
              stream: Hive.box<Grade>('grades').watch(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: searchList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30.0, left: 30.0, right: 30.0),
                          child: Column(
                            children: searchList
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
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 217, 217, 217),
        borderRadius: BorderRadius.all(Radius.circular(w * 0.027)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: h * 0.12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h * 0.02, left: 15.0),
                  child: Text(
                    widget.specName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: h * 0.01, bottom: h * 0.01, left: 15.0),
                  child: Text(
                    widget.gradeName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
