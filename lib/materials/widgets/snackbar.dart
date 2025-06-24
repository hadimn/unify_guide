import 'package:flutter/material.dart';

class SnackbarWidget {
  // Static method to show a SnackBar from anywhere
  static void showSnackbar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        content: Text(content),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            // Add your undo action here
          },
        ),
      ),
    );
  }
}
