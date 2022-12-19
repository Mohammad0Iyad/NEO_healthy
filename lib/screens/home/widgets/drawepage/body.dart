import 'package:flutter/material.dart';

class Pagedrawer extends StatefulWidget {
  @override
  State<Pagedrawer> createState() => _PagedrawerState();
}

class _PagedrawerState extends State<Pagedrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 181, 227, 148),
            ),
            accountName: const Text("Mahmood alfaqih"),
            accountEmail: const Text("alfaqih@yahoo.com"),
            currentAccountPicture: ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(48), // Image radius
                child:
                    Image.asset('assets/images/person.jpg', fit: BoxFit.cover),
              ),
            )),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: 20),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {},
        ),
        const Divider(
          thickness: 1,
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: const Text(
            "Language",
            style: TextStyle(fontSize: 20),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {},
        ),
        const Divider(
          thickness: 1,
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text(
            "Logout",
            style: TextStyle(fontSize: 20),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {},
        ),
        const Divider(
          thickness: 1,
        ),
        ListTile(
          leading: const Icon(Icons.contact_support_outlined),
          title: const Text(
            "Contact US",
            style: TextStyle(fontSize: 20),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {},
        ),
        const Divider(
          thickness: 1,
        ),
      ]),
    );
  }
}
