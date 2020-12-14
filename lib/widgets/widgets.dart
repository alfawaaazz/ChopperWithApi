import 'dart:convert';

import 'package:ChopperWithApi/screens/singletaskscreen.dart';
import 'package:ChopperWithApi/services/post_api_service.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Widgets {
  FutureBuilder<Response> buildBody(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List tasks = json.decode(snapshot.data.bodyString);
          return _buildTasks(context, tasks);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildTasks(BuildContext context, List tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              tasks[index]["title"],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(tasks[index]["description"]),
            onTap: () => _navigateToTask(context, tasks[index]),
          ),
        );
      },
    );
  }

  void _navigateToTask(BuildContext context, Map taskItem) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SingleTaskScreen(
          taskItem: taskItem,
        ),
      ),
    );
  }

  Padding buildTask(Map taskItem) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            taskItem["title"],
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(taskItem["description"]),
        ],
      ),
    );
  }
}
