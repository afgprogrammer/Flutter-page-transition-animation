import 'dart:ui';

import 'package:day6_fitness/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> _repeat = [
    'All type',
    'Chest',
    'Cardio',
    'Lower'
  ];

  int _selectedRepeat = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xAA151919),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mohammad", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
            Text("VIP Member", style: TextStyle(color: Colors.grey[500], fontSize: 14),),
          ],
        ),
        leading: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
            child: CircleAvatar(
              backgroundImage: ExactAssetImage('assets/images/two.jpg'),
            ),
          ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.menu, color: Colors.white, size: 30,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),
                FadeAnimation(1.5, Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Color(0xAA282D2D),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xAA151919),
                          shape: BoxShape.circle
                        ),
                        width: 60,
                        height: 60,
                        child: Center(
                          child: Icon(Icons.directions_run_sharp, color: Colors.white, size: 28,),
                        ),
                      ),
                      // SizedBox(width: 16,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Summer Challenge", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF5D6262)),),
                          SizedBox(height: 5,),
                          Text("5km marathon", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),)
                        ],
                      ),
                      SizedBox(width: 16,),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xAA373C3C),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Icon(Icons.keyboard_double_arrow_right_outlined, size: 28, color: Color(0xFFD0DCDE),))
                    ],
                  ),
                )),
                SizedBox(height: 16,),
                Divider(color: Color(0xFF181D1E), thickness: 2, indent: 10,endIndent: 10,),
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Workout Program", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFFD0DCDE)),),
                    Text("See All", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFD0DCDE)),),
                  ],
                ),
                SizedBox(height: 24,),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _repeat.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedRepeat = index;
                          });
                        },
                        child: FadeAnimation((1.2 + index) / 4, Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: _selectedRepeat == index ? Color(0xAA282D2D) : Colors.transparent,
                          ),
                          margin: EdgeInsets.only(right: 20),
                          child: Center(child: Text(_repeat[index], 
                            style: TextStyle(fontSize: 18, color: _selectedRepeat == index ? Colors.white : Color(0xFF5D6262), fontWeight: FontWeight.w500),)
                          ),
                        )),
                      );
                    },
                  )
                ),
                SizedBox(height: 24,),
                Column(
                  children: [
                    makeItem(image: "assets/images/two.jpg", title: "Full Body\nExercise"),
                    makeItem(image: "assets/images/three.jpg", title: "Chest Muscle\nExercise"),
                    makeItem(image: "assets/images/one.jpg", title: "Full Body\nExercise"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

Widget makeItem({image, title}) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      height: 200,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(.0),
              ]
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(color: Color.fromARGB(255, 200, 224, 229), fontSize: 32, fontWeight: FontWeight.w900),),
                MaterialButton(
                  onPressed: () {},
                  color: Color(0xFFD7F2F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text("Start workout", style: TextStyle(fontWeight: FontWeight.w600),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
