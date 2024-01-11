import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget{
  const MyHeaderDrawer({super.key});


  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 70.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('images/PIC.jpg'),
              ),
            ),
          ),
          const Text("152020109", style: TextStyle(color: Colors.white, fontSize: 20),),
          const Text("M. ZAKY AUFA", style: TextStyle(color: Colors.white, fontSize: 14),),
        ],
      ),
    );
  }
}