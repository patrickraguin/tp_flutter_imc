import 'dart:math';

enum Sex { man, woman }

enum ImcValue { underweight, overweight, normal }

class Imc {
  Sex sex;
  int size;
  int weight;

  Imc({required this.sex, required this.size, required this.weight});

  ImcValue get calc {
    final double value = weight / pow(size.toDouble() / 100, 2);
    if (value < 18.5) {
      return ImcValue.underweight;
    } else if (value > 30) {
      return ImcValue.overweight;
    } else {
      return ImcValue.normal;
    }
  }
}
