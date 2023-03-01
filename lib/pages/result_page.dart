import 'package:flutter/material.dart';

import '../models/imc.dart';
import '../widgets/imc_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({required this.imc, Key? key}) : super(key: key);

  final Imc imc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Résultat'),
        ),
        body: Column(
          children: [
            ImcCard(
              value: imc.calc,
              label: 'IMC',
              width: MediaQuery.of(context).size.width,
            ),
            Row(
              children: [
                Expanded(
                    child: ImcCard(
                  value: '${imc.size.toString()} cm',
                  label: 'Taille',
                )),
                Expanded(
                    child: ImcCard(
                  value: '${imc.weight.toString()} kg',
                  label: 'Poids',
                )),
              ],
            )
          ],
        ));
  }
}
