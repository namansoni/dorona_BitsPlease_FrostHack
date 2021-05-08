import 'package:dorona_frost/styles.dart';
import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget {
  String screen='SELF ASSESSMENT TEST';
  UnderConstruction({
    this.screen,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(screen,style: titleTextStyle,),
              Image(
                image: AssetImage('assets/images/underconstruction.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}