import 'package:flutter/material.dart';

// bool _value = false;

class DayTaskTile extends StatefulWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  DayTaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.longPressCallback});

  @override
  _DayTaskTileState createState() => _DayTaskTileState();
}

class _DayTaskTileState extends State<DayTaskTile> {
  // int _currentValue = 4;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.isChecked,
        onChanged: widget.checkboxCallback,
      ),
      onLongPress: widget.longPressCallback,
      title: Text(
        widget.taskTitle,
        style: TextStyle(
            decoration: widget.isChecked ? TextDecoration.lineThrough : null),
      ),
    );
  }
}
