import 'package:assistant/view/pages/registration.dart';
import 'package:assistant/widgets/a_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({super.key});

  @override
  State<ChangeName> createState() => ChangeNameState();
}

class ChangeNameState extends State<ChangeName> {
  var newName = Hive.box('user').get('name', defaultValue: 'Имя');
  var newSurname = Hive.box('user').get('surname', defaultValue: 'Фамилия');
  var newPatron = Hive.box('user').get('patronymic', defaultValue: 'Отчество');

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.053),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Новые данные',
                      style: theme.textTheme.headlineLarge,
                    ),
                  ),
                  RegistrationTextField(
                    text: 'Фамилия',
                    onChanged: (p0) => newSurname = p0,
                    enabled: true,
                    validator: (value) {
                      if (value == null) {
                        return 'Это поле должно быть заполнено';
                      }
                      if (value.length > 50) {
                        return 'Фамилия должна содержать менее 50 символов';
                      }
                      if (!value.isValidName()) {
                        return 'Фамилия содержит некорректные символы';
                      }
                      return null;
                    },
                  ),
                  RegistrationTextField(
                    text: 'Имя',
                    onChanged: (p0) => newName = p0,
                    enabled: true,
                    validator: (value) {
                      if (value == null) {
                        return 'Это поле должно быть заполнено';
                      }
                      if (value.length > 50) {
                        return 'Имя должно содержать менее 50 символов';
                      }
                      if (!value.isValidName()) {
                        return 'Имя содержит некорректные символы';
                      }
                      return null;
                    },
                  ),
                  RegistrationTextField(
                    text: 'Отчество',
                    onChanged: (p0) => newPatron = p0,
                    enabled: true,
                    validator: (value) {
                      if (value == null) {
                        return 'Это поле должно быть заполнено';
                      }
                      if (value.length > 50) {
                        return 'Отчество должно содержать менее 50 символов';
                      }
                      if (!value.isValidName()) {
                        return 'Отчество содержит некорректные символы';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              AElevatedButtonExtended(
                  text: 'Подтвердить',
                  backgroundColor: Theme.of(context).textTheme.bodyLarge!.color,
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (newName.length <= 50 &&
                        newSurname.length <= 50 &&
                        newPatron.length <= 50) {
                      // if (Hive.box('user')
                      //     .get('isLogged', defaultValue: false)) {
                      //   var userController = Get.find<UserController>();
                      //   await userController.changeName(newName);
                      //   await userController.getInfo(
                      //       Hive.box('user').get('id').toString(),
                      //       Hive.box('user').get('password').toString());
                      // }
                      if (mounted) {
                        Hive.box('user').put('name', newName);
                        Hive.box('user').put('surname', newSurname);
                        Hive.box('user').put('patronymic', newPatron);
                        Navigator.pop(context);
                      }
                    } else {
                      Get.snackbar(':(', 'Ошибка! максимум 50 символов');
                    }
                    // setState(() {
                    //   Hive.box('user').put('name', newName);
                    //   Hive.box('user').put('surname', newSurname);
                    //   Hive.box('user').put('patronymic', newPatron);
                    // });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

// class DTextField extends StatelessWidget {
//   final EdgeInsetsGeometry? margin;
//   final String hintText;
//   final void Function(String)? onChanged;
//   final bool? isMultiline;
//   const DTextField(
//       {super.key,
//       this.margin,
//       required this.hintText,
//       this.onChanged,
//       required this.isMultiline});

//   @override
//   Widget build(BuildContext context) {
//     var headline5 = Theme.of(context).textTheme.headlineSmall?.copyWith(
//           fontFamily: 'OpenSans',
//         );
//     double w = MediaQuery.of(context).size.width;

//     return Container(
//       margin: margin ??
//           EdgeInsets.only(
//               top: w * 0.133,
//               left: w * 0.133,
//               right: w * 0.133,
//               bottom: w * 0.027),
//       decoration: BoxDecoration(
//           color: Theme.of(context).listTileTheme.tileColor,
//           borderRadius: BorderRadius.all(Radius.circular(w * 0.027))),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: w * 0.027,
//               ),
//               child: TextField(
//                 maxLines: isMultiline == true ? null : 1,
//                 style: headline5,
//                 cursorColor: Colors.grey,
//                 decoration: InputDecoration(
//                   hintText: hintText,
//                   hintStyle: headline5,
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
