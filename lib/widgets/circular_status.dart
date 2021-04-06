import 'package:flutter/material.dart';

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
