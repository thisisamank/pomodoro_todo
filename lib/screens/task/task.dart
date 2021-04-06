import 'package:flutter/material.dart';
import 'package:pomodoro_todo/constants/colors.dart';
import 'package:pomodoro_todo/constants/styles.dart';
import 'package:pomodoro_todo/model/task_model.dart';
import 'package:pomodoro_todo/widgets/circular_icon.dart';
import 'package:pomodoro_todo/widgets/circular_status.dart';

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
        estimatedTime = element.workIntervals * element.totalIntervals);
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
            todoData(size, estimatedTime),
            SizedBox(height: 24),
            Text(
              "All Tasks",
              style: BrandTextStyles.heading1.copyWith(fontSize: 18),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final statusColor =
                        getTaskPriorityColor(_tasks[index].priority);
                    final statusBorderColor =
                        getTaskPriorityBorderColor(_tasks[index].priority);
                    return getTaskWidget(
                        size, statusColor, statusBorderColor, _tasks[index]);
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: _tasks.length),
            )
          ],
        ),
      ),
    );
  }

  Container getTaskWidget(
      Size size, statusColor, statusBorderColor, Task task) {
    return Container(
      width: size.width * .8,
      height: 60,
      decoration: BoxDecoration(
        color: BrandColors.secondaryBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(width: 0),
        CircularStatus(
          statusColor: statusColor,
          borderColor: statusBorderColor,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              task.taskName,
              style: BrandTextStyles.body1.copyWith(
                color: Colors.grey.shade300,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '${task.completedIntervals.toString()} minutes',
              style: BrandTextStyles.body1.copyWith(
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
        SizedBox(width: 26),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${task.completedIntervals}/${task.totalIntervals}',
              style: BrandTextStyles.body1.copyWith(
                color: Colors.grey.shade300,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '${task.workIntervals.toString()} min',
              style: BrandTextStyles.body1.copyWith(
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
        CircularIcon(color: BrandColors.blue, icon: Icons.play_arrow_rounded),
        SizedBox(width: 0),
      ]),
    );
  }

  getTaskPriorityColor(TaskPriority priority) {
    if (priority == TaskPriority.high)
      return BrandColors.red;
    else if (priority == TaskPriority.medium)
      return BrandColors.brown;
    else
      return BrandColors.green;
  }

  getTaskPriorityBorderColor(TaskPriority priority) {
    if (priority == TaskPriority.high)
      return BrandColors.brightRed;
    else if (priority == TaskPriority.medium)
      return BrandColors.lightBrown;
    else
      return BrandColors.lightGreen;
  }

  Widget todoData(Size size, int estimatedTime) {
    return Container(
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
                fontSize: 38,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(width: 12),
            Text(
              '${_tasks.length}',
              style: BrandTextStyles.heading1.copyWith(fontSize: 38),
            ),
            SizedBox(width: 12),
            Text('Total tasks\nin projects', style: BrandTextStyles.body1),
          ],
        ));
  }
}
