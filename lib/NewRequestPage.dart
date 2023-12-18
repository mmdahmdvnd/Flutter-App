import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pishco_app/view_model.dart';
import 'package:provider/provider.dart';
import 'Request.dart';

class NewRequestPage extends StatefulWidget {
  @override
  _NewRequestPageState createState() => _NewRequestPageState();
}

class _NewRequestPageState extends State<NewRequestPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController requestTypeController = TextEditingController();
  TextEditingController additionalNotesController = TextEditingController();
  String url = 'https://android-material.ir/test/login_.php';

  //get requestsViewModel => null;

  @override
  Widget build(BuildContext context) {
    var requestsViewModel = Provider.of<RequestsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('درخواست جدید'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'نام و نام خانوادگی'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'شماره تلفن'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'آدرس'),
            ),
            TextField(
              controller: requestTypeController,
              decoration: InputDecoration(labelText: 'نوع درخواست'),
            ),
            TextField(
              controller: additionalNotesController,
              decoration: InputDecoration(labelText: 'توضیحات اضافی'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _submitRequest(requestsViewModel);
              },
              child: Text('ثبت درخواست'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitRequest(RequestsViewModel requestsViewModel) async {
    final response = await http.post(
      Uri.parse(url), // URL سرور خود را وارد کنید
      body: {
        'name': nameController.text,
        'phone_number': phoneNumberController.text,
        'address': addressController.text,
        'request_type': requestTypeController.text,
        'additional_notes': additionalNotesController.text,
      },
    );

    if (response.statusCode == 200) {
      // درخواست موفقیت‌آمیز بوده است
      print('درخواست با موفقیت ارسال شد.');
      print('پاسخ از سرور: ${response.body}');

      // ارسال درخواست به ویومدل
      requestsViewModel.addRequest(Request(name: nameController.text));
      // بازگشت به صفحه CollectionRequestPage با ارسال نتیجه به لیست
      // Navigator.pop(context, 'درخواست جدید');
      Navigator.pop(context);
    } else {
      // درخواست ناموفق بوده است
      print('خطا در ارسال درخواست. کد وضعیت: ${response.statusCode}');
    }
  }

}