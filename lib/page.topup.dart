import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:uas_152020109/page.topup2.dart';

class TopUp extends StatefulWidget {
  TopUp({Key? key}) : super(key: key);

  @override
  _TopUpState createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  final TextEditingController _id = TextEditingController();
  final TextEditingController _nick = TextEditingController();

  String selectedDiamond = '3 Diamond'; // Nilai default
  List<String> diamondOptions = ['3 Diamond', '170 Diamond', '296 Diamond', '568 Diamond', '1412 Diamond', '3638 Diamond', '7727 Diamond']; // Gantilah dengan pilihan yang sesuai

  String selectedPayment = 'BCA'; // Nilai default
  List<String> paymentOptions = ['BCA', 'BNI', 'MANDIRI', 'DANA', 'OVO', 'GOPAY', 'SHOPEEPAY'];

  void showAlert(BuildContext context) {
    QuickAlert.show(
      context: context,
      title: "PERINGATAN !",
      text: "Apakah Anda Sudah Mengisi Data dengan Benar ?",
      type: QuickAlertType.confirm,
      onConfirmBtnTap: () {
        // When "OK" is pressed in the QuickAlert, navigate to a new screen.
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TopUp2(id: _id.text, nick: _nick.text, diamond: selectedDiamond, payment: selectedPayment),
          ),
        );
      },
    );
  }

  String getPaymentImageUrl(String paymentOption) {
    // Tambahkan logic untuk mengembalikan URL gambar berdasarkan opsi pembayaran
    switch (paymentOption) {
      case 'BCA':
        return 'https://play-lh.googleusercontent.com/ggZzVVDWsTm7gSnVl8m3cNFgoeUN2r7dhAZdB8lz0d_s6ZcYOkvUQdbG3dPU5LHZnWvc';
      case 'BNI':
        return 'https://www.bangkaindependent.com/wp-content/uploads/2022/04/4111342-bni-pangkal-pinang-kantor-cabang-kab-bangka-kepulauan-bangka-belitung.png';
      case 'MANDIRI':
        return 'https://cdn.antaranews.com/cache/1200x800/2020/03/22/logo-bank-mandiri.jpg';
      case 'DANA':
        return 'https://pbs.twimg.com/profile_images/966253495547342848/_bjmYta5_400x400.jpg';
      case 'OVO':
        return 'https://www.telkomsel.com/sites/default/files/2023-06/W3-34%20%281%29.png';
      case 'GOPAY':
        return 'https://fintech.id/storage/files/shares/logo/logofi2/gopay-1.jpg';
      case 'SHOPEEPAY':
        return 'https://play-lh.googleusercontent.com/H7Ja21f7Q66xICkTSzWzjR3E9IB_2YQUbt0xlHtFdXSdUOdbOqQxxCVxiA73mm8heA';
      default:
        return 'URL_GAMBAR_DEFAULT';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Up"), // Set the screen title
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // "Back" button
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back when the "Back" button is pressed
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _id,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter ID',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nick,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Nickname',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
              value: selectedDiamond,
              items: diamondOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Row(
                    children: [
                      Image.network(
                        'https://crm.vcgamers.com/uploads/product/20230430124926produk100.png', // Ganti dengan path gambar Anda
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text(option),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDiamond = newValue!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select Diamond',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
              value: selectedPayment,
              items: paymentOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Row(
                    children: [
                      Image.network(
                        getPaymentImageUrl(option), // Gunakan URL gambar sesuai opsi pembayaran
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text(option),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPayment = newValue!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select Payment',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showAlert(context); // Pass the context to showAlert
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
