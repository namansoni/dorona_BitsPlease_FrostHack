import 'package:dorona_frost/colors1.dart';
import 'package:dorona_frost/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SetReminder extends StatefulWidget {
  @override
  _SetReminderState createState() => _SetReminderState();
}

class _SetReminderState extends State<SetReminder> {
  Color back = blueColor, fore = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        title: Text(
          'SET REMINDER',
          style: titleTextStyle,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: blueColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Builder(builder:(context)=>ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Container(
              //height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Remind me to:',
                          style:
                              GoogleFonts.aleo(color: blueColor, fontSize: 16),
                        ),
                        ElevatedButton(
                          onPressed: () {
                           
                            Scaffold.of(context).showSnackBar( SnackBar(
                              content: Text('Reminder Added'),
                              action: SnackBarAction(
                                label: 'Add Another',
                                onPressed: (){},
                              ),
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 4, primary: blueColor),
                          child: Text(
                            'ADD',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              style: BorderStyle.none,
                              color: blueColor,
                              width: 2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            'Repeat:',
                            style: GoogleFonts.aleo(
                                color: blueColor, fontSize: 12),
                          ),
                          Container(
                            height: 60,
                            width: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      back = Colors.white;
                                      fore = blueColor;
                                    });
                                  },
                                  child: Text(
                                    'S',
                                    style: TextStyle(color: fore),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.fromRadius(15),
                                    elevation: 4,
                                    primary: back,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      back = Colors.white;
                                      fore = blueColor;
                                    });
                                  },
                                  child: Text(
                                    'M',
                                    style: TextStyle(color: fore),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.fromRadius(15),
                                    elevation: 4,
                                    primary: back,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      back = Colors.white;
                                      fore = blueColor;
                                    });
                                  },
                                  child: Text(
                                    'T',
                                    style: TextStyle(color: fore),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.fromRadius(15),
                                    elevation: 4,
                                    primary: back,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      back = Colors.white;
                                      fore = blueColor;
                                    });
                                  },
                                  child: Text(
                                    'W',
                                    style: TextStyle(color: fore),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.fromRadius(15),
                                    elevation: 4,
                                    primary: back,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      back = Colors.white;
                                      fore = blueColor;
                                    });
                                  },
                                  child: Text(
                                    'T',
                                    style: TextStyle(color: fore),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.fromRadius(15),
                                    elevation: 4,
                                    primary: back,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      back = Colors.white;
                                      fore = blueColor;
                                    });
                                  },
                                  child: Text(
                                    'F',
                                    style: TextStyle(color: fore),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.fromRadius(15),
                                    elevation: 4,
                                    primary: back,
                                    shape: CircleBorder(),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      back = Colors.white;
                                      fore = blueColor;
                                    });
                                  },
                                  child: Text(
                                    'S',
                                    style: TextStyle(color: fore),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.fromRadius(15),
                                    elevation: 4,
                                    primary: back,
                                    shape: CircleBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            child: Text(
                              'Everyday',
                              style: GoogleFonts.aleo(
                                  color: blueColor, fontSize: 10),
                            ),
                            onPressed: () {
                              setState(() {
                                fore = blueColor;
                                back = Colors.white;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            'Set Time',
                            style: GoogleFonts.aleo(
                                color: blueColor, fontSize: 12),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 60,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'H',
                                    labelStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.4),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          style: BorderStyle.none,
                                          color: blueColor,
                                          width: 2),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                height: 20,
                                width: 60,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'M',
                                    labelStyle: TextStyle(
                                      color: Colors.grey.withOpacity(0.4)
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          style: BorderStyle.none,
                                          color: blueColor,
                                          width: 2),
                                    ),
                                  ),
                                ),
                              ),
                              
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      )
    );
  }
}
