import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dorona_frost/Screens/Reminders/reminders_home.dart';
import 'package:dorona_frost/Screens/under_construction.dart';
import 'package:dorona_frost/Screens/xRayTest/xRayTestHome.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../colors1.dart';
import '../../my_custom_icons.dart';
import '../../styles.dart';

class CustomDrawer extends StatefulWidget {
  BuildContext homecontext;
  CustomDrawer(this.homecontext);
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.person_pin,
                  size: 100,
                  color: iconColor,
                ),
              ),
              Divider(
                color: iconColor,
              ),
              ListTile(
                leading: Icon(
                  MyCustomIcons.heartbeat,
                  size: 30,
                  color: iconColor,
                ),
                title: Text(
                  "Test yourself",
                  style: simpleTextDrawer,
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => XRayTestHome()));
                },
              ),
              ListTile(
                onTap: () async {
                  if (await canLaunch("tel:1075")) {
                    Navigator.of(context).pop();
                    await launch("tel:1075");
                  }
                },
                leading: Icon(
                  MyCustomIcons.phone,
                  size: 30,
                  color: iconColor,
                ),
                title: Text(
                  "Call Helpline(1075)",
                  style: simpleTextDrawer,
                ),
              ),
              ListTile(
                leading: Icon(
                  MyCustomIcons.stethoscope,
                  size: 30,
                  color: iconColor,
                ),
                title: Text(
                  "Dorona Bot",
                  style: simpleTextDrawer,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UnderConstruction(
                        screen: 'DORONA BOT',
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  MyCustomIcons.cog_outline,
                  size: 30,
                  color: iconColor,
                ),
                title: Text(
                  "Settings",
                  style: simpleTextDrawer,
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 30,
                  color: iconColor,
                ),
                title: Text(
                  "Sign out",
                  style: simpleTextDrawer,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  AwesomeDialog(
                    context: widget.homecontext,
                    dialogType: DialogType.INFO,
                    title: "Do you really want to signout?",
                    desc: "",
                    btnOk: ElevatedButton(
                      // color: greenColor,
                      onPressed: () {
                        Navigator.of(widget.homecontext).pop();
                        FirebaseAuth auth = FirebaseAuth.instance;
                        auth.signOut();
                      },
                      child: Text(
                        "Yes",
                        style: buttonText,
                      ),
                    ),
                    btnCancel: ElevatedButton(
                      //color: redColor,
                      onPressed: () {
                        Navigator.of(widget.homecontext).pop();
                      },
                      child: Text(
                        "Cancel",
                        style: buttonText,
                      ),
                    ),
                  )..show();
                },
              ),
              Divider(
                color: iconColor,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Reminders()));
                },
                title: Text(
                  "Reminders",
                  style: simpleTextDrawer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
