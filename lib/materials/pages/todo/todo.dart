import 'package:calculator/materials/appBar.dart';
import 'package:calculator/materials/classes/themeProvider.dart';
import 'package:calculator/materials/constants/colors.dart';
import 'package:calculator/materials/drawer.dart';
import 'package:calculator/materials/pages/todo/body.dart';
import 'package:calculator/materials/pages/todo/priorityLevel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late int id;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isCompleted = false;
  late DateTime created_at;
  DateTime? dueDate;
  Prioritylevel prioritylevel = Prioritylevel.medium;

  bool get _areFieldsEmpty =>
      titleController.text.isNotEmpty && descriptionController.text.isNotEmpty;

  void _onFieldChanged() {
    setState(() {});
  }

  @override
  void initState() {
    titleController.addListener(_onFieldChanged);
    descriptionController.addListener(_onFieldChanged);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return DynamicBottomSheetExample();
    // return Scaffold(
    //   appBar: AppBarWidget(
    //     title: "To-Do",
    //     displayMode: themeProvider.displayMode,
    //     toggleDisplayMode: themeProvider.toggleDisplayMode,
    //   ),
    //   drawer: const DrawerWidget(),
    //   body: TodoBody(
    //     displayMode: themeProvider.displayMode,
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     backgroundColor: ConstantColors.lightBackgroundcolor,
    //     tooltip: "New Todo",
    //     hoverColor: Colors.amber,
    //     hoverElevation: 60.3,
    //     onPressed: () {
    //       showModalBottomSheet<void>(
    //         backgroundColor: themeProvider.displayMode == "dark"
    //             ? ConstantColors.darkBackgroundcolor
    //             : ConstantColors.lightBackgroundcolor,
    //         context: context,
    //         showDragHandle: true,
    //         enableDrag: true,
    //         isScrollControlled: true,
    //         constraints:
    //             BoxConstraints(minWidth: MediaQuery.of(context).size.width),
    //         anchorPoint: const Offset(1000, 2000),
    //         builder: (BuildContext context) {
    //           return StatefulBuilder(
    //             builder: (BuildContext context, StateSetter setModalState) {
    //               return Container(
    //                 padding: const EdgeInsets.all(5),
    //                 margin: const EdgeInsets.all(10),
    //                 child: Form(
    //                   child: Column(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       Container(
    //                         alignment: AlignmentDirectional.topStart,
    //                         child: Text(
    //                           "Create New ToDo:",
    //                           style: TextStyle(
    //                             color: themeProvider.displayMode == "dark"
    //                                 ? ConstantColors.darktextColors
    //                                 : ConstantColors.lighttextColors,
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 10,
    //                       ),
    //                       // title form field
    //                       TextFormField(
    //                         style: TextStyle(
    //                           color: themeProvider.displayMode == "dark"
    //                               ? ConstantColors.darktextColors
    //                               : ConstantColors.lighttextColors,
    //                         ),
    //                         controller: titleController,
    //                         decoration: InputDecoration(
    //                           icon: Icon(Icons.title,
    //                               color: themeProvider.displayMode == "dark"
    //                                   ? ConstantColors.darktextColors
    //                                   : ConstantColors.lighttextColors),
    //                           border: const OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.white),
    //                             borderRadius:
    //                                 BorderRadius.all(Radius.circular(5)),
    //                           ),
    //                           label: Text(
    //                             "Title",
    //                             style: TextStyle(
    //                               color: themeProvider.displayMode == "dark"
    //                                   ? ConstantColors.darktextColors
    //                                   : ConstantColors.lighttextColors,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(height: 10),
    //                       // description form field
    //                       TextFormField(
    //                         style: TextStyle(
    //                           color: themeProvider.displayMode == "dark"
    //                               ? ConstantColors.darktextColors
    //                               : ConstantColors.lighttextColors,
    //                         ),
    //                         controller: descriptionController,
    //                         decoration: InputDecoration(
    //                           icon: const Icon(
    //                             Icons.description,
    //                             color: Colors.white,
    //                           ),
    //                           border: const OutlineInputBorder(
    //                             borderSide: BorderSide(color: Colors.white),
    //                             borderRadius:
    //                                 BorderRadius.all(Radius.circular(5)),
    //                           ),
    //                           label: Text(
    //                             "description",
    //                             style: TextStyle(
    //                                 color: themeProvider.displayMode == "dark"
    //                                     ? ConstantColors.darktextColors
    //                                     : ConstantColors.lighttextColors),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 10,
    //                       ),

    //                       // DueDate form field
    //                       Row(
    //                         children: [
    //                           const Icon(Icons.date_range, color: Colors.white),
    //                           const SizedBox(width: 15),
    //                           Container(
    //                             width: MediaQuery.of(context).size.width - 70,
    //                             decoration: BoxDecoration(
    //                               border: Border.all(color: Colors.white),
    //                             ),
    //                             child: ElevatedButton(
    //                               style: ElevatedButton.styleFrom(
    //                                 backgroundColor: Colors.black,
    //                                 shape: RoundedRectangleBorder(
    //                                   borderRadius: BorderRadius.circular(0),
    //                                 ),
    //                               ),
    //                               child: Text(
    //                                 dueDate == null
    //                                     ? "Due Date: dd/mm/yyyy"
    //                                     : "${dueDate!.day}/${dueDate!.month}/${dueDate!.year} ${dueDate!.hour}:${dueDate!.minute}",
    //                                 style: const TextStyle(color: Colors.white),
    //                               ),
    //                               onPressed: () async {
    //                                 DateTime? dateTime =
    //                                     await showOmniDateTimePicker(
    //                                   context: context,
    //                                 );

    //                                 if (dateTime != null) {
    //                                   setModalState(() {
    //                                     dueDate = dateTime;
    //                                   });
    //                                 }
    //                               },
    //                             ),
    //                           ),
    //                         ],
    //                       ),

    //                       const SizedBox(height: 10),

    //                       // priority form field
    //                       Container(
    //                         child: Row(
    //                           children: [
    //                             Icon(
    //                               Icons.list,
    //                               color: themeProvider.displayMode == "dark"
    //                                   ? ConstantColors.darktextColors
    //                                   : ConstantColors.lighttextColors,
    //                             ),
    //                             const SizedBox(width: 15),
    //                             Expanded(
    //                               child: DropdownButtonFormField(
    //                                 value: "",
    //                                 dropdownColor: themeProvider.displayMode ==
    //                                         "dark"
    //                                     ? ConstantColors.darkBackgroundcolor
    //                                     : ConstantColors.lightBackgroundcolor,
    //                                 focusColor: themeProvider.displayMode ==
    //                                         "dark"
    //                                     ? ConstantColors.darkBackgroundcolor
    //                                     : ConstantColors.lightBackgroundcolor,
    //                                 icon: const Icon(Icons.list),
    //                                 items: [
    //                                   DropdownMenuItem(
    //                                     enabled: false,
    //                                     value: "",
    //                                     child: Text(
    //                                       "Choose Priority =>",
    //                                       style: TextStyle(
    //                                         color: themeProvider.displayMode ==
    //                                                 "dark"
    //                                             ? ConstantColors.darktextColors
    //                                             : ConstantColors
    //                                                 .lighttextColors,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                   DropdownMenuItem(
    //                                     value: "low",
    //                                     child: Row(
    //                                       children: [
    //                                         const Icon(
    //                                           Icons.keyboard_double_arrow_down,
    //                                           color: Colors.blue,
    //                                         ),
    //                                         const SizedBox(
    //                                           width: 10,
    //                                         ),
    //                                         Text(
    //                                           "low",
    //                                           style: TextStyle(
    //                                               color:
    //                                                   themeProvider
    //                                                               .displayMode ==
    //                                                           "dark"
    //                                                       ? ConstantColors
    //                                                           .darktextColors
    //                                                       : ConstantColors
    //                                                           .lighttextColors),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   DropdownMenuItem(
    //                                     value: "Medium",
    //                                     child: Row(
    //                                       children: [
    //                                         const Icon(
    //                                           Icons.keyboard_double_arrow_right,
    //                                           color: Colors.green,
    //                                         ),
    //                                         const SizedBox(
    //                                           width: 10,
    //                                         ),
    //                                         Text(
    //                                           "Medium",
    //                                           style: TextStyle(
    //                                             color:
    //                                                 themeProvider
    //                                                             .displayMode ==
    //                                                         "dark"
    //                                                     ? ConstantColors
    //                                                         .darktextColors
    //                                                     : ConstantColors
    //                                                         .lighttextColors,
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                   DropdownMenuItem(
    //                                     value: "High",
    //                                     child: Row(
    //                                       children: [
    //                                         const Icon(
    //                                           Icons.keyboard_double_arrow_up,
    //                                           color: Colors.red,
    //                                         ),
    //                                         const SizedBox(
    //                                           width: 10,
    //                                         ),
    //                                         Text(
    //                                           "High",
    //                                           style: TextStyle(
    //                                             color:
    //                                                 themeProvider
    //                                                             .displayMode ==
    //                                                         "dark"
    //                                                     ? ConstantColors
    //                                                         .darktextColors
    //                                                     : ConstantColors
    //                                                         .lighttextColors,
    //                                           ),
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 ],
    //                                 onChanged: (value) {},
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                       const SizedBox(height: 10),
    //                       ElevatedButton(
    //                         style: ButtonStyle(
    //                           backgroundColor: WidgetStatePropertyAll(
    //                               _areFieldsEmpty ? Colors.grey : Colors.blue),
    //                         ),
    //                         onPressed: () {},
    //                         child: Text(
    //                           "submit",
    //                           style: TextStyle(
    //                             color: themeProvider.displayMode == "dark"
    //                                 ? ConstantColors.lighttextColors
    //                                 : ConstantColors.darktextColors,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               );
    //             },
    //           );
    //         },
    //       );
    //     },
    //     child: const Icon(
    //       Icons.add_task_rounded,
    //       size: 30,
    //     ),
    //   ),
    // );
  }
}


