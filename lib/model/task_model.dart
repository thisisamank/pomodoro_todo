import 'package:flutter/material.dart';

class Task {
  final String taskName;
  final String description;
  final TaskPriority priority;
  final int totalIntervals;
  final int completedIntervals;

  /// [workIntervals] is to store the duration
  /// of each interval
  final int workIntervals;
  final int breakIntervals;
  final int completedMinutes;
  bool isCompleted = false;
  Task({
    this.completedIntervals = 0,
    this.completedMinutes,
    @required this.taskName,
    this.description,
    @required this.priority,
    @required this.totalIntervals,
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
      totalIntervals: totalIntervals ?? this.totalIntervals,
      completedIntervals: completedIntervals ?? this.completedIntervals,
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
      totalIntervals: 3,
      workIntervals: 25,
      breakIntervals: 5,
    ),
    Task(
      taskName: 'Assignments',
      description: 'Irure amet tempor enim ea excepteur.',
      priority: TaskPriority.high,
      totalIntervals: 5,
      workIntervals: 25,
      breakIntervals: 8,
    ),
    Task(
      taskName: 'Files',
      priority: TaskPriority.low,
      totalIntervals: 3,
      workIntervals: 25,
      breakIntervals: 5,
    ),
  ];
}

set isCompleted(bool completed) {
  isCompleted = completed;
}

enum TaskPriority { high, medium, low }
