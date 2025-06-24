import 'package:calculator/materials/constants/colors.dart';
import 'package:calculator/materials/pages/calculator/calculatorFunctions.dart';
import 'package:calculator/materials/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bodypage extends StatefulWidget {
  final String displayMode;

  const Bodypage({super.key, required this.displayMode});

  @override
  State<Bodypage> createState() => _BodypageState();
}

class _BodypageState extends State<Bodypage> {
  late SharedPreferences localStorage;

  final FocusNode _focusNode = FocusNode();

  late TextEditingController _equationController;
  final ScrollController _scrollController = ScrollController();

  String textDisplay = '';
  bool isLeftParenNext = true; // Track whether next click should be '(' or ')'

  Calculator calculator = Calculator();

  @override
  void initState() {
    super.initState();
    _equationController = TextEditingController();
    _equationController.addListener(displayFieldValue);
    _equationController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
      });
      setState(() {
        // Handle operator duplicate removal logic here
        _equationController.text =
            calculator.removeOperatorsDuplicates(_equationController.text);
      });
    });
  }

  @override
  void dispose() {
    _equationController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void displayFieldValue() {
    // setState(() {
    //   textDisplay = _equationController.text;
    //   // FocusScope.of(context).requestFocus(_focusNode);
    // });
  }

  void concatEquationString(var value) {
    _equationController.text += value;
    // if (_equationController.text.length < 15) {

    // } else {
    //   // Display a snackbar or show alert for limit\
    //   SnackbarWidget.showSnackbar(context, "Can't add more than 15 character.");
    // }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = widget.displayMode == "dark";

    return Scaffold(
      body: Container(
        color: isDarkMode ? Colors.black : Colors.white,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Display text field
            TextField(
              controller: _equationController,
              scrollController:
                  _scrollController, // Assign the ScrollController
              enableInteractiveSelection: true,
              focusNode: _focusNode,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: 24,
              ),
              keyboardType: TextInputType.number,
              cursorHeight: 35,
              cursorWidth: 3,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: isDarkMode ? Colors.grey[900] : Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    textDirection: TextDirection.ltr,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: BorderDirectional(
                                bottom: BorderSide(
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black)),
                          ),
                          child: SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                textDisplay,
                                style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: textDisplay == ""
                            ? ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Colors.transparent),
                                ),
                                onPressed: () {},
                                child: Icon(
                                  Icons.backspace_outlined,
                                  color: widget.displayMode == "dark"
                                      ? ConstantColors
                                          .darkdisabeldButtonGreenColor
                                      : ConstantColors
                                          .lightenabledButtonsGreenColor,
                                ),
                              )
                            : ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Colors.transparent),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _equationController.text =
                                        _equationController.text.substring(
                                            0,
                                            _equationController.text.length -
                                                1);
                                  });
                                },
                                child: const Icon(
                                  Icons.backspace_outlined,
                                  color: Color.fromARGB(255, 9, 255, 17),
                                ),
                              ),
                      ),
                    ],
                  ),
                  _buildButtonRow([
                    _buildCircularButton("C", () {
                      _equationController.text = "";
                      setState(() {
                        textDisplay = "";
                      });
                    }, isDarkMode),
                    _buildCircularButtonWithParentheses(() {
                      concatEquationString("(");
                    }, () {
                      concatEquationString(")");
                    }, isDarkMode),
                    _buildCircularButton("%", () {
                      concatEquationString("%");
                    }, isDarkMode),
                    _buildIconButton(CupertinoIcons.divide, () {
                      concatEquationString("\u00F7");
                    }, isDarkMode),
                  ]),

                  // Second row: 7, 8, 9, ×
                  _buildButtonRow([
                    _buildCircularButton("7", () {
                      concatEquationString("7");
                    }, isDarkMode),
                    _buildCircularButton("8", () {
                      concatEquationString("8");
                    }, isDarkMode),
                    _buildCircularButton("9", () {
                      concatEquationString("9");
                    }, isDarkMode),
                    _buildIconButton(CupertinoIcons.multiply, () {
                      concatEquationString("\u00D7");
                    }, isDarkMode),
                  ]),

                  // Third row: 4, 5, 6, −
                  _buildButtonRow([
                    _buildCircularButton("4", () {
                      concatEquationString("4");
                    }, isDarkMode),
                    _buildCircularButton("5", () {
                      concatEquationString("5");
                    }, isDarkMode),
                    _buildCircularButton("6", () {
                      concatEquationString("6");
                    }, isDarkMode),
                    _buildIconButton(CupertinoIcons.minus, () {
                      concatEquationString("\u2212");
                    }, isDarkMode),
                  ]),

                  // Fourth row: 1, 2, 3, +
                  _buildButtonRow([
                    _buildCircularButton("1", () {
                      concatEquationString("1");
                    }, isDarkMode),
                    _buildCircularButton("2", () {
                      concatEquationString("2");
                    }, isDarkMode),
                    _buildCircularButton("3", () {
                      concatEquationString("3");
                    }, isDarkMode),
                    _buildIconButton(CupertinoIcons.add, () {
                      concatEquationString("+");
                    }, isDarkMode),
                  ]),

                  // Fifth row: +/-, 0, ., =
                  _buildButtonRow([
                    _buildCircularButton("+/-", () {
                      // Toggle negative sign logic here
                    }, isDarkMode),
                    _buildCircularButton("0", () {
                      concatEquationString("0");
                    }, isDarkMode),
                    _buildCircularButton(".", () {
                      concatEquationString(".");
                    }, isDarkMode),
                    _buildIconButton(CupertinoIcons.equal, () {
                      // Perform calculation here
                      setState(() {
                        textDisplay = calculator
                            .calculate(_equationController.text)
                            .toString();
                      });
                    }, isDarkMode,
                        backgroundColor: const Color.fromARGB(255, 9, 255, 17)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build a row of buttons
  Widget _buildButtonRow(List<Widget> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buttons.map((button) {
        return Expanded(child: button);
      }).toList(),
    );
  }

  // Helper for Circular Buttons
  Widget _buildCircularButton(
      String text, VoidCallback onPressed, bool isDarkMode,
      {double fontSize = 30}) {
    final screenSize = MediaQuery.of(context).size;
    final widthButtonSize =
        screenSize.width * 0.2; // Calculate dynamic size based on screen width
    final heightButtonSize = screenSize.height * 0.1;
    const maxSize = 100.0; // Set the maximum size of the button

    return SizedBox(
      width: widthButtonSize,
      height: heightButtonSize,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
          backgroundColor: isDarkMode
              ? Colors.grey[800]
              : const Color.fromARGB(255, 0, 0, 0),
          // Set maximum width and height constraints
          minimumSize: const Size(40, 40), // Minimum size for smaller screens
          maximumSize: const Size(maxSize, maxSize), // Maximum size constraint
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: text == "C"
                ? const Color.fromARGB(234, 255, 74, 29)
                : Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }

  // Helper for Parentheses Button
  Widget _buildCircularButtonWithParentheses(
      VoidCallback onLeftPressed, VoidCallback onRightPressed, bool isDarkMode,
      {double fontSize = 30}) {
    final screenSize = MediaQuery.of(context).size;
    final widthButtonSize =
        screenSize.width * 0.2; // Calculate dynamic size based on screen width
    final heightButtonSize = screenSize.height * 0.1;
    const maxSize = 100.0; // Set the maximum size of the button

    // Helper function to count opening and closing parentheses in the equation
    int countParentheses(String text, String character) {
      return text.split(character).length - 1;
    }

    var lastCharInExpression = _equationController.text.isNotEmpty
        ? _equationController.text.split("").last
        : "";

    var canOpenParenthesis = lastCharInExpression.isEmpty
        ? true
        : ['+', '-', '*', '/', '%', '\u00F7', '\u00D7', '\u2212']
            .contains(lastCharInExpression);

    // Checking for number of parentheses to enable/disable the buttons
    int openParenthesesCount = countParentheses(_equationController.text, "(");
    int closeParenthesesCount = countParentheses(_equationController.text, ")");

    // Enable the `)` button only if there are unmatched `(`
    bool canCloseParenthesis = openParenthesesCount > closeParenthesesCount;

    return SizedBox(
      width: widthButtonSize,
      height: heightButtonSize,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
          backgroundColor: isDarkMode
              ? Colors.grey[800]
              : const Color.fromARGB(255, 0, 0, 0),
          minimumSize: const Size(40, 40), // Minimum size for smaller screens
          maximumSize: const Size(maxSize, maxSize), // Maximum size constraint
        ),
        onPressed: () {}, // No action needed for the combined button
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: canOpenParenthesis ? onLeftPressed : null,
              child: Text(
                "(",
                style: TextStyle(
                  color: canOpenParenthesis
                      ? Colors.white
                      : const Color.fromARGB(193, 255, 255, 255),
                  fontSize: fontSize,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 1, // Vertical divider width
              color: Colors.white, // Divider color
              height: heightButtonSize * 0.6, // Divider height
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: canCloseParenthesis
                  ? onRightPressed
                  : null, // Enable/Disable based on parentheses count
              child: Text(
                ")",
                style: TextStyle(
                  color: canCloseParenthesis
                      ? Colors.white
                      : const Color.fromARGB(193, 255, 255,
                          255), // Change color based on availability
                  fontSize: fontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for Circular Icon Buttons
  Widget _buildIconButton(
      IconData icon, VoidCallback onPressed, bool isDarkMode,
      {Color backgroundColor = Colors.grey}) {
    final screenSize = MediaQuery.of(context).size;
    final widthButtonSize =
        screenSize.width * 0.2; // Calculate dynamic size based on screen width
    final heightButtonSize = screenSize.height * 0.1;
    return SizedBox(
      width: widthButtonSize,
      height: heightButtonSize,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: isDarkMode && icon == CupertinoIcons.equal
              ? backgroundColor
              : isDarkMode && icon != CupertinoIcons.equal
                  ? Colors.grey[800]
                  : const Color.fromARGB(255, 0, 0, 0),
          maximumSize: Size(widthButtonSize * 2, heightButtonSize * 1),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(0),
        ),
        onPressed: onPressed,
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
          weight: 200,
        ),
      ),
    );
  }
}
