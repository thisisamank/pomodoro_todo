import 'package:flutter/material.dart';
import 'package:pomodoro_todo/constants/colors.dart';
import 'package:pomodoro_todo/data/provider/task_provider.dart';
import 'package:pomodoro_todo/screens/new_task/add_new_task.dart';
import 'package:pomodoro_todo/screens/task/task.dart';
import 'package:pomodoro_todo/screens/timer/timer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;

  List<Widget> screens = [Timer(), Tasks()];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskProvider>(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        routes: {
          '/newTask': (context) => NewTaskAdd(),
        },
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: _changeScreen,
            currentIndex: _currentIndex,
            selectedItemColor: BrandColors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor: BrandColors.secondaryBackground,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.alarm_add_outlined), label: 'Timer'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_view_day_sharp), label: 'Works'),
            ],
          ),
          backgroundColor: BrandColors.primaryBackground,
          body: IndexedStack(
            children: screens,
            index: _currentIndex,
          ),
        ),
      ),
    );
  }

  _changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
