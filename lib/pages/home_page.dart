import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 80)),
            const Text('Bluetooth mouse'),
            const Padding(padding: EdgeInsets.only()),
            const SizedBox(
              width: 100,
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only()),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Check'),
            ),
          ],
        ),
      ),
    );
  }
}
