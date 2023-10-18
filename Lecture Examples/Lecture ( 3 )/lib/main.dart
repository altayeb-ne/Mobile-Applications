import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  int rdice = 1;
  int ldice = 1;

  void Dice()
  {
    ldice = Random().nextInt(6)+1;
    rdice = Random().nextInt(6)+1;

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.teal,
          appBar: AppBar(
            backgroundColor: Colors.teal[300],
            title: Text("Dice Game"),
          ),
          body: Center(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {

                      setState(() {
                        Dice();

                      });

                    },
                    child: Image.asset('images/dice$ldice.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {

                      setState(() {
                        Dice();


                      });
                    },
                    child: Image.asset('images/dice$rdice.png'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

/*




            Container(color: Colors.yellow,width: double.infinity,height: 400,),
            Container(color: Colors.red,width: double.infinity,height: 400,),
            Container(color: Colors.green,width: double.infinity,height: 400,),
            Container(color: Colors.blue,width: double.infinity,height: 400,),
            Container(color: Colors.lightGreen,width: double.infinity,height: 400,),
            Container(color: Colors.black45,width: double.infinity,height: 400,),
            Container(color: Colors.white,width: double.infinity,height: 400,),
            Container(color: Colors.amberAccent,width: double.infinity,height: 400,),
            Container(color: Colors.brown,width: double.infinity,height: 400,),




 */
