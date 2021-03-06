import 'package:flutter/material.dart';
import 'package:pomodoro_todo/data/task_priority.dart';

class Task {
  final String taskName;
  final String description;
  final TaskPriority priority;
  final int totalNoOfIntervals;
  int completedNoOfIntervals;

  /// [workIntervals] is to store the duration
  /// of each interval
  final int workIntervals;
  final int breakIntervals;
  int completedMinutes;
  bool isCompleted = false;
  Task({
    this.completedNoOfIntervals = 0,
    this.completedMinutes,
    @required this.taskName,
    this.description,
    @required this.priority,
    @required this.totalNoOfIntervals,
    @required this.workIntervals,
    @required this.breakIntervals,
  });

  Task copyWith({
    String taskName,
    String description,
    TaskPriority priority,
    int totalIntervals,
    int completedIntervals,
    int workIntervals,
    int breakIntervals,
    int completedMinutes,
  }) {
    return Task(
      taskName: taskName ?? this.taskName,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      totalNoOfIntervals: totalIntervals ?? this.totalNoOfIntervals,
      completedNoOfIntervals: completedIntervals ?? this.completedNoOfIntervals,
      workIntervals: workIntervals ?? this.workIntervals,
      breakIntervals: breakIntervals ?? this.breakIntervals,
      completedMinutes: completedMinutes ?? this.completedMinutes,
    );
  }

  static List<Task> tasks = [
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
  void markComplete(bool completed) {
    isCompleted = completed;
  }
}
