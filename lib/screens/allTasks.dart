import 'package:flutter/material.dart';
import 'day_task_list.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';
import 'sideMenuScreen.dart';
import 'topbar.dart';

class AllTasksScreen extends StatefulWidget {
  @override
  _AllTasksScreenState createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: topBar(context),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    final nameHolder = TextEditingController();
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: <Widget>[
          Expanded(
            child: DayTaskList(),
          ),
          Container(
              padding: EdgeInsets.all(8),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (newText) {
                      newTaskTitle = newText;
                    },
                    controller: nameHolder,
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(30, 25, 0, 0),
                      labelText: "I Want to...",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                      ),
                      fillColor: Colors.blue,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(newTaskTitle);
                      nameHolder.clear();
                      newTaskTitle = '';
                    },
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}
