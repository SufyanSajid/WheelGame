// ignore_for_file: unnecessary_string_escapes, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_abc/provider/auth.dart';
import 'package:project_abc/screens/verificationOtp.dart';
import 'package:provider/provider.dart';
import '../pallete.dart';
import '../widgets/widgets.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  final phoneController = TextEditingController();

  // Future<void> sendOtp(String phone, BuildContext context) async {
  //   Provider.of<Auth>(context, listen: false).phone = phone;

  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? _phone;
    return Stack(
      children: [
        const BackgroundImage(
          imageUrl: 'https://mcdn.wallpapersafari.com/medium/10/22/f4aH7I.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Flexible(
                child: Center(
                  child: Text(
                    'GameLook',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[500]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // child: Center(
                      //   child: TextFormField(
                      //       decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         prefixIcon: Padding(
                      //           padding: const EdgeInsets.symmetric(
                      //               horizontal: 20.0),
                      //           child: Icon(
                      //             FontAwesomeIcons.phone,
                      //             size: 28,
                      //             color: kWhite,
                      //           ),
                      //         ),
                      //         hintText: "Enter Phone Number ",
                      //         hintStyle: kBodyText,
                      //       ),
                      //       style: kBodyText,
                      //       //validator: RequiredValidator(errorText: 'UserName Required'),
                      //       // onSaved: (value) => _phone = value!,
                      //       controller: phoneController,
                      //       textInputAction: TextInputAction.done,
                      //       keyboardType: TextInputType.phone),
                      // ),
                      child: Center(
                        child: IntlPhoneField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Icon(
                                FontAwesomeIcons.phone,
                                size: 28,
                                color: kWhite,
                              ),
                            ),
                            hintText: "Enter Phone Number ",
                            hintStyle: kBodyText,
                          ),
                          style: kBodyText,
                          controller: phoneController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.phone,
                          onSaved: (value) => _phone = value as String,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kBlue,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Provider.of<Auth>(context, listen: false).phoneNumber =
                            _phone!;
                        print(phoneController.text);
                        Navigator.of(context).pushNamed(Verificatoin.routeName);
                      },
                      child: Text(
                        'Send OTP',
                        style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
