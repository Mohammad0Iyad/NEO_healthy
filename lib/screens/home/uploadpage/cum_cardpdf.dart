import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPdf extends StatelessWidget {
  const CardPdf({Key? key, required this.imageee, required this.title})
      : super(key: key);
  final String imageee;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: SizedBox(
        height: 100,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          child: Row(
            children: [
              //image
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.transparent,
                    child: Image(
                        fit: BoxFit.cover,
                        height: 130,
                        image: AssetImage(imageee)),
                  )),
              //text
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    color: Colors.transparent,
                    child: Text(
                      title,
                      style: GoogleFonts.oswald(
                          color: Color.fromARGB(255, 154, 159, 142),
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  )),
              //bottom
              // Expanded(
              //     child: Container(
              //         child: Center(
              //             child: IconButton(
              //                 onPressed: () {}, icon: Icon(Icons.download))))),
            ],
          ),
        ),
      ),
    );
  }
}
