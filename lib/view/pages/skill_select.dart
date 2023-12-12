import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/a_app_bar.dart';
import '../../widgets/a_elevated_button.dart';
import 'new_competency.dart';

class Skills extends StatefulWidget {
  const Skills({super.key, required this.header});
  final String header;

  @override
  State<Skills> createState() => _SkillsState();
}

var skills = ['1', '2', '3', '4', '5'];

class _SkillsState extends State<Skills> {
  var indexes = [];
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AAppBar(
        title:
            Text(widget.header, style: Theme.of(context).textTheme.titleMedium),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              padding: EdgeInsets.all(w * 0.053),
              itemCount: skills.length,
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
                      Text(
                        skills[index],
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      Checkbox(
                        value: isChecked,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                        shape: const CircleBorder(),
                        onChanged: (newValue) {
                          setState(() {
                            // indexes[index] = newValue ?? false;
                            if (indexes.contains(index)) {
                              indexes.remove(index);
                            } else {
                              indexes.add(index);
                            }
                            isChecked = newValue;
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
                if (indexes.length > 1) {
                  //api method set def spec n grade
                  if (widget.header == 'hard') {
                    Get.to(() => const Skills(header: 'soft'));
                  } else {
                    Get.to('/markdown');
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
