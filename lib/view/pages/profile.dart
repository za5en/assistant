import 'package:assistant/view/pages/current_competency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../controllers/hive_controller.dart';
import '../../data/grade.dart';
import '../../widgets/a_app_bar.dart';
// import '../../widgets/a_image_picker.dart';
import '../../widgets/a_pop_up_menu_data.dart';
import '../../widgets/a_popup_menu.dart';
import '../../widgets/a_svg_icon.dart';
// import 'settings.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  bool showLetters = true;
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<UserController>();
    final theme = Theme.of(context);
    final String name =
        Hive.box('user').get('name', defaultValue: 'Имя Фамилия');
    final List nameWords = name.split(' ');
    String nameLetters = nameWords[0][0];
    if (nameWords.length > 1) {
      nameLetters += nameWords[1][0];
    }
    // if (controller.user.imagePath != 'assets/images/avatar.png' ||
    //     (Hive.box('user').get('isLogged') == null ||
    //         (Hive.box('user').get('isLogged') != null &&
    //             Hive.box('user').get('isLogged') == false))) {
    //   showLetters = false;
    // }
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AAppBar(
        backgroundColor: theme.colorScheme.secondaryContainer,
        size: 50,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: APopupMenu(
              data: [
                APopupMenuData(
                  child: Text(
                    'Текущие компетенции',
                    style: theme.textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Get.to(() => const CurrentCompetency());
                  },
                ),
                // APopupMenuData(
                //   child: Text(
                //     'Настройки',
                //     style: theme.textTheme.bodyLarge,
                //   ),
                //   onTap: () {
                //     Get.to(() => const Settings());
                //   },
                // ),
                APopupMenuData(
                  child: Text(
                    'Выйти из аккаунта',
                    style: theme.textTheme.bodyLarge,
                  ),
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      afterDialog(context, 'Выйти из аккаунта?', () {
                        Navigator.pop(context);
                        // var userController = Get.find<UserController>();
                        // если аккаунт удаляем, то и все данные, что с ним связаны тоже надо чистить
                        if (Hive.box('user').get('isLogged') != false) {
                          Hive.box('user').put('isLogged', false);
                        }
                        if (Hive.box('user').get('name') != null) {
                          Hive.box('user').delete('name');
                          Hive.box('user').delete('email');
                        }
                        // userController.logout();
                        HiveController.logout();
                        HiveController.newAcc();
                        Hive.box('settings')
                            .put('initial_screen', '/registration');
                        Get.offAllNamed('/registration');
                      });
                    });
                  },
                ),
                APopupMenuData(
                  child: Text(
                    'Удалить аккаунт',
                    style: theme.textTheme.bodyLarge,
                  ),
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      afterDialog(context, 'Удалить аккаунт?', () {
                        Navigator.pop(context);
                        // var userController = Get.find<UserController>();
                        // userController.delete();
                        // если аккаунт удаляем, то и все данные, что с ним связаны тоже надо чистить
                        if (Hive.box('user').get('isLogged') != false) {
                          Hive.box('user').put('isLogged', false);
                        }
                        if (Hive.box('user').get('name') != null) {
                          Hive.box('user').delete('name');
                          Hive.box('user').delete('email');
                        }
                        // userController.logout();
                        HiveController.logout();
                        HiveController.newAcc();
                        Hive.box('settings')
                            .put('initial_screen', '/registration');
                        Get.offAllNamed('/registration');
                      });
                    });
                  },
                ),
              ],
              icon: const ASvgIcon(
                assetName: 'assets/images/circle_column.svg',
                color: Colors.black,
                height: 30,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    color: theme.colorScheme.secondaryContainer,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Visibility(
                                visible: showLetters,
                                child: Stack(
                                  children: [
                                    Center(
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .tertiaryContainer,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Center(
                                        child: Text(nameLetters,
                                            style: theme.textTheme.displayLarge
                                                ?.copyWith(fontSize: 23)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Visibility(
                              //   visible: !showLetters,
                              //   child: Obx(() => CircleAvatar(
                              //         radius: 40,
                              //         backgroundImage:
                              //             controller.user.avatar.value.image,
                              //       )),
                              // ),
                              // Visibility(
                              //   visible: Hive.box('user').get('isLogged') !=
                              //               null &&
                              //           Hive.box('user').get('isLogged') == true
                              //       ? true
                              //       : false,
                              //   child: Positioned(
                              //     right: 2.8,
                              //     bottom: 4,
                              //     child: SizedBox(
                              //       height: 25,
                              //       width: 25,
                              //       child: Container(
                              //         decoration: BoxDecoration(
                              //             borderRadius:
                              //                 BorderRadius.circular(25),
                              //             color: Theme.of(context)
                              //                 .colorScheme
                              //                 .tertiaryContainer),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Visibility(
                              //   visible: Hive.box('user').get('isLogged') !=
                              //               null &&
                              //           Hive.box('user').get('isLogged') == true
                              //       ? true
                              //       : false,
                              //   child: Positioned(
                              //     bottom: -8,
                              //     right: -9,
                              //     child: IconButton(
                              //       onPressed: () async {
                              //         final bool photoChanged =
                              //             await showDialog(
                              //                 context: context,
                              //                 builder: (BuildContext context) {
                              //                   return AImagePicker(
                              //                       update: refresh);
                              //                 });
                              //         if (photoChanged) {
                              //           setState(() {
                              //             showLetters = !photoChanged;
                              //           });
                              //         }
                              //       },
                              //       icon: ASvgIcon(
                              //         assetName: 'assets/images/camera.svg',
                              //         color: Theme.of(context)
                              //             .textTheme
                              //             .displayLarge!
                              //             .color,
                              //         height: 20,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 25),
                          child: Text(
                            Hive.box('user')
                                .get('name', defaultValue: 'Имя Фамилия'),
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          // Expanded(
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(
                          //       bottom: 80,
                          //     ),
                          //     child: SingleChildScrollView(
                          //       child: SizedBox(
                          //         width: double.infinity,
                          //         child: StreamBuilder<Object>(
                          //             stream: Hive.box<Grade>('grades').watch(),
                          //             builder: (context, snapshot) {
                          //               List<Grade> grades = [];
                          //               // for (var i = 0;
                          //               //     i <
                          //               //         Hive.box<Grade>('grades')
                          //               //             .length;
                          //               //     i++) {
                          //               //   grades.add(Hive.box<Grade>('grades')
                          //               //           .getAt(i) ??
                          //               //       Grade(
                          //               //           gradeName: '123',
                          //               //           specName: '456',
                          //               //           isFinished: false,
                          //               //           id: 0,
                          //               //           gradeId: 1));
                          //               // }
                          //               grades.addAll(
                          //                   Hive.box<Grade>('grades').values);
                          //               return GradesBlock(
                          //                 grades: grades,
                          //               );
                          //             }),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).iconTheme.color,
        elevation: 0,
        child: const ASvgIcon(assetName: 'assets/images/plus.svg'),
        onPressed: () {
          Get.toNamed('/competency');
        },
      ),
    );
  }

  afterDialog(
    context,
    String title,
    void Function() onTap,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).listTileTheme.tileColor,
            title: Column(
              children: [
                Text(
                  title,
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
                    child: getButton(context, 'Да', onTap)),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.013,
                    ),
                    child: getButton(context, 'Нет', () {
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

class GradesBlock extends StatefulWidget {
  const GradesBlock({super.key, required this.grades});

  final List<Grade> grades;

  @override
  State<GradesBlock> createState() => _GradesBlockState();
}

class _GradesBlockState extends State<GradesBlock> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.grades.length,
        itemBuilder: ((context, index) {
          return GradeCard(
              gradeName: widget.grades[index].gradeName,
              specName: widget.grades[index].specName,
              isFinished: widget.grades[index].isFinished);
        }));
  }
}

class GradeCard extends StatefulWidget {
  const GradeCard({
    super.key,
    required this.gradeName,
    required this.specName,
    required this.isFinished,
    // required this.id
  });

  final String gradeName;
  final String specName;
  final bool isFinished;
  // final int id;

  @override
  State<GradeCard> createState() => _GradeCardState();
}

class _GradeCardState extends State<GradeCard> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(w * 0.027)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Visibility(
              visible: widget.isFinished ? false : true,
              child: InkWell(
                child: const ASvgIcon(
                    assetName: 'assets/images/skills_settings.svg'),
                onTap: () {
                  testDialog(context);
                  //get info about skills
                  // Get.to(() => Skills());
                },
              )),
          InkWell(
            child: ASvgIcon(
                assetName: widget.isFinished
                    ? 'assets/images/test_disabled.svg'
                    : 'assets/images/test_active.svg'),
            onTap: () {
              //get info about test
              Get.toNamed('/testing');
            },
          )
        ],
      ),
    );
  }

  testDialog(
    context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).listTileTheme.tileColor,
            title: Column(
              children: [
                Text(
                  'Пройти тест?',
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
                    child: getButton(context, 'Да', () {
                      // Get.to(() => Skills());
                    })),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.013,
                    ),
                    child: getButton(context, 'Нет', () {
                      Navigator.pop(context);
                    })),
              ),
            ]),
            actionsAlignment: MainAxisAlignment.spaceAround,
          );
        });
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
