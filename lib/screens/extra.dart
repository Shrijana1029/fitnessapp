import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

void main() => runApp(StepCounterApp());

class StepCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: StepCounter());
  }
}

class StepCounter extends StatefulWidget {
  @override
  _StepCounterState createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
  late Stream<StepCount> _stepCountStream;
  String steps = "0";

  @override
  void initState() {
    super.initState();
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(_onStepCount).onError(_onError);
  }

  void _onStepCount(StepCount event) {
    setState(() => steps = event.steps.toString());
  }

  void _onError(error) {
    print("Step Count Error: $error");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step Counter')),
      body: Center(
        child: Text('Steps: $steps', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
