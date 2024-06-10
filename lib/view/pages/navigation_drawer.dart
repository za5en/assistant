import 'package:assistant/view/pages/markdown_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../widgets/a_svg_icon.dart';

class ANavigationDrawer extends StatelessWidget {
  const ANavigationDrawer({super.key, this.compName});

  final String? compName;

  @override
  Widget build(BuildContext context) {
    bool showLetters = true;
    final String name = Hive.box('user').get('name', defaultValue: 'Имя');
    final String surname =
        Hive.box('user').get('surname', defaultValue: 'Фамилия');
    String nameLetters = name[0] + surname[0];
    final theme = Theme.of(context);
    return /*SafeArea(
      child:*/
        Drawer(
      shadowColor: Colors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20))),
      backgroundColor: theme.colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: ASvgIcon(
                      assetName: 'assets/images/menu-button.svg',
                      color: theme.colorScheme.secondary,
                      height: 35,
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: GestureDetector(
                      onTap: () {
                        Get.until((route) => Get.currentRoute == '/');
                      },
                      child: Row(
                        children: [
                          // if (controller.user.imagePath ==
                          //         'assets/images/avatar.png')
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Visibility(
                              visible: showLetters,
                              child: Stack(
                                children: [
                                  Center(
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .tertiaryContainer,
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Center(
                                      child: Text(nameLetters,
                                          style: theme.textTheme.displayLarge
                                              ?.copyWith(fontSize: 17)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 20),
                          //   child: CircleAvatar(
                          //     radius: 30,
                          //     backgroundColor: Theme.of(context)
                          //         .colorScheme
                          //         .tertiaryContainer,
                          //   ),
                          //   //   )
                          //   // else
                          //   //   Padding(
                          //   //     padding: const EdgeInsets.only(right: 30),
                          //   //     child: Avatar(userController: controller),
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Hive.box('user').get('surname',
                                        defaultValue: 'Фамилия') +
                                    '\n' +
                                    Hive.box('user')
                                        .get('name', defaultValue: 'Имя') +
                                    '\n' +
                                    Hive.box('user').get('patronymic',
                                        defaultValue: 'Отчество'),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const NavigationDrawerItem(
                    icon: 'folder',
                    text: 'Файлы',
                    onTap: null,
                  ),
                  const NavigationDrawerItem(
                    icon: 'null',
                    text: 'ООП',
                    onTap: null,
                  ),
                  NavigationDrawerItem(
                    icon: 'null',
                    text: 'ООП_Основы.md',
                    skill: false,
                    onTap: () {
                      Get.until((route) => Get.currentRoute == '/');
                      Get.to(() => const MarkdownView(header: 'ООП_Основы.md'));
                    },
                  ),
                  NavigationDrawerItem(
                    icon: 'null',
                    text: 'ООП_Принципы.md',
                    skill: false,
                    onTap: () {
                      Get.until((route) => Get.currentRoute == '/');
                      Get.to(
                          () => const MarkdownView(header: 'ООП_Принципы.md'));
                    },
                  ),
                  const NavigationDrawerItem(
                    icon: 'null',
                    text: 'Синтаксис',
                    onTap: null,
                  ),
                  NavigationDrawerItem(
                    icon: 'null',
                    text: 'Синтаксис_C#.md',
                    skill: false,
                    onTap: () {
                      Get.until((route) => Get.currentRoute == '/');
                      Get.to(
                          () => const MarkdownView(header: 'Синтаксис_C#.md'));
                    },
                  ),
                  NavigationDrawerItem(
                    icon: 'null',
                    text: 'Синтаксис_С#_доп.md',
                    skill: false,
                    onTap: () {
                      Get.until((route) => Get.currentRoute == '/');
                      Get.to(() =>
                          const MarkdownView(header: 'Синтаксис_С#_доп.md'));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawerItem extends StatelessWidget {
  const NavigationDrawerItem(
      {Key? key, this.onTap, this.icon, this.skill, required this.text})
      : super(key: key);
  final void Function()? onTap;
  final String? icon;
  final bool? skill;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 20),
                child: icon == 'folder'
                    ? const Icon(
                        Icons.folder,
                        color: Colors.black,
                      )
                    : null),
            Padding(
              padding: skill != null && !skill!
                  ? const EdgeInsets.only(left: 20)
                  : const EdgeInsets.all(0.0),
              child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
        ),
      ),
    );
  }
}
