import 'package:flutter/material.dart';
import 'package:flutter_calculator/pages/result_page.dart';

import '../models/imc.dart';
import '../widgets/sex_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Imc imc = Imc(sex: Sex.woman, size: 140, weight: 70);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculateur IMC'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: SexButton(
                      label: 'Femme',
                      icon: Icons.woman,
                      isSelected: imc.sex == Sex.woman,
                      onPressed: () {
                        setState(() {
                          imc.sex = Sex.woman;
                        });
                      },
                    )),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: SexButton(
                      label: 'Homme',
                      icon: Icons.man,
                      isSelected: imc.sex == Sex.man,
                      onPressed: () {
                        setState(() {
                          imc.sex = Sex.man;
                        });
                      },
                    )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Taille'),
                    Text(
                      '${imc.size} cm',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Slider(
                  value: imc.size.toDouble(),
                  min: 100,
                  max: 220,
                  onChanged: (value) {
                    setState(() {
                      imc.size = value.toInt();
                    });
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Poids'),
                    Text(
                      '${imc.weight} kg',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Slider(
                  value: imc.weight.toDouble(),
                  min: 40,
                  max: 150,
                  onChanged: (value) {
                    setState(() {
                      imc.weight = value.toInt();
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ResultPage(imc: imc);
          }));
        },
        tooltip: 'Calculer',
        label: const Text('Calculer'),
        icon: const Icon(Icons.check),
      ),
    );
  }
}
