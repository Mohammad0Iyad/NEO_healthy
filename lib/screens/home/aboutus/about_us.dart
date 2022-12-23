import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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

  var currentIndex = 0;
  final List<Widget> imgList = [
    Image.asset(
      "assets/images/randlog.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/rand2.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/images/randlog.jpg",
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 300.0,
            width: double.infinity,
            child: CarouselSlider(
              items: imgList,
              options: CarouselOptions(
                height: 350,
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
                // scrollDirection: Axis.vertical,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17),
                child: Text(
                  "About Us",
                  style: GoogleFonts.roboto(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          //about us

          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "An application that provides nutritional information from reliable sources and the latest scientific studies in a simple and easy way. The site also provides healthy recipes with accurate descriptions of nutrients and calories for each recipe. Through the application, you can also subscribe from all over the world with several highly experienced nutritionists in the field of nutrition. and diets",
              style: GoogleFonts.roboto(),
            ),
          ),
          const Divider(),
          //information
          InkWell(
            onTap: () {
              // ignore: deprecated_member_use
              launch("https://goo.gl/maps/65TG6ap796h3Wd2F6");
            },
            child: const ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Dabouq , Amman, Jordan'),
            ),
          ),
          InkWell(
            onTap: () {
              // ignore: deprecated_member_use
              launch("tel:0797910101");
            },
            child: const ListTile(
              leading: Icon(Icons.phone),
              title: Text('+962790118274'),
            ),
          ),
          InkWell(
            onTap: () {
              // ignore: deprecated_member_use
              launch("mailto:nutritionfirst.jo@gmail.com");
            },
            child: const ListTile(
              leading: Icon(Icons.email),
              title: Text('nutritionfirst.jo@gmail.com'),
            ),
          ),
          //information
          const Divider(),

          // social media
          Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    // ignore: deprecated_member_use
                    launch("https://www.facebook.com/RandDisiClinic/");
                  },
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
              ),
              Expanded(
                  child: InkWell(
                      onTap: () {
                        // ignore: deprecated_member_use
                        launch("https://www.instagram.com/rand.aldisi/");
                      },
                      child: Image.asset(
                        "assets/images/ga.jpg",
                        width: 28,
                        height: 28,
                      ))),
              Expanded(
                  child: InkWell(
                      onTap: () {
                        // ignore: deprecated_member_use
                        launch(
                            "https://www.youtube.com/channel/UCWA6WA2CTGxYbYIPttAr6Jw");
                      },
                      child: Image.asset(
                        "assets/images/youtube.jpg",
                        width: 28,
                        height: 28,
                      ))),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    whatsAppOpen();
                  },
                  icon: const Icon(
                    Icons.whatsapp,
                    color: Colors.green,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
