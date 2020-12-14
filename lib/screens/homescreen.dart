import 'dart:convert';

import 'package:ChopperWithApi/screens/singletaskscreen.dart';
import 'package:ChopperWithApi/services/post_api_service.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ChopperWithApi/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
      ),
      body: Widgets().buildBody(context),
    );
  }
}
