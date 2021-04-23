import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';

//Being used to only add a taskpage name & link to the page / list from the sidemenu

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newPageTitle;

    return Container(
      color: Color(0xff2a2a2a),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(0xff03506f),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Make New Tasks List',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'List name...',
              ),
              textAlign: TextAlign.center,
              onChanged: (newPage) {
                newPageTitle = newPage;
              },
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                'Add Page',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<TaskPageData>(context, listen: false)
                    .addnewpage(newPageTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
