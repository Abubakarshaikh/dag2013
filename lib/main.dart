import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageScreen(),
    ),
  );
}

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 36),
        constraints: BoxConstraints(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple,
              Colors.purple.shade400,
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  height: 45,
                  image: AssetImage('images/logo.png'),
                ),
                TimeToMove(),
                Card(
                  color: Colors.purple.shade400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 4),
                      Icon(Icons.person),
                      Text("30.0K"),
                      SizedBox(width: 4),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 36),
            SummaryOfQuestion(),
            SizedBox(height: 100),
            InformativeText(),
          ],
        ),
      ),
    );
  }
}

// ---------------------------> 5#: Informative Text <----------------------

class InformativeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Heading',
            style: GoogleFonts.roboto(
              fontSize: 22.0,
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'A package to include fonts from fonts.google.com in your Flutter app.',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

//  -------------------------> 2#: Time To Move <------------------------
class TimeToMove extends StatefulWidget {
  @override
  _TimeToMoveState createState() => _TimeToMoveState();
}

class _TimeToMoveState extends State<TimeToMove> {
  CountDownController controller = CountDownController();
  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      onComplete: () {
        setState(() {
          controller.restart();
        });
      },
      textStyle: TextStyle(
        color: Colors.transparent,
      ),
      controller: controller,
      ringColor: Colors.purple.shade400,
      height: 55,
      width: 55,
      fillColor: Colors.white,
      duration: 10,
    );
  }
}

// ----------------------------> 4#: Summary Of Question <-------------------------------
class SummaryOfQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/line.png'),
        ),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          FillColor(
            width: 30,
          ),
          // Total width 336
          CheckMark(length: 22),
          CheckMark(length: 22),
          CheckMark(length: 22),
          CheckMark(length: 22),
          CheckMark(length: 22),
          CheckMark(length: 22),
          CheckMark(length: 22),
          CheckMark(length: 22),
          CheckMark(length: 22),
          CheckMark(length: 22),
          CheckMark(length: 22),
          CheckMark(length: 22),
        ],
      ),
    );
  }
}

class FillColor extends StatelessWidget {
  final double width;
  FillColor({required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: width,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class CheckMark extends StatelessWidget {
  final double length;
  CheckMark({required this.length});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: length,
      child: Container(
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.check, size: 12, color: Colors.white),
      ),
    );
  }
}
