import 'package:flutter/material.dart';
import 'package:flutter_calculator/l10n/L10n.dart';

import '../models/imc.dart';
import '../widgets/imc_card.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({required this.imc, Key? key}) : super(key: key);

  final Imc imc;

  @override
  Widget build(BuildContext context) {
    late String imcStr;

    switch (imc.calc) {
      case ImcValue.underweight:
        imcStr = L10n.of(context).underweight;
        break;
      case ImcValue.overweight:
        imcStr = L10n.of(context).overweight;
        break;
      case ImcValue.normal:
        imcStr = L10n.of(context).normal;
        break;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(L10n.of(context).result),
        ),
        body: Column(
          children: [
            ImcCard(
              value: imcStr,
              label: L10n.of(context).bmi,
              width: MediaQuery.of(context).size.width,
            ),
            Row(
              children: [
                Expanded(
                    child: ImcCard(
                  value: L10n.of(context).result_size(imc.size),
                  label: L10n.of(context).size,
                )),
                Expanded(
                    child: ImcCard(
                  value: L10n.of(context).result_weight(imc.weight),
                  label: L10n.of(context).weight,
                )),
              ],
            )
          ],
        ));
  }
}
