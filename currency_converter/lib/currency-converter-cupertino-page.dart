//importing cupertino.dart to import widgets related to cupertino desing / For IPHONE
import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  //creating a variable to store the value
  double result = 0;

  //using textediting controlling for input
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    //we used text to get the text that we require.
    //we used double.parse to convert the text into double value so that we could then apply it with the conversion we want. We used double instead of int because the value we will be getting would be in double.

    //setstate is a function provided by the state class which tells flutter to build this screen again, not the entire class but the BuildContext again.
    setState(() {
      result = double.parse(textEditingController.text) * 278;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(255, 48, 94, 117),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(255, 48, 94, 117),
        middle: Text(
          'Currency Converter',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TEXT/OUPUT
              Text(
                //using toStringAsFixed(2) to limit the output to just 2 decimal values.
                //using ternary operator because in the UI its 0.00, so we said that if the result is zero just display a single digit 0, otherwise in the answer go upto 2 decimal places.
                'PKR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',

                style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),

              //INPUT PLACEHOLDER
              CupertinoTextField(
                controller: textEditingController,
                placeholder: 'Please Enter The Amount In USD',
                prefix: const Icon(CupertinoIcons.money_dollar_circle),
                style: const TextStyle(color: CupertinoColors.black),
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(5)),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),

              //BUTTON
              //using sizedbox to give space between the placeholder and button
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                onPressed: convert,
                color: CupertinoColors.black,
                child: const Text('Convert'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
