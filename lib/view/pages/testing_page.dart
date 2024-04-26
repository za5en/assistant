import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/competency.dart';
import '../../data/grade.dart';
import '../../widgets/a_app_bar.dart';
import '../../widgets/a_svg_icon.dart';

class Testing extends StatefulWidget {
  const Testing({
    super.key,
    required this.questionAmount,
    required this.testQuestions,
    required this.testAnswers,
    required this.testRight,
    required this.hiveKey,
  });

  final int questionAmount;
  final List<String> testQuestions;
  final List<String> testAnswers;
  final List<int> testRight;
  final dynamic hiveKey;

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  List<bool> isActive = [false];

  @override
  void initState() {
    for (var i = 0; i < widget.questionAmount * 3 - 1; i++) {
      isActive.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AAppBar(
        title: Text('Тест', style: Theme.of(context).textTheme.titleMedium),
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.testQuestions.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, bottom: 10.0),
                                    child: Text(
                                      widget.testQuestions[index],
                                      style: theme.textTheme.bodyMedium,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                          Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              40)),
                                      backgroundColor: isActive[index * 3]
                                          ? Theme.of(context)
                                              .elevatedButtonTheme
                                              .style
                                              ?.foregroundColor
                                          : Theme.of(context)
                                              .elevatedButtonTheme
                                              .style
                                              ?.backgroundColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isActive[index * 3] = true;
                                        isActive[index * 3 + 1] = false;
                                        isActive[index * 3 + 2] = false;
                                      });
                                    },
                                    child: Text(widget.testAnswers[index * 3],
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                          Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              40)),
                                      backgroundColor: isActive[index * 3 + 1]
                                          ? Theme.of(context)
                                              .elevatedButtonTheme
                                              .style
                                              ?.foregroundColor
                                          : Theme.of(context)
                                              .elevatedButtonTheme
                                              .style
                                              ?.backgroundColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isActive[index * 3 + 1] = true;
                                        isActive[index * 3] = false;
                                        isActive[index * 3 + 2] = false;
                                      });
                                    },
                                    child: Text(
                                        widget.testAnswers[index * 3 + 1],
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                        Size(
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                            40),
                                      ),
                                      backgroundColor: isActive[index * 3 + 2]
                                          ? Theme.of(context)
                                              .elevatedButtonTheme
                                              .style
                                              ?.foregroundColor
                                          : Theme.of(context)
                                              .elevatedButtonTheme
                                              .style
                                              ?.backgroundColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isActive[index * 3 + 2] = true;
                                        isActive[index * 3] = false;
                                        isActive[index * 3 + 1] = false;
                                      });
                                    },
                                    child: Text(
                                        widget.testAnswers[index * 3 + 2],
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                  ),
                                ],
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 70),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                              onPressed: () async {
                                int answered = 0;
                                for (var i = 0; i < 4; i++) {
                                  for (var j = i * 3; j < i * 3 + 3; j++) {
                                    if (isActive[j] == true) {
                                      answered++;
                                    }
                                  }
                                }

                                if (answered == 4) {
                                  List<bool> userAnswers = [
                                    false,
                                    false,
                                    false,
                                    false
                                  ];
                                  var index = 0, rights = 0;
                                  for (var answers in widget.testRight) {
                                    userAnswers[index] =
                                        isActive[answers + index * 3];
                                    if (isActive[answers + index * 3]) {
                                      rights++;
                                    }
                                    index++;
                                  }
                                  if (rights == 4) {
                                    Grade grade = Hive.box<Grade>('grades')
                                        .get(widget.hiveKey)!;
                                    grade.isFinished = true;
                                    Hive.box<Grade>('grades')
                                        .put(widget.hiveKey, grade);
                                    HiveList<Grade> grades =
                                        HiveList(Hive.box<Grade>('grades'));
                                    grades.add(Hive.box<Grade>('grades')
                                        .get(widget.hiveKey)!);
                                    Competency comp = Competency();
                                    comp.grades = grades;
                                    await Hive.box<Competency>('competencies')
                                        .add(comp);
                                  }
                                  // switch (rights) {
                                  //   case 0:
                                  //     break;
                                  //   case 1:
                                  //     break;
                                  //   case 2:
                                  //     break;
                                  //   case 3:
                                  //     break;
                                  //   case 4:
                                  //     break;
                                  // }

                                  if (mounted) {
                                    Get.back(); //add resultDialog
                                    if (rights < 4) {
                                      validDialog(context,
                                          'Среди ваших ответов есть неправильные. Тест не пройден, попробуйте ещё раз');
                                    }
                                  }
                                } else {
                                  validDialog(context,
                                      'Чтобы завершить тест, нужно ответить на все вопросы');
                                }
                              },
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                              child: Text('Завершить тест',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  validDialog(context, text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).listTileTheme.tileColor,
            title: Column(
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 14),
                ),
              ],
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            content: Row(children: [
              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.013,
                    ),
                    child: getButton(context, 'Ок', () {
                      Navigator.pop(context);
                    })),
              ),
            ]),
            actionsAlignment: MainAxisAlignment.spaceAround,
          );
        });
  }

  refresh() {
    setState(() {});
  }

  Widget getButton(BuildContext context, String text, Function() onPressed) =>
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).hoverColor,
          borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.width * 0.03)),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
          ),
        ),
      );
}
