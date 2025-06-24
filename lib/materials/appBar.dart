import 'package:calculator/materials/constants/colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget  {
  final String? title;
  final String? displayMode;
  final VoidCallback toggleDisplayMode;
  
  const AppBarWidget({super.key, required this.title, required this.displayMode, required this.toggleDisplayMode});
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_open_outlined),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        iconTheme: IconThemeData(
          color: displayMode == "dark"
              ? ConstantColors.darktextColors
              : const Color.fromARGB(255, 0, 0, 0),
        ),
        backgroundColor: displayMode == "dark"
            ? ConstantColors.darkBackgroundcolor
            : ConstantColors.lightBackgroundcolor,
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: displayMode == "dark"
              ? ConstantColors.darktextColors
              : const Color.fromARGB(255, 0, 0, 0),
        ),
        title: Text(
          title!,
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 15.0), // Adjust the value as needed
            child: IconButton(
              icon: Icon(
                displayMode == "dark" ? Icons.sunny : Icons.dark_mode,
                color: displayMode == "dark"
                    ? ConstantColors.darktextColors
                    : const Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () {
                toggleDisplayMode();
              },
            ),
          ),
        ],
      );
  }

    @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}