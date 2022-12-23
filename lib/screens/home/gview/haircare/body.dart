import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:neo/screens/home/gview/haircare/cum_hair.dart';

import '../../widgets/appbarpage/body.dart';

class Haircare extends StatefulWidget {
  const Haircare({Key? key}) : super(key: key);

  @override
  State<Haircare> createState() => _HaircareState();
}

class _HaircareState extends State<Haircare> {
  bool err = false;
  String msgErr = '';

  @override
  void initState() {
    super.initState();
  }

  void whatsAppOpen() async {
    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

    if (whatsapp) {
      await FlutterLaunch.launchWhatsapp(
          phone: "+962790118274", message: "Hello, Rand");
    } else {
      setState(() {
        err = false;
        msgErr = 'not work';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarMain(
        title: "Hair Care",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Container(
                child: CarouselSlider(
                  items: [
                    Image.asset(
                      "assets/images/zen1.jpeg",
                    ),
                    Image.asset(
                      "assets/images/zen2.jpeg",
                    ),
                    Image.asset(
                      "assets/images/zen.jpeg",
                    ),
                    Image.asset(
                      "assets/images/zen3.jpeg",
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Text(
              "Stimulating | علاج التساقط ",
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Cushair(
              dec: ' 1000ml stimulating|shampoo | شامبو منع تساقط الشعر ',
              image: "assets/images/shampo.jpeg",
              color: Color.fromARGB(255, 240, 153, 153),
              price: '47jd',
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Cushair(
              dec:
                  '100 ml stimulating| scalp loti | لوشن منشط لمنع تساقط الشعر​ ',
              image: "assets/images/scalp.jpeg",
              color: Color.fromARGB(255, 240, 153, 153),
              price: '35jd',
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Cushair(
              dec:
                  '250 ml stimulating| clay hairwash  |شامبو محفز من الطين الأحمر مضاد لتساقط الشعر',
              image: "assets/images/clay.jpeg",
              color: Color.fromARGB(255, 240, 153, 153),
              price: '22jd',
            ),
            const Divider(
              color: Colors.grey,
            ),
            Text(
              "Normalizing | علاج الفروة الدهنية ",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Color.fromARGB(255, 229, 221, 221),
            ),
            const Cushair(
              dec:
                  '1000 ml normalizing | shampoo|شامبو إعادة التوازن للشعر وفروة الرأس الدهنية',
              image: "assets/images/shampo2.jpeg",
              color: Color.fromARGB(255, 173, 200, 246),
              price: '47jd',
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Cushair(
              dec:
                  '100 ml normalizing| treatment |لوشن إعادة التوازن للشعر وفروة الرأس الدهنية​',
              image: "assets/images/treat.jpeg",
              color: Color.fromARGB(255, 173, 200, 246),
              price: '32jd',
            ),
            const Divider(
              color: Colors.grey,
            ),
            Text(
              "Dandruff | علاج القشرة",
              style: TextStyle(
                  color: Color.fromARGB(255, 239, 239, 102),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Color.fromARGB(255, 229, 221, 221),
            ),
            const Cushair(
              dec: '1000 ml dandruff | controller shampoo|شامبو منظف من القشرة',
              image: "assets/images/shampo3.jpeg",
              color: Color.fromARGB(255, 231, 211, 139),
              price: '60jd',
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Cushair(
              dec: ' 125 ml intensive cream shampoo |شامبو كريمي بمفعول عميق',
              image: "assets/images/cshampoo.jpeg",
              color: Color.fromARGB(255, 244, 216, 116),
              price: '25jd',
            ),
            const Divider(
              color: Colors.grey,
            ),
            Text(
              "Densifying | علاج تكثيف الشعر",
              style: TextStyle(
                  color: Color.fromARGB(255, 235, 54, 54),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Color.fromARGB(255, 229, 221, 221),
            ),
            const Cushair(
              dec: '1000 ml densifying|  shampoo|شامبو للحماية من تساقط الشعر',
              image: "assets/images/shampo1.jpeg",
              color: Color.fromARGB(255, 253, 77, 65),
              price: '47jd',
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Cushair(
              dec: '100 ml densifying |  lotion |لوشن الحماية من تساقط الشعر',
              image: "assets/images/lotion.jpeg",
              color: Color.fromARGB(255, 253, 77, 65),
              price: '35jd',
            ),
            const Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          whatsAppOpen();
        },
        label: const Text('By whatsapp'),
        icon: const Icon(Icons.whatsapp),
        backgroundColor: Color.fromARGB(100, 118, 185, 71),
      ),
    );
  }

  Carousel(Image image) {}
}
