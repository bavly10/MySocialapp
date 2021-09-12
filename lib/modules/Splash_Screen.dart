import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:social_app/modules/Home_Screen.dart';
import 'package:social_app/shared/MyColors.dart';
import 'package:social_app/shared/components.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return Home_Screen();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              flex:25,
              fit: FlexFit.tight,
              child: Icon(
                MdiIcons.facebook,
                size: 90,
                color: Colors.blue,
              )),
          Spacer(),
          Flexible(
            flex:-3,
            child: Column(
             mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "F A C E B O O K ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: mygrey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Small_icons(MdiIcons.facebook),
                    Small_icons(MdiIcons.facebookMessenger),
                    Small_icons(MdiIcons.instagram),
                    Small_icons(MdiIcons.whatsapp),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
