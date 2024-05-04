import 'package:blood_donation/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class countdown extends StatelessWidget {
  const countdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: 70,
      build: (BuildContext context, double time) => Text(
        time.toString(),
        style: buttonstyle.copyWith(fontSize: 24),
      ),
      interval: Duration(seconds: 1),
      onFinished: () {
  
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('try again')));
      },
    );
  }
}