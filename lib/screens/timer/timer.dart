import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_todo/constants/colors.dart';
import 'package:pomodoro_todo/widgets/button.dart';

class Timer extends StatefulWidget {
  static final timerController = CountDownController();

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  bool isPaused = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 80),
        Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: BrandColors.tertiaryBackground,
                  blurRadius: 50,
                  offset: Offset(-10, -20),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: CircularCountDownTimer(
              duration: 600,
              initialDuration: 0,
              controller: Timer.timerController,
              width: 200,
              height: 200,
              ringColor: BrandColors.secondaryBackground,
              ringGradient: null,
              fillColor: BrandColors.blue,
              fillGradient: null,
              backgroundColor: BrandColors.primaryBackground,
              backgroundGradient: null,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              textStyle: TextStyle(
                  fontSize: 33.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textFormat: CountdownTextFormat.MM_SS,
              isReverse: true,
              isReverseAnimation: true,
              isTimerTextShown: true,
              onStart: () {
                print('Countdown Started');
              },
              onComplete: () {
                print('Countdown Ended');
              },
            ),
          ),
        ),
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              onPressed: () {
                if (isPaused) {
                  Timer.timerController.resume();
                  isPaused = !isPaused;
                  setState(() {});
                  print('Resumed');
                } else {
                  Timer.timerController.pause();
                  isPaused = !isPaused;
                  setState(() {});
                  print('paused');
                }
              },
              title: isPaused == true ? 'Resume' : 'Pause',
              width: 140,
              height: 45,
            ),
            SizedBox(width: 20),
            Button(
              onPressed: () {
                Timer.timerController.pause();
              },
              title: 'Stop',
              color: BrandColors.secondaryBlue,
              textColor: BrandColors.blue,
              width: 140,
              height: 45,
            ),
          ],
        )
      ],
    );
  }
}
