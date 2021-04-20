import 'package:flutter/material.dart';
import 'package:pomodoro_todo/constants/colors.dart';

class CircularStatus extends StatelessWidget {
  final Color statusColor;
  final Color borderColor;
  CircularStatus({@required this.statusColor, @required this.borderColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          color: statusColor,
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(20)),
      child: Text(' '),
    );
  }
}

class CircularPills extends StatelessWidget {
  final Color statusColor;
  final Color borderColor;
  final text;
  CircularPills(
      {@required this.statusColor,
      @required this.borderColor,
      @required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 25,
      decoration: BoxDecoration(
          color: statusColor,
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 14, color: borderColor),
        ),
      ),
    );
  }
}
