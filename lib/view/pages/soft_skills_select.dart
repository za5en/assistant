import 'package:assistant/view/pages/skill_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/grade.dart';
import '../../widgets/a_app_bar.dart';
import '../../widgets/a_elevated_button.dart';
import 'new_competency.dart';

class SoftSkills extends StatefulWidget {
  const SoftSkills(
      {super.key,
      required this.header,
      required this.specName,
      this.gradeName,
      required this.skillsList,
      this.selectedSkills,
      required this.edit});
  final String header;
  final String specName;
  final String? gradeName;
  final List<String> skillsList;
  final List<int>? selectedSkills;
  final bool edit;

  @override
  State<SoftSkills> createState() => _SoftSkillsState();
}

class _SoftSkillsState extends State<SoftSkills> {
  var indexes = [];
  List<String> selected = [];

  var skills = [
    'skill name',
    'skill name',
    'skill name',
    'skill name',
    'skill name'
  ];

  List<bool?> isChecked = [];

  @override
  void initState() {
    var j = 0;

    if (widget.edit) {
      var skList = [];
      if (widget.header == 'hard') {
        skList = Hive.box('user').get(
            '${widget.specName}_${widget.gradeName}_hard',
            defaultValue: []);
      } else {
        skList = Hive.box('user').get(
            '${widget.specName}_${widget.gradeName}_soft',
            defaultValue: []);
      }
      for (var i = 0; i < widget.skillsList.length; i++) {
        if (skList.isNotEmpty) {
          if (skList[j] == i) {
            isChecked.add(true);
            if (j < skList.length - 1) j++;
          } else {
            isChecked.add(false);
          }
        } else {
          isChecked.add(false);
        }
      }
      indexes = skList;
    } else {
      for (var i = 0; i < widget.skillsList.length; i++) {
        isChecked.add(false);
      }
    }
    super.initState();
  }

  // bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AAppBar(
        title: Text(widget.header,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 28)),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              padding: EdgeInsets.all(w * 0.053),
              itemCount: widget.skillsList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: w * 0.168,
                  margin: EdgeInsets.only(bottom: w * 0.027),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 217, 217, 217),
                    borderRadius: BorderRadius.all(Radius.circular(w * 0.027)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          widget.skillsList[index],
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                      Checkbox(
                        value: isChecked[index],
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                        shape: const CircleBorder(),
                        onChanged: (newValue) {
                          setState(() {
                            // indexes[index] = newValue ?? false;
                            if (indexes.contains(index)) {
                              indexes.remove(index);
                              selected.remove(skills[index]);
                            } else {
                              indexes.add(index);
                              selected.add(skills[index]);
                            }
                            isChecked[index] = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            AElevatedButtonExtended(
              text: 'Ок',
              onPressed: () async {
                if (indexes.isNotEmpty) {
                  //api method set def spec n grade
                  indexes.sort();
                  if (widget.header == 'hard') {
                    if (widget.edit) {
                      //update skills
                      Hive.box('user').put(
                          '${widget.specName}_${widget.gradeName}_hard',
                          indexes);
                    }
                    Get.off(() => Skills(
                          header: 'soft',
                          specName: widget.specName,
                          gradeName: widget.gradeName,
                          skillsList: const [
                            'soft1',
                            'soft2',
                            'soft3',
                            'soft4',
                            'soft5'
                          ],
                          selectedSkills: indexes.cast<int>(),
                          edit: widget.edit,
                        ));
                  } else {
                    if (!widget.edit) {
                      var getGrade = Hive.box<Grade>('grades').values.where(
                          (element) => element.specName == widget.specName);
                      var gradeId = -1;
                      var gradeName = '';
                      if (getGrade.isNotEmpty) {
                        gradeId = getGrade.first.gradeId + 1;
                        if (gradeId == 5) {
                          Get.until((route) => Get.currentRoute == '/');
                          Get.snackbar(
                              'Ошибка', 'Вы уже достигли максимального грейда');
                        }
                        switch (gradeId) {
                          case 1:
                            gradeName = 'middle';
                            break;
                          case 2:
                            gradeName = 'senior';
                            break;
                          case 3:
                            gradeName = 'lead';
                            break;
                          case 4:
                            gradeName = 'boss';
                            break;
                        }
                      } else {
                        gradeId = 0;
                        gradeName = 'junior';
                      }
                      Grade grade = Grade(
                          gradeName: gradeName,
                          specName: widget.specName,
                          isFinished: false,
                          id: Hive.box<Grade>('grades').length,
                          gradeId: gradeId);
                      Hive.box<Grade>('grades').add(grade);
                      await Hive.box('user').put(
                          '${widget.specName}_${gradeName}_hard',
                          widget.selectedSkills);
                      await Hive.box('user')
                          .put('${widget.specName}_${gradeName}_soft', indexes);
                      Get.offNamed('/markdown');
                    } else {
                      //update skills
                      Hive.box('user').put(
                          '${widget.specName}_${widget.gradeName}_soft',
                          indexes);
                      Get.until((route) => Get.currentRoute == '/');
                    }
                  }
                } else {
                  showAlertDialog(
                      context, 'Необходимо указать хотя бы один навык');
                }
              },
              padding: EdgeInsets.only(
                bottom: w * 0.16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
