import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Combustível',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculadoraCombustivel(),
    );
  }
}

class CalculadoraCombustivel extends StatefulWidget {
  @override
  _CalculadoraCombustivelState createState() => _CalculadoraCombustivelState();
}

class _CalculadoraCombustivelState extends State<CalculadoraCombustivel> {
  double valorAlcool = 0.0;
  double valorGasolina = 0.0;
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Combustível'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Gasolina vs Álcool',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Image.network(
              'https://media.istockphoto.com/vectors/stream-of-gold-coins-pours-from-the-fuel-handle-pump-nozzle-with-hose-vector-id1251678227?k=20&m=1251678227&s=612x612&w=0&h=WueKOjZwKgOk0wRBcj9zhL7Bli9N4Vy3vs8NcDJHwBA=',
              height: 150.0,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Valor do Álcool (R\$)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  valorAlcool = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Valor da Gasolina (R\$)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  valorGasolina = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double resultadoCalculo = (valorAlcool / valorGasolina) * 100;
                  resultado = resultadoCalculo >= 70 ? 'Abastecer com Álcool' : 'Abastecer com Gasolina';
                });
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 16.0),
            Text(
              resultado,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

