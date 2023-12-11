import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../widgets/a_elevated_button.dart';
import '../../widgets/a_pop_up_menu_data.dart';
import '../../widgets/a_svg_icon.dart';

class BasicCompetency extends StatefulWidget {
  const BasicCompetency({super.key});

  @override
  State<BasicCompetency> createState() => _BasicCompetencyState();
}

class _BasicCompetencyState extends State<BasicCompetency> {
  var spec = 'Выбор специализации';
  var grade = 'Выбор грейда';
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
                            'Выбор текущей\nкомпетенции',
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
                          popupSize: 140,
                          popupMenuButton: Hive.box('user').get('basic') == null
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(w * 0.027)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(spec,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                      const ASvgIcon(
                                          assetName:
                                              'assets/images/triangle.svg')
                                    ],
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(w * 0.027)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(Hive.box('user').get('basic'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                      const ASvgIcon(
                                          assetName:
                                              'assets/images/triangle.svg')
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
                              'Testing'
                            ];
                            Hive.box('user').put('basic', specList[value]);
                            spec = specList[value];
                            // switch (value) {
                            //   case 0:
                            //     setState(() {
                            //       Hive.box('user').put('basic', 'C#');
                            //     });
                            //     break;
                            //   case 1:
                            //     setState(() {
                            //       Hive.box('user').put('basic', 'Java');
                            //     });
                            //     break;
                            //   case 2:
                            //     setState(() {
                            //       Hive.box('user').put('basic', 'C++');
                            //     });
                            //     break;
                            //   case 3:
                            //     setState(() {
                            //       Hive.box('user').put('basic', 'DevOps');
                            //     });
                            //     break;
                            //   case 4:
                            //     setState(() {
                            //       Hive.box('user').put('basic', 'Data analyst');
                            //     });
                            //     break;
                            //   case 5:
                            //     setState(() {
                            //       Hive.box('user').put('basic', 'Testing');
                            //     });
                            //     break;
                            // }
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
                              child: Text('Testing',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                          ],
                        ),
                        ParamWithDropDown(
                          popupSize: 140,
                          popupMenuButton: Hive.box('user')
                                      .get('basic_grade') ==
                                  null
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(w * 0.027)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(grade,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                      const ASvgIcon(
                                          assetName:
                                              'assets/images/triangle.svg')
                                    ],
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(w * 0.027)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(Hive.box('user').get('basic_grade'),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                      const ASvgIcon(
                                          assetName:
                                              'assets/images/triangle.svg')
                                    ],
                                  ),
                                ),
                          onSelected: (value) {
                            var gradeList = [
                              'junior',
                              'middle',
                              'senior',
                              'lead',
                              'boss'
                            ];
                            Hive.box('user')
                                .put('basic_grade', gradeList[value]);
                            grade = gradeList[value];
                            // switch (value) {
                            //   case 0:
                            //     setState(() {
                            //       Hive.box('user').put('basic_grade', 'junior');
                            //     });
                            //     break;
                            //   case 1:
                            //     setState(() {
                            //       Hive.box('user').put('basic_grade', 'middle');
                            //     });
                            //     break;
                            //   case 2:
                            //     setState(() {
                            //       Hive.box('user').put('basic_grade', 'senior');
                            //     });
                            //     break;
                            //   case 3:
                            //     setState(() {
                            //       Hive.box('user').put('basic_grade', 'lead');
                            //     });
                            //     break;
                            //   case 4:
                            //     setState(() {
                            //       Hive.box('user').put('basic_grade', 'boss');
                            //     });
                            //     break;
                            // }
                          },
                          popupMenuData: [
                            APopupMenuData(
                              child: Text('junior',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                            APopupMenuData(
                              child: Text('middle',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                            APopupMenuData(
                              child: Text('senior',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                            APopupMenuData(
                              child: Text('lead',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                            APopupMenuData(
                              child: Text('boss',
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
                  if (spec != 'Выбор специализации' &&
                      grade != 'Выбор грейда') {
                    //api method set def spec n grade
                    await Hive.box('settings').put('initial_screen', '/');
                    Get.offNamed('/');
                  } else {
                    if (spec == 'Выбор специализации' &&
                        grade == 'Выбор грейда') {
                      showAlertDialog(
                          context, 'Необходимо указать специализацию и грейд');
                    } else if (spec != 'Выбор специализации' &&
                        grade == 'Выбор грейда') {
                      showAlertDialog(context, 'Необходимо указать грейд');
                    } else {
                      showAlertDialog(
                          context, 'Необходимо указать специализацию');
                    }
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
