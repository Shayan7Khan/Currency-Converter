import 'package:currency_converter/currency-converter-cupertino-page.dart';
import 'package:currency_converter/currency-converter-material-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//stateless widget is immutable meaning it cannot be changed.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurenncyConverterMaterialPage(),
    );
  }
}

//this is for cupertino, inorder to call it we just have to call this in our main function.
class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CurrencyConverterCupertinoPage(),
    );
  }
}
