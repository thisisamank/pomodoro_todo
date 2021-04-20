import 'package:flutter/material.dart';
import 'package:pomodoro_todo/constants/colors.dart';
import 'package:pomodoro_todo/constants/styles.dart';
import 'package:pomodoro_todo/data/model/task_model.dart';
import 'package:pomodoro_todo/data/provider/task_provider.dart';
import 'package:pomodoro_todo/data/task_priority.dart';
import 'package:pomodoro_todo/screens/task/new_task_widget.dart';
import 'package:pomodoro_todo/widgets/button.dart';
import 'package:provider/provider.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<Task> completedTasks = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, TaskProvider provider, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text(
                "Today",
                style: BrandTextStyles.heading1,
              ),
              SizedBox(height: 16),
              todoData(size, provider),
              SizedBox(height: 16),
              Text(
                "All Tasks",
                style: BrandTextStyles.heading1.copyWith(fontSize: 18),
              ),
              SizedBox(height: 16),
              Expanded(
                flex: 2,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final statusColor =
                          getTaskPriorityColor(provider.tasks[index].priority);
                      final statusBorderColor = getTaskPriorityBorderColor(
                          provider.tasks[index].priority);
                      return TaskWidget(
                          size: size,
                          statusColor: statusColor,
                          statusBorderColor: statusBorderColor,
                          task: provider.tasks[index],
                          iconColor: BrandColors.blue,
                          suffixIcon: Icons.play_arrow_rounded);
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: provider.tasks.length),
              ),
              SizedBox(height: 16),
              Text(
                "Completed",
                style: BrandTextStyles.heading1.copyWith(fontSize: 18),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      print(index);
                      final statusColor =
                          getTaskPriorityColor(completedTasks[index].priority);
                      final statusBorderColor = getTaskPriorityBorderColor(
                          completedTasks[index].priority);
                      return TaskWidget(
                        size: size,
                        statusColor: BrandColors.lightGreen,
                        statusBorderColor: BrandColors.red,
                        task: completedTasks[index],
                        iconColor: BrandColors.brightRed,
                        suffixIcon: Icons.cancel_outlined,
                        prefixIcon: Icons.done,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: completedTasks.length),
              ),
              SizedBox(height: 6),
              Center(
                  child: Button(
                onPressed: () {
                  Navigator.pushNamed(context, '/newTask');
                },
                title: 'Add New Task',
                width: size.width * .8,
                height: 40,
              )),
              SizedBox(height: 6),
            ],
          ),
        ),
      ),
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

  Widget todoData(Size size, TaskProvider provider) {
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
              '${provider.estimatedTime}',
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
              '${provider.tasks.length}',
              style: BrandTextStyles.heading1.copyWith(fontSize: 38),
            ),
            SizedBox(width: 12),
            Text('Total tasks\nin projects', style: BrandTextStyles.body1),
          ],
        ));
  }
}
