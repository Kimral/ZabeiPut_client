import 'package:flutter/material.dart';

class CAuthorization extends StatefulWidget {
  const CAuthorization({Key? key}) : super(key: key);

  @override
  State<CAuthorization> createState() => _CAuthorizationState();
}

class _CAuthorizationState extends State<CAuthorization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            children: [
              SizedBox(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 158, 206, 244),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)
                    )
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "Авторизация",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28
                        ),
                      ),
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.20,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 158, 206, 244),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.18,
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    child: const Text(
                                      "Логин",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                         fontSize: 14,

                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.18,
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    child: const Text(
                                      "Пароль",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    //margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.55,
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    child: const TextField(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: 'Номер телефона или E-mail',
                                        hintStyle: TextStyle(
                                          fontSize: 12
                                        )
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width * 0.55,
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    child: const TextField(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: 'Ваш пароль',
                                        hintStyle: TextStyle(
                                            fontSize: 12
                                        )
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.cyan,
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.10,
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 158, 206, 244),
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  child: const Text(
                    "Вход",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 27
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }
}
