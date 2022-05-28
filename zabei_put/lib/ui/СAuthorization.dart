import 'package:flutter/material.dart';

class CAuthorization extends StatelessWidget {
  const CAuthorization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 158, 206, 244),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)
                  )
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.0875,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "ЗАБЕЙ",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: "Open Sans Extra Bold",
                                ),
                              )
                            ),
                            //padding: EdgeInsets.all(0),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.0875,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "ЗАБЕЙ",
                                style: TextStyle(
                                  color: Color.fromARGB(165, 0, 0, 0),
                                  fontFamily: "Open Sans Extra Bold"
                                ),
                              )
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.0875,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "ЗАБЕЙ",
                                  style: TextStyle(
                                    color: Color.fromARGB(125, 0, 0, 0),
                                    fontFamily: "Open Sans Extra Bold"
                                  ),
                                )
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.0875,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "ЗАБЕЙ",
                                  style: TextStyle(
                                      color: Color.fromARGB(55, 0, 0, 0),
                                      fontFamily: "Open Sans Extra Bold"
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: const Image(
                          image: AssetImage('assets/Images/Authorization/auth_1.jpg')
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.07,
                    )
                  ],
                ),
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.065,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const FittedBox(
                      fit: BoxFit.contain,
                      clipBehavior: Clip.none,
                      child: Text(
                        'Авторизация',
                        style: TextStyle(
                          fontFamily: "Arista Pro Light"
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.85,
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
                            width: MediaQuery.of(context).size.width * 0.055
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.035,
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: const FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                'Логин:',
                              )
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: const TextField(
                              autocorrect: false,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.zero,
                                hintText: "номер тел. или E-mail",
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
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.055
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.035,
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: const FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text('Пароль:')
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: const TextField(
                              autocorrect: false,
                              obscureText: true,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.zero,
                              )
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          'registration'
                        );
                      },
                      child: const Text(
                        "Регистрация",
                        style: TextStyle(
                          color: Color.fromARGB(255, 96, 197, 241),
                        ),
                      ),
                    )
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                            'password_recovery'
                        );
                      },
                      child: const Text(
                        "Не помню пароль",
                        style: TextStyle(
                          color: Color.fromARGB(255, 96, 197, 241),
                        ),
                      ),
                    )
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'main_map');
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.7,
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.045,
                    child: const FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        "ВХОД",
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
            ]
        ),
      ),
    );
  }
}