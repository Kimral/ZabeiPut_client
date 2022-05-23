import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class CRegistration extends StatefulWidget {
  const CRegistration({Key? key}) : super(key: key);

  @override
  State<CRegistration> createState() => _CRegistrationState();
}

class _CRegistrationState extends State<CRegistration> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Регистрация"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.6,
            child: const FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "Персональные данные",
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.165,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 158, 206, 244),
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const TextField(
                            autocorrect: false,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.zero,
                                hintText: "Номер телефона",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Open Sans Light"
                                )
                            )
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const TextField(
                            autocorrect: false,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.zero,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Open Sans Light"
                                )
                            )
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.165,
            child: const FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "Пароль"
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.165,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 158, 206, 244),
                  borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const TextField(
                          autocorrect: false,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Пароль",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: "Open Sans Light"
                            ),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.zero,
                          )
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const TextField(
                          autocorrect: false,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Повторите пароль",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: "Open Sans Light"
                            ),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.zero,
                          )
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.75,
            child: const FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "Пользовательские соглашения",
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 158, 206, 244),
                  borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child:  FittedBox(
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    )
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Я принимаю ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Open Sans Light"
                              ),
                            ),
                            TextSpan(
                              text: 'пользовательское соглашение',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontFamily: "Open Sans Light"
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, 'terms_of_use');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.7,
              alignment: Alignment.center,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.045,
                child: const FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    "Создать аккаунт",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ),
            style: ButtonStyle(
              backgroundColor:  MaterialStateProperty.all<Color>(const Color.fromARGB(255, 158, 206, 244)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
              ),
            ),
          ),
        ],
      )
    );
  }
}
