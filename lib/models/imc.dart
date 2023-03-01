import 'dart:math';

enum Sex { man, woman }

class Imc {
  Sex sex;
  int size;
  int weight;

  Imc({required this.sex, required this.size, required this.weight});

  String get calc {
    final double value = weight / pow(size.toDouble() / 100, 2);
    if (value < 18.5) {
      return 'Maigreur';
    } else if (value > 30) {
      return 'Obésité';
    } else {
      return 'Corpulence normale';
    }
  }
}
