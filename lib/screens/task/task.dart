import 'package:flutter/material.dart';
import 'package:pomodoro_todo/constants/colors.dart';
import 'package:pomodoro_todo/constants/styles.dart';
import 'package:pomodoro_todo/model/task_model.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final _tasks = Task.tasks;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var estimatedTime = 0;
    _tasks.forEach((element) =>
        estimatedTime = element.workIntervals * element.noOfIntervals);
    print((estimatedTime / 60).toStringAsFixed(1));
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Text(
              "Today",
              style: BrandTextStyles.heading1,
            ),
            SizedBox(height: 24),
            Container(
                width: size.width * .85,
                height: 60,
                decoration: BoxDecoration(
                    color: BrandColors.secondaryBackground,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$estimatedTime',
                      style: BrandTextStyles.heading1.copyWith(fontSize: 38),
                    ),
                    SizedBox(width: 12),
                    Text('Estimated \nTime (h)', style: BrandTextStyles.body1),
                    SizedBox(width: 12),
                    Text(
                      '|',
                      style: BrandTextStyles.body1.copyWith(
                        fontSize: 42,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      '${_tasks.length}',
                      style: BrandTextStyles.heading1.copyWith(fontSize: 38),
                    ),
                    SizedBox(width: 12),
                    Text('Total tasks\nin projects',
                        style: BrandTextStyles.body1),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
