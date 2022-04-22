import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfo {
  final String name;
  final double price;

  ProductInfo(this.name, this.price);
}

final products = [
  ProductInfo('Wireless mouse', 0.3),
  ProductInfo('Keyboard', 5.8),
  ProductInfo('Camera', 8),
  ProductInfo('Speaker', 4),
  ProductInfo('Ipad', 1000)
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentProductIndex = 0;
  double? _inputPrice;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 80)),
            Text(products[_currentProductIndex].name),
            const Padding(padding: EdgeInsets.only()),
            SizedBox(
              width: 100,
              child: TextField(
                key: const Key('priceInput'),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                onChanged: (String value) {
                  _inputPrice = double.tryParse(value);
                },
              ),
            ),
            const SizedBox(height: 10),
            const Padding(padding: EdgeInsets.only()),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result = _inputPrice == products[_currentProductIndex].price
                      ? 'Pass'
                      : 'Fail';

                  // if (_currentProductIndex < 4) {
                  //   _currentProductIndex++;
                  // }
                });
              },
              child: const Text('Check'),
            ),
            Text(_result),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_currentProductIndex < 4) {
                    _currentProductIndex++;
                  }
                });
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
