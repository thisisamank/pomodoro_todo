import 'package:flutter/material.dart';
import 'package:pomodoro_todo/constants/colors.dart';
import 'package:pomodoro_todo/constants/styles.dart';

class NewTaskAdd extends StatefulWidget {
  @override
  _NewTaskAddState createState() => _NewTaskAddState();
}

class _NewTaskAddState extends State<NewTaskAdd> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.primaryBackground,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded),
            color: BrandColors.secondaryText,
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          Text(
            'New Task',
            style: BrandTextStyles.heading1,
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: size.width * .95,
              child: Text('sndn'),
              color: BrandColors.secondaryBackground,
            ),
          )
        ],
      )),
    );
  }
}
