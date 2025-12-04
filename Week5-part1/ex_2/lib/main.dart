// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: Scaffold(
        
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 100,
              color: Colors.white,
            ),

            Container(
              height: 400,
              color: Colors.blue,
            ),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.green,
                  )
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.pink,
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 100 ,height: 100, color: Colors.orange,),
                Container(width: 100 ,height: 100, color: Colors.orange,),
                Container(width: 100, height: 100, color: Colors.orange,),
              ],
            ),

            const SizedBox(height: 20,),

            Expanded(
              child: Container(
                color: Colors.pinkAccent,
              ),
            )
          ],
        )
      ),
    );
  }
}