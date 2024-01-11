
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uas_152020109/service/database.dart';

class Daftar extends StatefulWidget {
  const Daftar({super.key});

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController jumlahcontroller = new TextEditingController();
  TextEditingController paymentcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text("Entry",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.bold),
      ),
        Text("Pembeli",
        style: TextStyle(
          color: Colors.orange,
          fontSize: 24.0,
          fontWeight: FontWeight.bold),
      ),
      ],)),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text("Name",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 10.0,),
        Container(
          padding: EdgeInsets.only(left: 10.0 ),
          decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(10)
          ),
          child: TextField(
          controller: namecontroller,
          decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
        SizedBox(height: 20.0,),
        Text("Jumlah",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 10.0,),
        Container(
          padding: EdgeInsets.only(left: 10.0 ),
          decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(10)
          ),
          child: TextField(
            controller: jumlahcontroller,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
                SizedBox(height: 20.0,),
        Text("Payment",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 10.0,),
        Container(
          padding: EdgeInsets.only(left: 10.0 ),
          decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(10)
          ),
          child: TextField(
            controller: paymentcontroller,
          decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      SizedBox(height: 30.0,),
      Center(
        child: ElevatedButton(onPressed: () async{
          String Id= randomAlphaNumeric(10);
      Map<String, dynamic> employeeInfoMap={
        "Name": namecontroller.text,
        "Jumlah": jumlahcontroller.text,
        "Id" : Id,
        "Payment" : paymentcontroller.text,
      };
      await DatabaseMethods().addEmployeeDetails(employeeInfoMap, Id).then((value) {});
      Fluttertoast.showToast(
        msg: "Data Telah Ditambahkan",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
        }, child: Text("Add", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)),
      )
      ],
      ),
      ),
    );
  }
}