import 'package:flutter/material.dart';
import 'package:pomodoro_todo/constants/colors.dart';
import 'package:pomodoro_todo/constants/styles.dart';
import 'package:pomodoro_todo/data/model/task_model.dart';
import 'package:pomodoro_todo/widgets/circular_icon.dart';
import 'package:pomodoro_todo/widgets/circular_status.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    @required this.size,
    @required this.statusColor,
    @required this.statusBorderColor,
    @required this.task,
    @required this.iconColor,
    @required this.suffixIcon,
    this.prefixIcon,
  });

  final Size size;
  final statusColor;
  final statusBorderColor;
  final Task task;
  final Color iconColor;
  final IconData suffixIcon;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .8,
      height: 60,
      decoration: BoxDecoration(
        color: BrandColors.secondaryBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(width: 0),
        prefixIcon == null
            ? CircularStatus(
                statusColor: statusColor,
                borderColor: statusBorderColor,
              )
            : CircularIcon(
                color: statusColor,
                icon: prefixIcon,
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
              '${task.completedNoOfIntervals.toString()} minutes',
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
              '${task.completedNoOfIntervals}/${task.totalNoOfIntervals}',
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
        CircularIcon(color: iconColor, icon: suffixIcon),
        SizedBox(width: 0),
      ]),
    );
  }
}
