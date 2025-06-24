import 'package:flutter/material.dart';

class TodoBody extends StatefulWidget {
  final String displayMode;

  const TodoBody({super.key, required this.displayMode});

  @override
  State<TodoBody> createState() => _TodoBodyState();
}

/* 
  - add form for todo
  - add button for each todo to edit and delete
  - add logo for each priority level
  - show description (only first 10 chars)
  - if click on description then showDialog with all details of that Todo
  - or to delete we can make user to click long press then show a dialog for edit or delete.
   */
class _TodoBodyState extends State<TodoBody> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                    const Expanded(
                      flex: 3,
                      child: Icon(Icons.abc),
                    ),
                    const Expanded(
                      flex: 7,
                      child: Text("hello"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
