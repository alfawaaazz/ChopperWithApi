import 'package:ChopperWithApi/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SingleTaskScreen extends StatelessWidget {
  final Map taskItem;
  const SingleTaskScreen({Key key, this.taskItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chopper Tasks"),
      ),
      body: Widgets().buildTask(taskItem),
    );
  }
}
