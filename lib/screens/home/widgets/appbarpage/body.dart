import 'package:flutter/material.dart';
// import 'dart:io' show Platform;

import 'package:google_fonts/google_fonts.dart';

class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMain({Key? key, this.title = 'NEO HEALTHY'}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      backgroundColor: Colors.green,
      actions: [
        IconButton(
          icon: const Icon(Icons.logout_outlined),
          onPressed: () {},
        ),
      ],
      title: Center(
        child: Text(
          title,
          style: GoogleFonts.arimo(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}


//Platform.isAndroid ? Colors.indigo : Colors.red
