import 'package:flutter/material.dart';
import 'package:flutter_calculator/pages/result_page.dart';

import '../l10n/L10n.dart';
import '../models/imc.dart';
import '../widgets/sex_button.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {required this.setLightTheme, required this.setDarkTheme, Key? key})
      : super(key: key);

  final void Function() setLightTheme;
  final void Function() setDarkTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Imc imc = Imc(sex: Sex.woman, size: 140, weight: 70);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          L10n.of(context).bmi,
        ),
        actions: [
          IconButton(
              onPressed: () => widget.setLightTheme(),
              icon: const Icon(Icons.light_mode)),
          IconButton(
              onPressed: () => widget.setDarkTheme(),
              icon: const Icon(Icons.dark_mode)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                        label: L10n.of(context).woman,
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
                        label: L10n.of(context).man,
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
                      Text(
                        L10n.of(context).size,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.red),
                      ),
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
                      Text(L10n.of(context).weight),
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ResultPage(imc: imc);
          }));
        },
        label: Text(L10n.of(context).calculate),
        icon: const Icon(Icons.check),
      ),
    );
  }
}
