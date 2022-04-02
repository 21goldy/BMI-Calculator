import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You are overweight! Reduce portion sizes for higher calorie foods while increasing portion sizes of low-calorie foods.';
    } else if (_bmi >= 18.5) {
      return 'Congrats! You are in the healthy weight range.';
    } else {
      return 'You are underweight! Try almonds, sunflower seeds, fruit, or whole-grain, wheat toast. Go nutrient dense. Instead of eating empty calories and junk food, eat foods that are rich in nutrients.';
    }
  }
}
