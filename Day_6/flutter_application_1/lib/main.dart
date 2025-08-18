import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITI First Screen',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('ITI First Screen'),
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/me.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),

                Icon(Icons.person, size: 50, color: Colors.red),

                SizedBox(height: 5),
                Text(
                  'I am learning Flutter',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),

                Icon(Icons.star_rate_rounded, size: 50, color: Colors.pink),

                SizedBox(height: 5),

                customContainer(text: "Red", color: Colors.red),

                SizedBox(height: 5),

                customContainer(text: "Green", color: Colors.green),

                SizedBox(height: 5),

                customContainer(text: "Blue", color: Colors.blue),

                SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    customContainer(text: "Green", color: Colors.green),

                    SizedBox(width: 10),

                    customContainer(text: "Blue", color: Colors.blue),

                  ],
                ),

                SizedBox(height: 5),

                Stack(
                  children: [

                    Container(width: 100, height: 100, color: Colors.blue),
                    
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 75,
                        height: 75,
                        color: Colors.green,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 25,
                        height: 25,
                        color: Colors.black,
                        padding: EdgeInsets.all(4),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Text(
                        "Blue",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customContainer({required String text, required Color color}) {
  return Container(
    width: 100,
    height: 100,
    color: color,
    child: Text(text, style: TextStyle(color: Colors.black, fontSize: 20)),
  );
}
