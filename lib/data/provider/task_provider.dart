import 'package:flutter/foundation.dart';
import 'package:pomodoro_todo/data/model/task_model.dart';
import 'package:pomodoro_todo/data/task_priority.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
      taskName: 'Homework',
      description: 'Non voluptate eu velit in magna.',
      priority: TaskPriority.medium,
      totalNoOfIntervals: 3,
      workIntervals: 25,
      breakIntervals: 5,
    ),
    Task(
      taskName: 'Assignments',
      description: 'Irure amet tempor enim ea excepteur.',
      priority: TaskPriority.high,
      totalNoOfIntervals: 5,
      workIntervals: 25,
      breakIntervals: 8,
    ),
    Task(
      taskName: 'Files',
      priority: TaskPriority.low,
      totalNoOfIntervals: 3,
      workIntervals: 25,
      breakIntervals: 5,
    ),
  ];

  List<Task> get tasks => _tasks;

  void markDone(Task task) {
    task.isCompleted = true;
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateNoOfIntervals(Task task) {
    task.completedNoOfIntervals++;
    task.completedMinutes = task.workIntervals * task.completedNoOfIntervals;
    notifyListeners();
  }
}
