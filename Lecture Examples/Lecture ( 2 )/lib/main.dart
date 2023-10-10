import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [Image.asset('images/mo.jpg')],
          ),
          Positioned(
              top: 170,
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.orangeAccent,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/dash.png'),
                ),
              )),
          Column(
            children: [
              SizedBox(
                height: 300,
              ),
              Text(
                "Flutter Dash",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "@flutter.dash",
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Test Bio Test BioTest BioTest BioTest Bio",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w200),
              ),
SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                Column(
                   children: [
                  Text("Posts"),
                  SizedBox(height: 10,),
                  Text("25",style: TextStyle(fontWeight: FontWeight.w900),)

                  

                ],),

                Column(
                  children: [
                    Text("Followers"),
                    SizedBox(height: 10,),
                    Text("2.5M",style: TextStyle(fontWeight: FontWeight.w900),)



                  ],),
                Column(
                  children: [
                    Text("Following"),
                    SizedBox(height: 10,),
                    Text("2500",style: TextStyle(fontWeight: FontWeight.w900),)



                  ],),
              ],),
              SizedBox(height: 10,),

              ElevatedButton(onPressed: (){}, child: Text("Follow"),style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 120)


              ),)
            ],
          )
        ],
      )),
    ));
  }
}
