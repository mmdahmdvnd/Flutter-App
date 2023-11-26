import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'NewRequestPage.dart';

void main() => runApp(MaterialApp(home: CollectionRequestPage()));

class CollectionRequestPage extends StatefulWidget {
  const CollectionRequestPage({Key? key}) : super(key: key);
  @override
  _CollectionRequestPageState createState() => _CollectionRequestPageState();
}

class _CollectionRequestPageState extends State<CollectionRequestPage> {
  List<String> requests = ['درخواست 1', 'درخواست 2', 'درخواست 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('درخواست‌ها'),
      ),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(requests[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewRequestPage()),
          );

          if (result != null) {
            // اگر نتیجه از صفحه جدید غیر از null باشد، آن را به لیست اضافه کنید
            setState(() {
              requests.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
