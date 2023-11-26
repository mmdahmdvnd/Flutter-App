import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
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

    return Column(
      children: <Widget>[
        // نقشه Flutter با ارتفاع یک سوم ارتفاع صفحه
        Flexible(
          flex: 1, // تنظیم فشار (flex) برای نقشه
          child: FlutterMap(
              options:  MapOptions(
                center: LatLng(51.5, -0.09),
                zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token={accessToken}",
                  additionalOptions: {
                    'accessToken': 'pk.eyJ1IjoibW1kYWhtZHZuZCIsImEiOiJjbGFwMzlkaXgweGUzM3JuMDhyczNweWdyIn0.B5EDELTbtX58N3rDzOuPhw',
                    'id': 'mapbox.streets',
                  },
                )
              ]
          ),
        ),
        // دیگر ویجت‌ها در این قسمت
        Expanded(
          flex: 2, // تنظیم فشار (flex) برای سایر ویجت‌ها
          child: SingleChildScrollView(
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
                GestureDetector(
                  onTap: () {
                    // انتقال به صفحه RequestCollectionPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CollectionRequestPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Image.asset(
                      'assets/images/title_image_2.png',
                      fit: BoxFit.cover,
                    ),
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
                        height: imageSize,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}