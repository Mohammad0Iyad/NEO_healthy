import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neo/screens/home/uploadpage/cum_cardpdf.dart';

class UploadProfile extends StatelessWidget {
  const UploadProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        child: Center(
            child: Column(children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: ExactAssetImage('assets/images/person1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Text(
                "user name",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "e-mail",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 250,
                height: 50,
                child: OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => EditProfile()));
                  },
                  child: const Text(
                    "Edit Profile",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "My Statisitics",
                style: GoogleFonts.oswald(
                    color: const Color.fromARGB(255, 151, 151, 151),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const CardPdf(
              imageee: 'assets/images/ck3.jpeg',
              title: "Medical Required Checks",
            ),
          ),
          InkWell(
            onTap: () {},
            child: const CardPdf(
                imageee: 'assets/images/diet1.jpg',
                title: "Download Your Diet"),
          ),
          InkWell(
            onTap: () {},
            child: const CardPdf(
              imageee: 'assets/images/mid2.jpg',
              title: "Upload Medical Examinations",
            ),
          ),
          Divider(),
        ])),
      ),
    );
  }
}
