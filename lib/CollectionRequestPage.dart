import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pishco_app/view_model.dart';
import 'NewRequestPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Request.dart';
// import 'package:flutter_map_app/requests_view_model.dart';

class CollectionRequestPage extends StatelessWidget {
  const CollectionRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var requestsViewModel = Provider.of<RequestsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('درخواست‌ها'),
      ),
      body: ListView.builder(
        itemCount: requestsViewModel.requests.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(requestsViewModel.requests[index].name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // انتقال به صفحه NewRequestPage
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewRequestPage()),
          );

          if (result != null) {
            // اگر نتیجه از صفحه جدید غیر از null باشد، آن را به لیست اضافه کنید
            requestsViewModel.addRequest(Request(name: result));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}