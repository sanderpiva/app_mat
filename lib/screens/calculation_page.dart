import 'pythagoras_calculation_screen.dart';
import 'square_perimeter_calculation_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/calculation_card.dart';
import '../components/appbar.dart';
import '../components/drawer.dart';
import 'pa_calculation_screen.dart';
import 'pg_calculation_screen.dart';
import 'proportion_calculation_screen.dart';
import 'percentage_calculation_screen.dart';
import 'package:flutter/services.dart';

class CalculationPage extends StatelessWidget {
  const CalculationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: const MyAppBar(title: 'Escolha um Cálculo'),
      drawer: const MyDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.only(
          top: 100.0,
          right: 8.0,
          left: 8.0,
          bottom: 8.0,
        ),
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        children: const [
          CalculationCard(
            title: '',
            asset: 'assets/img/i_pa.png',
            screen: PACalculationScreen(),
          ),
          CalculationCard(
            title: '',
            asset: 'assets/img/i_pg.png',
            screen: PGCalculationScreen(),
          ),
          CalculationCard(
            title: '',
            asset: 'assets/img/i_porcentagem.png',
            screen: PercentageCalculationScreen(),
          ),
          CalculationCard(
            title: '',
            asset: 'assets/img/i_proporcao.png',
            screen: ProportionCalculationScreen(),
          ),
          CalculationCard(
            title: '',
            asset: 'assets/img/i_pitagoras.png',
            screen: PythagorasCalculationScreen(),
          ),
          CalculationCard(
            title: '',
            asset: 'assets/img/i_perimetro_quadrado.png',
            screen: SquarePerimeterCalculationScreen(),
          ),
        ],
      ),
    );
  }
}