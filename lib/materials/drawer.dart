import 'package:calculator/materials/constants/colors.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    // const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
    // String dropdownValue = list.first;
    return Drawer(
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
      semanticLabel: "menu",
      child: ListView(
        children: [
          const DrawerHeader(
            decoration:
                BoxDecoration(color: ConstantColors.darkButtonBackgroundcolor),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      width: 50,
                      height: 50,
                      image: AssetImage("images/user.png"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "name: jhon silver",
                          style: TextStyle(fontSize: 10),
                        ),
                        Text("email: jhonsilver@mail.com",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  size: 24,
                ),
                SizedBox(width: 10),
                Text(
                  "Home",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            onTap: () => Navigator.pushReplacementNamed(context, "/"),
          ),
          const Divider(),
          ExpansionTile(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            title: const Row(
              children: [
                Icon(Icons.library_books),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                Text("Pages")
              ],
            ),
            children: [
              ListTile(
                onTap: () => Navigator.pushReplacementNamed(context, "/calculator"),
                contentPadding: const EdgeInsets.only(left: 50),
                title: const Row(
                  children: [
                    Icon(Icons.calculate),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Text("caculator"),
                  ],
                ),
              ),
              ListTile(
                onTap: () => Navigator.pushReplacementNamed(context, "/to-do"),
                contentPadding: const EdgeInsets.only(left: 50),
                title: const Row(
                  children: [
                    Icon(Icons.today_outlined),
                    Padding(padding: EdgeInsets.only(right: 10)),
                    Text("to-do"),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          // ListTile(
          //   title: const Row(
          //     children: [
          //       Icon(
          //         Icons.calculate,
          //         size: 24,
          //       ),
          //       SizedBox(width: 10),
          //       Text(
          //         "Calculator",
          //         style: TextStyle(fontSize: 18),
          //       ),
          //     ],
          //   ),
          //   onTap: () => Navigator.pushReplacementNamed(context, "/calculator"),
          // ),
          // const Divider(),
        ],
      ),
    );
  }
}
