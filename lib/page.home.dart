import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust left and right padding
                  child: Text(
                    'MOODFORJEKI Merupakan sebuah aplikasi canggih masa kini yang dibangun pada tahun 2023. Aplikasi ini memiliki fitur yang luar biasa serta mempunyai tampilan yang sangat menarik. STARGAZE merupakan developer dari aplikasi yang super canggih ini sedang mengembangkan beberapa fitur yang akan di Release pada masa mendatang.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20,
              child: Container(
                width: 200,
                height: 200,
                child: Image.asset('images/LOGO.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
