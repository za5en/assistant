// import 'package:assistant/view/pages/skill_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/grade.dart';
import '../../widgets/a_elevated_button.dart';
import '../../widgets/a_pop_up_menu_data.dart';
import '../../widgets/a_svg_icon.dart';

class NewCompetency extends StatefulWidget {
  const NewCompetency({super.key});

  @override
  State<NewCompetency> createState() => _NewCompetencyState();
}

class _NewCompetencyState extends State<NewCompetency> {
  var spec = 'Выбор компетенции';
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 2.625,
                  left: w * 0.133,
                  right: w * 0.133,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(w * 0.021),
                          child: Text(
                            'Выбор компетенций',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ParamWithDropDown(
                          popupSize: MediaQuery.of(context).size.width * 0.55,
                          popupMenuButton: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).hoverColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(w * 0.027)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(spec,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: ASvgIcon(
                                    assetName: 'assets/images/triangle.svg',
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          onSelected: (value) {
                            // var specList = userController.getSpecs();
                            var specList = [
                              'C#',
                              'Java',
                              'C++',
                              'DevOps',
                              'Data analyst',
                              'Тестирование'
                            ];
                            Hive.box('user').put('basic', specList[value]);
                            setState(() {
                              spec = specList[value];
                            });
                          },
                          popupMenuData: [
                            //fetch on app load to popupMenuData list
                            APopupMenuData(
                              child: Text('C#',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                            APopupMenuData(
                              child: Text('Java',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                            APopupMenuData(
                              child: Text('C++',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                            APopupMenuData(
                              child: Text('DevOps',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                            APopupMenuData(
                              child: Text('Data analyst',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                            APopupMenuData(
                              child: Text('Тестирование',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AElevatedButtonExtended(
                text: 'Ок',
                onPressed: () async {
                  if (spec != 'Выбор компетенции') {
                    //api method set def spec n grade
                    // Get.off(() => Skills(
                    //       header: 'hard',
                    //       specName: spec,
                    //       skillsList: const [
                    //         'hard1',
                    //         'hard2',
                    //         'hard3',
                    //         'hard4',
                    //         'hard5'
                    //       ],
                    //       edit: false,
                    //     ));
                    var getGrade = Hive.box<Grade>('grades')
                        .values
                        .where((element) => element.specName == spec);
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
                          gradeName = 'Уровень 1';
                          break;
                        case 2:
                          gradeName = 'Уровень 2';
                          break;
                        case 3:
                          gradeName = 'Уровень 3';
                          break;
                        case 4:
                          gradeName = 'Уровень Босс';
                          break;
                      }
                    } else {
                      gradeId = 0;
                      gradeName = 'Уровень 0';
                    }
                    Grade grade = Grade(
                        gradeName: gradeName,
                        specName: spec,
                        isFinished: false,
                        id: Hive.box<Grade>('grades').length,
                        gradeId: gradeId);
                    Hive.box<Grade>('grades').add(grade);
                    Get.offNamed('/markdown');
                  } else {
                    showAlertDialog(
                        context, 'Необходимо указать специализацию');
                  }
                },
                padding: EdgeInsets.only(
                  bottom: w * 0.16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context, String message) {
  Widget getButton(String text, Function() onPressed) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).hoverColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14),
          ),
        ),
      );

  Widget alertDialog = AlertDialog(
    backgroundColor: Theme.of(context).listTileTheme.tileColor,
    title: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.04,
        ),
        child: Column(
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 17),
            ),
          ],
        )),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
          Radius.circular(MediaQuery.of(context).size.width * 0.053)),
    ),
    content: Row(children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.013,
          ),
          child: getButton('Понятно', () {
            Navigator.pop(context);
          }),
        ),
      ),
    ]),
    actionsAlignment: MainAxisAlignment.spaceAround,
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}

class ParamWithDropDown extends StatefulWidget {
  const ParamWithDropDown({
    Key? key,
    required this.popupMenuButton,
    required this.popupMenuData,
    this.popupSize,
    this.onSelected,
  }) : super(key: key);
  final Widget popupMenuButton;
  final double? popupSize;
  final List<APopupMenuData> popupMenuData;
  final void Function(dynamic)? onSelected;

  @override
  ParamWithDropDownState createState() => ParamWithDropDownState();
}

class ParamWithDropDownState extends State<ParamWithDropDown> {
  Widget? popUpMenuWidget;
  @override
  void initState() {
    popUpMenuWidget = widget.popupMenuButton;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: PopupMenu(
        onSelected: (value) {
          setState(() {
            if (widget.popupMenuData[value].displayWidget != null) {
              popUpMenuWidget = widget.popupMenuData[value].displayWidget ??
                  widget.popupMenuData[value].child;
            } else {
              popUpMenuWidget = widget.popupMenuData[value].child;
            }
          });
          if (widget.onSelected != null) {
            widget.onSelected!(value);
          }
        },
        size: widget.popupSize,
        data: widget.popupMenuData,
        icon: widget.popupMenuButton,
      ),
    );
  }
}

class PopupMenu extends StatefulWidget {
  final List<APopupMenuData> data;
  final Widget? icon;
  final double? size;
  final void Function(dynamic)? onSelected;
  const PopupMenu(
      {Key? key,
      required this.data,
      required this.icon,
      this.size,
      this.onSelected})
      : super(key: key);

  @override
  PopupMenuState createState() => PopupMenuState();
}

class PopupMenuState extends State<PopupMenu> {
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
            width: size ?? 100,
            child: child,
          ),
          icon != null
              ? ASvgIcon(
                  assetName: icon,
                  color: Theme.of(context).iconTheme.color,
                  height: 30,
                )
              : Container(),
        ],
      ),
    );
