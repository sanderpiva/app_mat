import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProportionCalculationScreen extends StatefulWidget {
  const ProportionCalculationScreen({Key? key}) : super(key: key);

  @override
  _ProportionCalculationScreenState createState() => _ProportionCalculationScreenState();
}

class _ProportionCalculationScreenState extends State<ProportionCalculationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _aController = TextEditingController();
  final _bController = TextEditingController();
  final _cController = TextEditingController();
  String result = '';

  void _validateAndCalculate() {
    if (_formKey.currentState!.validate()) {
      double a = double.parse(_aController.text);
      double b = double.parse(_bController.text);
      double c = double.parse(_cController.text);
      
      if (b == 0 || a == 0) {
        setState(() {
          result = 'Não é possível dividir por zero. Verifique os valores.';
        });
        return;
      }

      double d = (b * c) / a;
      double numeratorCalculationResult = c * b;
      String proportionResult = ' = ${d.toStringAsFixed(2)}';

      setState(() {
        result = 'A = $a    -     B = $b\n'
                 'C = $c    -     D = ? \n'
                 'D * A = C * B \n'
                 'D = (C * B)/A\n'
                 'D = (${c} * ${b})/${a}\n'
                 'D = ${numeratorCalculationResult}/${a}'
                 '${proportionResult}\n'
                 '(B/A) = (D/C)';

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de Proporções')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text (
                'Quando se divide o número de cima (numerador) pelo número de baixo (denominador) de duas frações diferentes, e os resultados dessas divisões são iguais, essas frações são proporcionais. Pratique:',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: _aController,
                decoration: const InputDecoration(labelText: 'Valor de a'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor, insira um valor para a';
                  return null;
                },
              ),
              TextFormField(
                controller: _bController,
                decoration: const InputDecoration(labelText: 'Valor de b'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor, insira um valor para b';
                  return null;
                },
              ),
              TextFormField(
                controller: _cController,
                decoration: const InputDecoration(labelText: 'Valor de c'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor, insira um valor para c';
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _validateAndCalculate,
                child: const Text('Calcular Proporção'),
              ),
              const SizedBox(height: 10),
              Text(result, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}