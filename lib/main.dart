import 'package:flutter/material.dart';

import 'CollectionRequestPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('طراحی با فلاتر'),
        ),
        body: const YourWidget(), // اینجا YourWidget را وارد کنید.
      ),
    );
  }
}

class YourWidget extends StatelessWidget {
  const YourWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageSize = 100;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // سطر اول با اسکرول افقی و 5 تصویر
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                5,
                    (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/title_image_1.png',
                    fit: BoxFit.cover,
                    width: imageSize,
                    height: imageSize,
                  ),
                ),
              ),
            ),
          ),
          // سطر دوم با یک تصویر به عرض صفحه و ارتفاع نصف صفحه
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: GestureDetector(
              onTap: () {
                // انتقال به صفحه RequestCollectionPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CollectionRequestPage(),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/title_image_2.png',
                fit: BoxFit.cover,
              ), // تنظیم مقیاس تصویر
            ),
          ),
          // سطر سوم با یک تصویر به عرض صفحه و ارتفاع یک چهارم صفحه
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 4,
            child: Image.asset(
              'assets/images/title_image_1.png',
              fit: BoxFit.cover,
            ),
          ),
          // سطر چهارم با شبکه تشکیل شده از 9 تصویر (3 تصویر در هر سطر)
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(
              9,
                  (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                    'assets/images/title_image_1.png',
                    fit: BoxFit.cover,
                    width: imageSize,
                    height: imageSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}