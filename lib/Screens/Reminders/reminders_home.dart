import 'package:dorona_frost/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors1.dart';

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  List nutrition = [
    'Vitamin C',
    'Vitamin D',
    'Zinc',
    'Elderberry',
    'Turmeric and Garlic'
  ];
  List does = [
    'Drink warm water at regular intervals',
    'Increase the intake of Turmeric, Cumin, Coriander and garlic',
    'Holy basil, Cinnamon, Black pepper, Dry Ginger and Raisin',
    'Apply Ghee, Sesame oil, or Coconut oil in both the nostrils',
    'Inhale steam with Mint leaves and Caraway seeds.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('REMINDERS',
            style: titleTextStyle //TextStyle(color: blueColor),
            ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.purple,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
                child: Text(
              'BOOST YOUR IMMUNITY',
              style: GoogleFonts.aleo(
                color: Colors.green,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                  color: greenColor.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.all(color: Colors.green)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Center(
                  child: Text(
                    'While it is crucial to mention hygiene standards like washing your hands frequently and wearing a mask,  There are also certain methods to improve your immunity which is paramount at this juncture.',
                    style: GoogleFonts.aleo(color: Colors.green, fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: SvgPicture.asset(
                      'assets/images/organic-nutrition-svgrepo-com.svg'),
                ),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: SvgPicture.asset('assets/images/healthy_food.svg')),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: SvgPicture.asset(
                        'assets/images/medicina-dottore-archite-01.svg'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              'Nutrition Suppliments:',
              style: GoogleFonts.aleo(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: blueColor.withOpacity(0.1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(color: blueColor)),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: nutrition.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: Duration(milliseconds: 500),
                        child: SlideAnimation(
                          horizontalOffset: 200,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            child: Text(
                              '${String.fromCharCode(0x2022)}  ${nutrition[index]}',
                              style: GoogleFonts.aleo(color: Colors.deepPurple),
                            ),
                          ),
                        ),
                      );
                    }),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: SvgPicture.asset(
                      'assets/images/bottle-water-plastic.svg'),
                ),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: SvgPicture.asset(
                        'assets/images/coconut-oil-skin-svgrepo-com.svg')),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: SvgPicture.asset(
                        'assets/images/Female-Yoga-Pose-Silhouette-13.svg'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              'Healthy habits to follow:',
              style: GoogleFonts.aleo(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: blueColor.withOpacity(0.1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(color: blueColor)),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: does.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: Duration(milliseconds: 500),
                        child: SlideAnimation(
                          horizontalOffset: 200,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            child: Text(
                              '${String.fromCharCode(0x2022)}  ${does[index]}',
                              style: GoogleFonts.aleo(color: Colors.deepPurple),
                            ),
                          ),
                        ),
                      );
                    }),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              color: Colors.grey.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                        child: Text(
                      'Remembering the remedies and doing them on time is hard?\nNot to worry, Dorona got you covered!',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.aleo(
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    )),
                    GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                        child: Icon(
                          Icons.table_view,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Center(
                        child: Text(
                      'Make a time table and we will remind you',
                      style: subtitleText,
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
