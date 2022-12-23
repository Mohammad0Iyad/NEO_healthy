import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cusabout extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const Cusabout({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(150, 118, 185, 71),
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              "$text",
              textAlign: TextAlign.center,
              style: GoogleFonts.overpass(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          // trailing: Icon(Icons.arrow_forward_outlined),
        ),
      ),
    );
  }
}
