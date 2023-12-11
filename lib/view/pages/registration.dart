import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../controllers/hive_controller.dart';
import '../../widgets/a_elevated_button.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var name = '';
  var email = '';
  var password = '';
  var hasAccount = true;
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
                  bottom: hasAccount
                      ? MediaQuery.of(context).size.height / 3
                      : MediaQuery.of(context).size.height / 2.625,
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
                            hasAccount ? 'Авторизация' : 'Регистрация',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02),
                          child: InkWell(
                            child: Text(
                              hasAccount ? 'Регистрация' : 'Авторизация',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                  ),
                            ),
                            onTap: () {
                              setState(() {
                                hasAccount = !hasAccount;
                                name = '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegistrationTextField(
                          text: 'Email',
                          onChanged: (p0) => email = p0,
                          enabled: true,
                          validator: (value) {
                            if (value == null) {
                              return 'Это поле должно быть заполнено';
                            }
                            if (!value.isValidEmail()) {
                              return 'Email указан неверно';
                            }
                            return null;
                          },
                        ),
                        RegistrationTextField(
                          passwordField: true,
                          text: 'Пароль',
                          onChanged: (p0) => password = p0,
                          enabled: true,
                          validator: (value) {
                            if (value == null) {
                              return 'Это поле должно быть заполнено';
                            }
                            if (value.length < 6) {
                              return 'Пароль должен содержать как минимум 6 символов';
                            }
                            if (value.length > 100) {
                              return 'Пароль должен содержать до 100 символов';
                            }
                            if (!value.isValidPassword()) {
                              return 'Пароль должен содержать латинские буквы, цифры и специальные символы (!@#\$&*~_-)';
                            }
                            return null;
                          },
                        ),
                        // Visibility(
                        //   visible: hasAccount,
                        //   child: TextButton(
                        //     onPressed: () {
                        //       Get.to(() => const PasswordRecovery());
                        //     },
                        //     child: Text(
                        //       'Забыли пароль?',
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .bodyMedium!
                        //           .copyWith(
                        //             decoration: TextDecoration.underline,
                        //           ),
                        //     ),
                        //   ),
                        // ),
                        Visibility(
                          visible: !hasAccount,
                          child: RegistrationTextField(
                            text: 'Имя',
                            onChanged: (p0) => name = p0,
                            enabled: true,
                            validator: (value) {
                              if (value == null) {
                                return 'Это поле должно быть заполнено';
                              }
                              if (value.length < 5) {
                                return 'Имя должно содержать 5 или больше символов';
                              }
                              if (!value.isValidName()) {
                                return 'Имя содержит некорректные символы';
                              }
                              return null;
                            },
                          ),
                        ),
                        Visibility(
                          visible: hasAccount,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.075,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AElevatedButtonExtended(
                text: !hasAccount ? 'Создать аккаунт' : 'Далее',
                onPressed: () async {
                  var oldEmail = '1';
                  if (hasAccount) {
                    if (validateEmail(email) == null &&
                        validatePassword(password) == null) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      );
                      //var userController = Get.find<UserController>();
                      oldEmail =
                          Hive.box('user').get('email', defaultValue: '1');
                      // var message =
                      //     await userController.getInfoByEmail(email, password);
                      // if (message ==
                      //     'User information has been successfully received') {
                      if (oldEmail != Hive.box('user').get('email')) {
                        await HiveController.logout();
                      }
                      //! потом убрать
                      Hive.box('user').put('email', email);
                      Hive.box('user').put('password', password);
                      //!
                      Hive.box('user').put('isLogged', true);
                      // if (userController.user.isEmailConfirmed) {
                      Hive.box('settings').put('initial_screen', '/');
                      Get.offAllNamed('/');
                      // } else {
                      // Get.back();
                      // Get.to(() => const EmailConfirm());
                      // }
                      // } else {
                      //   setState(() {
                      //     if (message == 'User not found') {
                      //       Get.back();
                      //       showAlertDialog(context, 'Данные указаны неверно');
                      //     } else {
                      //       Get.snackbar(
                      //         ':(',
                      //         'Произошла ошибка на сервере',
                      //         snackPosition: SnackPosition.TOP,
                      //         duration: const Duration(seconds: 5),
                      //       );
                      //     }
                      //   });
                      // }
                    } else {
                      if (validateEmail(email) != null) {
                        showAlertDialog(context, '${validateEmail(email)}\n');
                      } else {
                        showAlertDialog(
                            context, '${validatePassword(password)}\n');
                      }
                    }
                  } else {
                    if (validateEmail(email) == null &&
                        validateName(name) == null &&
                        validatePassword(password) == null) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      );
                      // var userController = Get.find<UserController>();
                      // userController.logout();
                      // var message =
                      //     await userController.create(name, email, password);
                      // if (message == 'The user has been successfully created') {
                      //   if (Hive.box('user').get('isLogged') == null) {
                      //     userController.upload();
                      //   }
                      if (oldEmail != Hive.box('user').get('email') &&
                          Hive.box('user').get('isLogged') != null) {
                        HiveController.newAcc();
                      }
                      //! потом убрать
                      Hive.box('user').put('email', email);
                      Hive.box('user').put('name', name);
                      Hive.box('user').put('password', password);
                      //!
                      Hive.box('user').put('isLogged', true);
                      Hive.box('settings')
                          .put('initial_screen', '/basic_competency');
                      Get.offAllNamed('/basic_competency');
                      // Get.back();
                      // Get.to(() => const EmailConfirm());
                      // } else {
                      //   setState(() {
                      //     hasAccount = true;
                      //   });
                      //   if (mounted) {
                      //     Navigator.of(context).pop();
                      //     showAlertDialog(context,
                      //         'Пользователь с таким email уже существует!');
                      //     setState(() {
                      //       hasAccount = true;
                      //     });
                      //   }
                      // }
                    } else {
                      if (validateEmail(email) != null) {
                        showAlertDialog(context, '${validateEmail(email)}\n');
                      } else if (validatePassword(password) != null) {
                        showAlertDialog(
                            context, '${validatePassword(password)}\n');
                      } else {
                        showAlertDialog(context, '${validateName(name)}\n');
                      }
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

class RegistrationTextField extends StatelessWidget {
  const RegistrationTextField({
    Key? key,
    required this.text,
    this.suffixIcon,
    this.onChanged,
    required this.enabled,
    this.validator,
    this.passwordField = false,
  }) : super(key: key);
  final String text;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final bool enabled;
  final String? Function(String?)? validator;
  final bool passwordField;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: w * 0.027),
      margin: EdgeInsets.symmetric(vertical: w * 0.013),
      decoration: BoxDecoration(
        color: Theme.of(context).hoverColor,
        borderRadius: BorderRadius.all(Radius.circular(w * 0.027)),
      ),
      child: TextFormField(
        autocorrect: !passwordField,
        enableSuggestions: !passwordField,
        obscureText: passwordField,
        enabled: enabled,
        validator: validator ??
            (!enabled
                ? (input) =>
                    input!.isValidEmail() ? null : "Email указан неверно"
                : null),
        onChanged: onChanged,
        style: Theme.of(context).textTheme.headlineMedium,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: Theme.of(context).textTheme.headlineMedium,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidName() {
    return RegExp(r'^[a-zA-Z0-9а-яА-Я\s]+$').hasMatch(this);
  }

  bool isValidPassword() {
    return RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_-]).{6,}$')
        .hasMatch(this);
  }
}

String? validateName(String? name) {
  if (name == null || name.isEmpty) {
    return 'Придумайте имя';
  }
  if (name.length > 50) {
    return 'Имя должно содержать менее 50 символов';
  }
  if (!name.isValidName()) {
    return 'Имя содержит некорректные символы';
  }
  return null;
}

String? validateEmail(String? email) {
  if (email == null) {
    return 'Это поле должно быть заполнено';
  }
  if (!email.isValidEmail()) {
    return 'Email указан неверно';
  }
  return null;
}

String? validatePassword(String? password) {
  if (password == null) {
    return 'Это поле должно быть заполнено';
  }
  if (password.length < 6) {
    return 'Пароль должен содержать как минимум 6 символов';
  }
  if (password.length > 100) {
    return 'Пароль должен содержать до 100 символов';
  }
  if (!password.isValidPassword()) {
    return 'Пароль должен содержать латинские буквы, цифры и специальные символы (!@#\$&*~_-)';
  }
  return null;
}
