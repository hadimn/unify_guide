import 'package:calculator/materials/constants/colors.dart';
import 'package:calculator/materials/constants/pagesList.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  final String displayMode;

  const HomeBody({super.key, required this.displayMode});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.displayMode == "dark"
          ? ConstantColors.darkBackgroundcolor
          : ConstantColors.lightBackgroundcolor,
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 3,
              children: pagesList.entries.map(
                (entry) {
                  return Card(
                    color: widget.displayMode == "dark"
                        ? ConstantColors.lightBackgroundcolor
                        : ConstantColors.darkBackgroundcolor,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, "${entry.value['Navigation']}");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              // image container
                              Expanded(
                                flex: 7,
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: entry.value["backgroundColor"],
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    border: const Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                                  ),
                                  child: Image(
                                    width: entry.value['width'],
                                    height: entry.value['height'],
                                    image:
                                        AssetImage("${entry.value['image']}"),
                                  ),
                                ),
                              ),
                              // text container
                              Expanded(
                                flex: 3,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: widget.displayMode == "dark"
                                          ? ConstantColors.darkBackgroundcolor
                                          : ConstantColors.lightBackgroundcolor,
                                    ),
                                    "${entry.value['Name']}",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
