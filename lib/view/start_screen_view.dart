import 'package:flutter/material.dart';
import 'package:gym_shark_app/common/color_extension.dart';

class StartScreenView extends StatefulWidget {
  const StartScreenView({super.key});

  @override
  State<StartScreenView> createState() => _StartScreenViewState();
}

class _StartScreenViewState extends State<StartScreenView> {
  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: TColors().blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                  child: Image.asset(
                'assets/images/fitness.jpg',
                fit: BoxFit.fitWidth,
                height: mediaHeight * 0.63,
                width: mediaWidth,
              )),
            ],
          ),
          Container(
            width: mediaWidth,
            height: mediaHeight * 0.37,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Get a better life and \nhave healthy body",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 12),
                    child: Text("Spend your fun time at home\n practicing anytime anywhere"),
                  ),
                  Container(
                    width: mediaWidth * 0.8,
                    height: mediaHeight * 0.07,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: TColors().greenColor.withOpacity(0.1), offset: Offset(0, 3))]),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(TColors().greenColor),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ?"),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF25AB75)),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
