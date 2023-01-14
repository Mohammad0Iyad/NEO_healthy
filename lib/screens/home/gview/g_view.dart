import 'package:flutter/material.dart';
import 'package:neo/screens/home/gview/bmi/bmi_calculator.dart';
import 'package:neo/screens/home/gview/cum_card.dart';
import 'package:neo/screens/home/gview/haircare/body.dart';

class GView extends StatelessWidget {
  const GView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/BKgrid.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
          children: [
            Cusabout(
              onTap: () {},
              text: "Healthy Recipes",
            ),
            Cusabout(
              onTap: () {},
              text: "Keto Recipes",
            ),
            Cusabout(
              onTap: () {},
              text: "Healthy Tips",
            ),
            Cusabout(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Haircare()),
                );
              },
              text: "Products Hair Care",
            ),
            Cusabout(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BmiCalculators()),
                );
              },
              text: "BMI Calculator",
            ),
            Cusabout(
              onTap: () {},
              text: "Our Healthy Shop",
            ),
          ],
          padding: const EdgeInsets.all(10),
        ),
      ],
    );
  }
}