class DynamicBottomSheetExample extends StatefulWidget {
  @override
  _DynamicBottomSheetExampleState createState() =>
      _DynamicBottomSheetExampleState();
}

class _DynamicBottomSheetExampleState extends State<DynamicBottomSheetExample> {
  double _bottomSheetHeight = 0.0; // Current height of the bottom sheet
  final double _minHeight = 0.0; // Minimum height of the bottom sheet
  final double _maxHeight = 600.0; // Maximum height of the bottom sheet

  void _toggleBottomSheet() {
    setState(() {
      // Toggle between minimum and maximum height
      _bottomSheetHeight =
          _bottomSheetHeight == _minHeight ? _maxHeight / 2 : _minHeight;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      // Adjust the height based on drag direction
      _bottomSheetHeight =
          (_bottomSheetHeight - details.delta.dy).clamp(_minHeight, _maxHeight);
    });
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    setState(() {
      // Snap to the nearest boundary based on current height
      if (_bottomSheetHeight < _maxHeight / 3) {
        _bottomSheetHeight = _minHeight; // Close if dragged below 1/3 height
      } else if (_bottomSheetHeight > _maxHeight * 2 / 3) {
        _bottomSheetHeight = _maxHeight; // Fully open if dragged above 2/3 height
      } else {
        _bottomSheetHeight = _maxHeight / 2; // Snap to half-height otherwise
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Draggable Bottom Sheet"),
      ),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _toggleBottomSheet,
              child: Text(_bottomSheetHeight == _minHeight
                  ? "Show Bottom Sheet"
                  : "Hide Bottom Sheet"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onVerticalDragUpdate: _onVerticalDragUpdate,
              onVerticalDragEnd: _onVerticalDragEnd,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 10),
                curve: Curves.easeInOut,
                height: _bottomSheetHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: _bottomSheetHeight > 0
                    ? Column(
                        children: [
                          SizedBox(height: 10),
                          Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: ListView(
                              children: List.generate(
                                20,
                                (index) => ListTile(
                                  title: Text("Item $index"),
                                  onTap: () => print("Tapped Item $index"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}