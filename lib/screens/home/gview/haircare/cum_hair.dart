import 'package:flutter/material.dart';

class Cushair extends StatelessWidget {
  final String image;
  final String dec;
  final String price;
  final Color color;
  const Cushair({
    Key? key,
    required this.image,
    required this.dec,
    required this.color,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: color,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1), // Image border
            child: SizedBox.fromSize(
              size: const Size.fromRadius(75), // Image radius
              child: Image.asset('$image', fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
            child: Text(
          "$dec",
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
        Padding(
          padding: EdgeInsets.only(top: 100),
          child: Text(
            price,
            style: TextStyle(
                color: Color.fromARGB(255, 153, 143, 142),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
