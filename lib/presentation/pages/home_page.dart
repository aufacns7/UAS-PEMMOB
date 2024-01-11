
import 'package:flutter/material.dart';
import 'package:uas_152020109/page.berita.dart';
import 'package:uas_152020109/header.drawer.dart';
import 'package:uas_152020109/page.catatan.dart';
import 'package:uas_152020109/page.kalender.dart';
import 'package:uas_152020109/page.kalkulator.dart';
import 'package:uas_152020109/page.topup.dart';
import 'package:uas_152020109/page.topup2.dart';
import 'package:uas_152020109/page.home.dart';
import 'package:uas_152020109/presentation/pages/login_page.dart';
import 'package:uas_152020109/passing/passingkereta.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Menu Aplikasi"),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Beranda"),
                onTap: (){Navigator.pop(context);},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Pengaturan"),
                onTap: (){Navigator.pop(context);},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));},
              ),
            ],
          ),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.home, size: 70, color: Colors.blueAccent,),
                    Text("Home", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
               Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Berita()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.newspaper, size: 70, color: Colors.grey,),
                    Text("Berita", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
               Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Calender()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.calendar_month, size: 70, color: Colors.red,),
                    Text("Kalender", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
               Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Kalkulator()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.calculate, size: 70, color: Colors.black,),
                    Text("Kalkulator", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
               Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TopUp()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.payment, size: 70, color: Colors.greenAccent,),
                    Text("TopUp", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
               Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Catatan()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.note, size: 70, color: Colors.blueAccent,),
                    Text("Catatan", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
                         Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Parsing()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.movie, size: 70, color: Colors.greenAccent,),
                    Text("Film", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}