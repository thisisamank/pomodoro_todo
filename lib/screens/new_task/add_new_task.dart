import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pomodoro_todo/constants/colors.dart';
import 'package:pomodoro_todo/constants/styles.dart';
import 'package:pomodoro_todo/data/model/task_model.dart';
import 'package:pomodoro_todo/data/provider/task_provider.dart';
import 'package:pomodoro_todo/data/task_priority.dart';
import 'package:pomodoro_todo/widgets/button.dart';
import 'package:pomodoro_todo/widgets/circular_status.dart';
import 'package:provider/provider.dart';

// TODO: this file needs code cleanup
class NewTaskAdd extends StatefulWidget {
  @override
  _NewTaskAddState createState() => _NewTaskAddState();
}

class _NewTaskAddState extends State<NewTaskAdd> {
  var pillHighBorder = BrandColors.secondaryText;
  var pillHighInside = BrandColors.secondaryText.withOpacity(.3);
  var pillMediumBorder = BrandColors.secondaryText;
  var pillMediumInside = BrandColors.secondaryText.withOpacity(.3);
  var pillLowBorder = BrandColors.secondaryText;
  var pillLowInside = BrandColors.secondaryText.withOpacity(.3);
  var priority = TaskPriority.low;
  var _taskIntervals = 1;
  var _timeIntervals = 1;
  var _breakIntervals = 1;

  final TextEditingController _taskNameController = new TextEditingController();
  final TextEditingController _taskDescriptionController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.primaryBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: BrandColors.secondaryText,
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
      backgroundColor: BrandColors.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Task',
                  style: BrandTextStyles.heading1,
                ),
                SizedBox(height: 14),
                _newTaskWidget(size),
                SizedBox(height: 14),
                Text(
                  'Task Priority',
                  style: BrandTextStyles.heading1.copyWith(fontSize: 22),
                ),
                SizedBox(height: 14),
                _priorityPills(size),
                SizedBox(height: 14),
                _taskTimeIntervals(size),
                SizedBox(height: 14),
                Center(
                  child: Button(
                    title: 'Add Task',
                    color: BrandColors.blue,
                    height: 45,
                    width: size.width * 0.8,
                    onPressed: () {
                      final taskName = _taskNameController.text;
                      final descriptionName = _taskDescriptionController.text;
                      print(taskName);
                      print(descriptionName);
                      if (!(taskName.isEmpty || descriptionName.isEmpty)) {
                        provider.addTask(new Task(
                          taskName: taskName,
                          breakIntervals: _breakIntervals,
                          workIntervals: _timeIntervals,
                          totalNoOfIntervals: _taskIntervals,
                          priority: priority,
                        ));
                        Navigator.popAndPushNamed(context, '/');
                      }
                    },
                    textColor: BrandColors.primaryText,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _taskTimeIntervals(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: BrandColors.secondaryBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      height: size.height / 3,
      width: size.width * .9,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tasks",
                  style: BrandTextStyles.body1.copyWith(
                    color: BrandColors.primaryText,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Intervals",
                  style: BrandTextStyles.body1.copyWith(
                    fontSize: 14,
                  ),
                )
              ],
            ),
            NumberPicker(
              itemCount: 5,
              itemWidth: 60,
              minValue: 1,
              maxValue: 15,
              textStyle: TextStyle(
                color: BrandColors.primaryText,
                fontSize: 16,
              ),
              selectedTextStyle: TextStyle(
                color: BrandColors.blue,
                fontSize: 24,
              ),
              value: _taskIntervals,
              onChanged: (int selected) {
                setState(() {
                  _taskIntervals = selected;
                });
              },
              axis: Axis.horizontal,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Work Intervals",
                  style: BrandTextStyles.body1.copyWith(
                    color: BrandColors.primaryText,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Minutes",
                  style: BrandTextStyles.body1.copyWith(
                    fontSize: 14,
                  ),
                )
              ],
            ),
            NumberPicker(
              itemCount: 5,
              itemWidth: 60,
              minValue: 1,
              maxValue: 45,
              textStyle: TextStyle(
                color: BrandColors.primaryText,
                fontSize: 16,
              ),
              selectedTextStyle: TextStyle(
                color: BrandColors.blue,
                fontSize: 24,
              ),
              value: _timeIntervals,
              onChanged: (int selected) {
                setState(() {
                  _timeIntervals = selected;
                });
              },
              axis: Axis.horizontal,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Break Intervals",
                  style: BrandTextStyles.body1.copyWith(
                    color: BrandColors.primaryText,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Minutes",
                  style: BrandTextStyles.body1.copyWith(
                    fontSize: 14,
                  ),
                )
              ],
            ),
            NumberPicker(
              itemCount: 5,
              itemWidth: 60,
              minValue: 1,
              maxValue: 15,
              textStyle: TextStyle(
                color: BrandColors.primaryText,
                fontSize: 16,
              ),
              selectedTextStyle: TextStyle(
                color: BrandColors.blue,
                fontSize: 24,
              ),
              value: _breakIntervals,
              onChanged: (int selected) {
                setState(() {
                  _breakIntervals = selected;
                });
              },
              axis: Axis.horizontal,
            ),
          ],
        ),
      ),
    );
  }

  Container _priorityPills(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: BrandColors.secondaryBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      width: size.width * .95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                pillHighInside = BrandColors.red;
                pillHighBorder = BrandColors.brightRed;
                pillMediumBorder = pillLowBorder = BrandColors.secondaryText;
                pillMediumInside =
                    pillLowInside = BrandColors.secondaryText.withOpacity(.3);
                priority = TaskPriority.high;
              });
            },
            child: CircularPills(
              statusColor: pillHighInside,
              borderColor: pillHighBorder,
              text: 'High',
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pillMediumInside = BrandColors.brown;
                pillMediumBorder = BrandColors.lightBrown;
                pillHighBorder = pillLowBorder = BrandColors.secondaryText;
                pillHighInside =
                    pillLowInside = BrandColors.secondaryText.withOpacity(.3);
                priority = TaskPriority.medium;
              });
            },
            child: CircularPills(
              statusColor: pillMediumInside,
              borderColor: pillMediumBorder,
              text: 'Medium',
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                pillLowInside = BrandColors.green;
                pillLowBorder = BrandColors.lightGreen;
                pillHighBorder = pillMediumBorder = BrandColors.secondaryText;
                pillHighInside = pillMediumInside =
                    BrandColors.secondaryText.withOpacity(.3);
                priority = TaskPriority.low;
              });
            },
            child: CircularPills(
              statusColor: pillLowInside,
              borderColor: pillLowBorder,
              text: 'Low',
            ),
          ),
        ],
      ),
    );
  }

  Container _newTaskWidget(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: BrandColors.secondaryBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 110,
      width: size.width * .95,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _taskNameController,
              style: BrandTextStyles.inputStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Task Name',
                hintStyle: BrandTextStyles.inputStyle,
              ),
            ),
            TextField(
              controller: _taskDescriptionController,
              style: BrandTextStyles.inputStyleSecondary,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Short Description',
                hintStyle: BrandTextStyles.inputStyleSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
