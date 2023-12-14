import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../widgets/a_svg_icon.dart';

class ANavigationDrawer extends StatelessWidget {
  const ANavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
                        Get.back();
                        // Get.toNamed('/profile');
                      },
                      child: Row(
                        children: [
                          // if (controller.user.imagePath ==
                          //         'assets/images/avatar.png')
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer,
                            ),
                            //   )
                            // else
                            //   Padding(
                            //     padding: const EdgeInsets.only(right: 30),
                            //     child: Avatar(userController: controller),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Hive.box('user')
                                    .get('name', defaultValue: 'name surname'),
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
      {Key? key, this.onTap, this.icon, required this.text})
      : super(key: key);
  final void Function()? onTap;
  final String? icon;
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
            Text(text, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
