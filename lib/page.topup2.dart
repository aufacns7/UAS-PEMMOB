import 'package:flutter/material.dart';

class TopUp2 extends StatelessWidget {
  String id, nick, diamond, payment; // Tambahkan properti payment

  TopUp2({
    required this.id,
    required this.nick,
    required this.diamond,
    required this.payment, // Inisialisasi payment
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kembali"), // Set the screen title
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // "Back" button
          onPressed: () {
            Navigator.of(context).pop(context); // Navigate back when the "Back" button is pressed
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID Game                      : $id',
              style: TextStyle(fontSize: 18), // Adjust the font size for ID
            ),
            Text(
              'Nickname                   : $nick',
              style: TextStyle(fontSize: 18), // Adjust the font size for Nick
            ),
            Text(
              'Jumlah Diamond       : $diamond',
              style: TextStyle(fontSize: 18), // Adjust the font size for Diamond
            ),
            Text(
              'Metode Pembayaran : $payment', // Menampilkan opsi pembayaran
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0), // Add space below the previous texts
              child: Text(
                'MOHON MAAF TRANSAKSI ANDA DITUNDA',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
