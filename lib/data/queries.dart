class SqlQueries {
  static final createTasksTable = """
  CREATE TABLE tasks(
    id INTEGER PRIMARY KEY,
    taskName TEXT,
    description TEXT,
    totalNoOfIntervals INTEGER,
    completedNoOfIntervals INTEGER,
    workIntervals INTEGER,
    breakIntervals INTEGER,
    completedMinutes INTEGER,
    isCompleted INTEGER
  );
  """;
  // final String taskName;
  // final String description;
  // final TaskPriority priority;
  // final int totalIntervals;
  // final int completedIntervals;

  // /// [workIntervals] is to store the duration
  // /// of each interval
  // final int workIntervals;
  // final int breakIntervals;
  // final int completedMinutes;
  // bool isCompleted = false;
}
