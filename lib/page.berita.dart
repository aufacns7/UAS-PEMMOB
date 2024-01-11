import 'package:flutter/material.dart';

class Berita extends StatelessWidget {
  const Berita({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Hari Ini'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children:  <Widget> [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                               Text('Pada hari ini Mobile Legend telah berkolaborasi dengan beberapa pihak sehingga mulai sekarang bagi player yang ingin Topup tidak hanya bisa dilakukan didalam game. karna sekarang kita bisa melakukan diluar game tersebut seperti menggunakan CodaShop, Bukalapak, Danlain lain',
          textAlign:  TextAlign.center,
            ),
              ],
            ),
            Positioned(
              top: 45,
              child:Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmpbmaz2xjpts9LmmGfu7DCWgSYzrXzSyDojvLewLkeE3Kjd47fZLGppF2aFU2kzunk0M&usqp=CAU'),
            ),
          ],
        ),
      ),
    );
  }
}