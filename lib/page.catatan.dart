import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uas_152020109/pages/daftar.dart';
import 'package:uas_152020109/service/database.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Catatan());
}



class Catatan extends StatefulWidget {
  const Catatan({super.key});

  @override
  State<Catatan> createState() => _CatatanState();
}

class _CatatanState extends State<Catatan> {

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController jumlahcontroller = new TextEditingController();
  TextEditingController paymentcontroller = new TextEditingController();

  Stream? EmployeeStream;

  getontheload()async{
    EmployeeStream = await DatabaseMethods().getEmployeeDetails();
    setState(() {
      
    });
  }

  @override
void initState() {
    getontheload();
    super.initState();
  }
  Widget allEmployeeDetails(){
    return StreamBuilder(
      stream: EmployeeStream,
      builder: (context, AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
        itemCount: snapshot.data.docs.length,
        itemBuilder: (context, index){
DocumentSnapshot ds=snapshot.data.docs[index];
return         Container(
   margin: EdgeInsets.only(bottom: 20.0),

  child:   Material(
            elevation: 5.0,
  
            borderRadius: BorderRadius.circular(10),
  
            child: Container(
  
              padding: EdgeInsets.all(20),
  
              width: MediaQuery.of(context).size.width,
  
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
  
              child: Column(
  
                crossAxisAlignment: CrossAxisAlignment.start ,
  
                children: [
  
                  Row(
                    children: [
                      Text(
                        "Name : "+ds["Name"], 
  
                      style: TextStyle(
  
                        color: Colors.blue,
  
                        fontSize: 20.0,
  
                        fontWeight: FontWeight.bold,
  
                      ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          namecontroller.text=ds["Name"];
                          jumlahcontroller.text=ds["Jumlah"];
                          paymentcontroller.text=ds["Payment"];
                          EditEmployeeDetail(ds["Id"]);
                        },
                      child: Icon(Icons.edit, color: Colors.orange,)),
                      SizedBox(width: 5.0,),
                    GestureDetector(
                      onTap: () async{
                        await DatabaseMethods().deleteEmployeeDetail(ds["Id"]);
                      },
                      child: Icon(Icons.delete, color: Colors.red,))

                    ],
                  ),
  
                  Text("Jumlah : "+ds["Jumlah"], 
  
                  style: TextStyle(
  
                    color: Colors.orange,
  
                    fontSize: 20.0,
  
                    fontWeight: FontWeight.bold,
  
                  ),),
  
                  Text("Payment : "+ds["Payment"], 
  
                  style: TextStyle(
  
                    color: Colors.blue,
  
                    fontSize: 20.0,
  
                    fontWeight: FontWeight.bold,
  
                  ),),             
  
                ],
  
              ),
  
            ),
  
          ),
);
      }): Container();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Daftar()));
      },child: Icon(Icons.add),),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text("Daftar",
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
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0,
        ),
       child: Column(children: [
        Expanded(child: allEmployeeDetails()),

       ]), 
      ),
    );
  }

  Future EditEmployeeDetail(String id) => showDialog(context: context, builder: (context)=> AlertDialog(
    content: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.cancel)),
        SizedBox(width: 60.0,),
         Text("Edit",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.bold),
      ),
        Text("Details",
        style: TextStyle(
          color: Colors.orange,
          fontSize: 24.0,
          fontWeight: FontWeight.bold),
      )
          ],),
          SizedBox(height: 20,),
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
            border: Border.all(),
            borderRadius: BorderRadius.circular(20)
          ),
          child: TextField(
            controller: paymentcontroller,
          decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
        SizedBox(height: 30.0,),
        Center(child: ElevatedButton(onPressed: ()async{
          Map<String, dynamic>updateInfo={
            "Name": namecontroller.text,
            "Jumlah": jumlahcontroller.text,
            "Id": id,
            "Payment": paymentcontroller.text,
          };
          await DatabaseMethods().updateEmployeeDetail(id, updateInfo).then((value) {
            Navigator.pop(context);
          });
        }, child: Text("Update")))
        ],
      ),
    ),
  ));
}