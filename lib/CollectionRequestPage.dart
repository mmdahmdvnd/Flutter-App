import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CollectionRequestPage extends StatefulWidget {
  const CollectionRequestPage({Key? key}) : super(key: key);

  @override
  _CollectionRequestPageState createState() => _CollectionRequestPageState();
}

class _CollectionRequestPageState extends State<CollectionRequestPage> {
  String name = '';
  String phoneNumber = '';
  String address = '';
  String requestType = 'جمع‌آوری روغن سوخته خوراکی';
  String additionalNotes = '';
  String url = 'https://android-material.ir/test/login_.php';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('درخواست جمع‌آوری روغن سوخته خوراکی'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'نام و نام خانوادگی'),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'شماره تلفن'),
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'آدرس'),
              onChanged: (value) {
                setState(() {
                  address = value;
                });
              },
            ),
            DropdownButton<String>(
              value: requestType,
              onChanged: (value) {
                setState(() {
                  requestType = value!;
                });
              },
              items: ['جمع‌آوری روغن سوخته خوراکی', '...'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'توضیحات اضافی'),
              onChanged: (value) {
                setState(() {
                  additionalNotes = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

                _submitRequest();
              },
              child: Text('ثبت درخواست'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitRequest() async {
    final response = await http.post(
      Uri.parse(url), // URL سرور خود را وارد کنید
      body: {
        'name': name,
        'phone_number': phoneNumber,
        'address': address,
        'request_type': requestType,
        'additional_notes': additionalNotes,
      },
    );

    if (response.statusCode == 200) {
      // درخواست موفقیت‌آمیز بوده است
      print('درخواست با موفقیت ارسال شد.');
      print('پاسخ از سرور: ${response.body}');
    } else {
      // درخواست ناموفق بوده است
      print('خطا در ارسال درخواست. کد وضعیت: ${response.statusCode}');
    }
  }

}

void main() => runApp(MaterialApp(home: CollectionRequestPage()));
