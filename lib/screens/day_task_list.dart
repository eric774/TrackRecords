import 'package:flutter/material.dart';
import 'day_task_tile.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DayTaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                child: DayTaskTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  },
                  longPressCallback: () {
                    taskData.deleteTask(task);
                  },
                ),
              ),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Archive',
                  color: Colors.yellowAccent,
                  icon: Icons.archive_outlined,
                  // onTap: () => _showSnackBar('More'),
                ),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () => taskData.deleteTask(task),
                ),
              ],
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
