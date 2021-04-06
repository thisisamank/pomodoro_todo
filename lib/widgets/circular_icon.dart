import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  final Color color;
  final IconData icon;
  CircularIcon({this.color, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 1),
          borderRadius: BorderRadius.circular(20)),
      child: Icon(icon, color: color, size: 15),
    );
  }
}
