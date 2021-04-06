import 'package:flutter/material.dart';

class Task {
  final String taskName;
  final String description;
  final TaskPriority priority;
  final int noOfIntervals;

  /// [workIntervals] is to store the duration
  /// of each interval
  final int workIntervals;
  final int breakIntervals;
  bool isCompleted = false;
  Task({
    @required this.taskName,
    this.description,
    @required this.priority,
    @required this.noOfIntervals,
    @required this.workIntervals,
    @required this.breakIntervals,
  });

  Task copyWith({
    String taskName,
    String description,
    TaskPriority priority,
    int noOfIntervals,
    int workIntervals,
    int breakIntervals,
  }) {
    return Task(
      taskName: taskName ?? this.taskName,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      noOfIntervals: noOfIntervals ?? this.noOfIntervals,
      workIntervals: workIntervals ?? this.workIntervals,
      breakIntervals: breakIntervals ?? this.breakIntervals,
    );
  }

  static List<Task> tasks = [
    Task(
      taskName: 'Homework',
      description: 'Non voluptate eu velit in magna.',
      priority: TaskPriority.medium,
      noOfIntervals: 3,
      workIntervals: 25,
      breakIntervals: 5,
    ),
    Task(
      taskName: 'Assignments',
      description: 'Irure amet tempor enim ea excepteur.',
      priority: TaskPriority.high,
      noOfIntervals: 5,
      workIntervals: 25,
      breakIntervals: 8,
    ),
    Task(
      taskName: 'Files',
      priority: TaskPriority.high,
      noOfIntervals: 3,
      workIntervals: 25,
      breakIntervals: 5,
    ),
  ];
}

set isCompleted(bool completed) {
  isCompleted = completed;
}

enum TaskPriority { high, medium, low }
