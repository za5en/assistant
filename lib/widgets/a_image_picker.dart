import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'a_svg_icon.dart';

class AImagePicker extends StatefulWidget {
  const AImagePicker({Key? key, required this.update}) : super(key: key);
  final Function() update;
  @override
  AImagePickerState createState() => AImagePickerState();
}

class AImagePickerState extends State<AImagePicker> {
  List<bool> isActive = [false, false];

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<UserController>();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        // if (controller.user.imagePath == 'assets/images/avatar.png') {
        //   Get.back(result: false);
        //   return Future.value(false);
        // } else {
        //   Get.back(result: true);
        return Future.value(true);
        // }
      },
      child: AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(w * 0.05)),
        ),
        content: SizedBox(
          height: h * 0.155,
          width: w * 0.6,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: isActive[0]
                        ? Theme.of(context).colorScheme.background
                        : Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ASvgIcon(
                          assetName: 'assets/images/gallery.svg',
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        Text('Из галереи',
                            style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        isActive[0] = true;
                        isActive[1] = false;
                      });
                    },
                  ),
                ),
                Container(
                  width: 100,
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: isActive[1]
                        ? Theme.of(context).colorScheme.background
                        : Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ASvgIcon(
                          assetName: 'assets/images/camera_big.svg',
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        Text('Сделать фото',
                            style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        isActive[0] = false;
                        isActive[1] = true;
                      });
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('Выбрать',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 16)),
                ),
                onTap: () async {
                  if (isActive[0]) {
                    // var controller = Get.find<UserController>();
                    // await controller.updatePhoto(ImageSource.gallery);
                    // await controller.fetchPhoto();
                    // if (mounted) {
                    //   if (controller.user.imagePath ==
                    //       'assets/images/avatar.png') {
                    //     Get.back(result: false);
                    //   } else {
                    //     Get.back(result: true);
                    //   }
                    // }
                  } else if (isActive[1]) {
                    // var controller = Get.find<UserController>();
                    // await controller.updatePhoto(ImageSource.camera);
                    // await controller.fetchPhoto();
                    // if (mounted) {
                    //   if (controller.user.imagePath ==
                    //       'assets/images/avatar.png') {
                    //     Get.back(result: false);
                    //   } else {
                    //     Get.back(result: true);
                    //   }
                    // }
                  } else {
                    Get.snackbar(
                        'Так не пойдет', 'Сначала выбери один из вариантов');
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
