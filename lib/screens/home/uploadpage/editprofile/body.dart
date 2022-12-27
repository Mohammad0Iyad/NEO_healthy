import 'package:flutter/material.dart';
import 'package:neo/screens/home/uploadpage/editprofile/cum_textform.dart';
import 'package:neo/screens/home/widgets/appbarpage/body.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 20,
          ),
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
                      image: ExactAssetImage('images/person.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Colors.white,
                        ),
                        color: Colors.green),
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustTextFormSign(
                    hint: "User Name",
                    onChange: (value) {},
                    valid: (value) {
                      if (value!.isEmpty) {
                        return 'must be empty';
                      }
                      return null;
                    },
                    prefIcon: const Icon(Icons.person),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustTextFormSign(
                    hint: "Name",
                    onChange: (value) {},
                    valid: (value) {
                      if (value!.isEmpty) {
                        return 'must be empty';
                      }
                      return null;
                    },
                    prefIcon: const Icon(Icons.person),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustTextFormSign(
                    hint: "e-mail",
                    onChange: (value) {},
                    valid: (value) {
                      if (value!.isEmpty) {
                        return 'must be empty';
                      }
                      return null;
                    },
                    prefIcon: const Icon(Icons.email),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustTextFormSign(
                    hint: "Birth date",
                    onChange: (value) {},
                    valid: (value) {
                      if (value!.isEmpty) {
                        return 'must be empty';
                      }
                      return null;
                    },
                    prefIcon: const Icon(Icons.date_range),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustTextFormSign(
                    hint: "Occupation",
                    onChange: (value) {},
                    valid: (value) {
                      if (value!.isEmpty) {
                        return 'must be empty';
                      }
                      return null;
                    },
                    prefIcon: const Icon(Icons.g_mobiledata),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
