import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dorona_frost/Providers/bottomBarProvider.dart';
import 'package:dorona_frost/Providers/floatingActionButtonProvider.dart';
import 'package:dorona_frost/Providers/userProvider.dart';
import 'package:dorona_frost/styles.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../my_custom_icons.dart';
import 'mainHome.dart';
import '../../colors1.dart';
import 'covidUpdates.dart';
import 'package:dorona_frost/Screens/Drawer/drawer.dart';

class Home extends StatefulWidget {
  User user;
  Home(this.user);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;
  bool showFloating = false;
  @override
  void initState() {
    // TODO: implement initState
    FirebaseFirestore.instance
        .collection('status')
        .doc(widget.user.uid)
        .get()
        .then((value) {
      if (!value.exists) {
        FirebaseFirestore.instance
            .collection('status')
            .doc(widget.user.uid)
            .set({
          'status': 'negative',
          'remark': 'He/she is at low risk',
          'timestamp': DateTime.now().millisecondsSinceEpoch,
          'mobileNumber': widget.user.phoneNumber
        }).then((value) => print("updated"));
      }
    });

    createAndroidNotificationToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final bottomBarProvider = Provider.of<BottomBarProvider>(context);
    final floatingActionButtonProvider =
        Provider.of<FloatingActionButtonProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(context),
      appBar: AppBar(
        title: Text(
          "Dorona",
          style: titleTextStyle,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: appBarColor,
        iconTheme: IconThemeData(
          color: blueColor,
        ),
        actions: [],
      ),
      body: _selectedIndex == 0
          ? MainHome()
          : _selectedIndex == 1
              ? CovidUpdates()
              : Column(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Color.fromRGBO(128, 131, 224, 1),
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.update,
                    text: 'Covid Updates',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }

  void createAndroidNotificationToken() async {
    print("creating token");
    FirebaseMessaging firebaseMessaging = FirebaseMessaging();
    String messagingToken = await firebaseMessaging.getToken();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("androidNotificationToken");
    if (token == null || token == "") {
      await sharedPreferences.setString(
          "androidNotificationToken", messagingToken);
      FirebaseFirestore.instance.collection("Users").doc(widget.user.uid).set(
          {'androidNotificationToken': messagingToken},
          SetOptions(merge: true));
    }
    if (token != null && token != "" && token != messagingToken) {
      await sharedPreferences.setString(
          "androidNotificationToken", messagingToken);
      FirebaseFirestore.instance.collection("Users").doc(widget.user.uid).set(
          {'androidNotificationToken': messagingToken},
          SetOptions(merge: true));
    }
  }
}
