//importing material.dart to import widgets related to Material desing / for Android
import 'package:flutter/material.dart';

class CurenncyConverterMaterialPage extends StatefulWidget {
  const CurenncyConverterMaterialPage({super.key});

  @override
  State<CurenncyConverterMaterialPage> createState() =>
      _CurenncyConverterMaterialPageState();
}

class _CurenncyConverterMaterialPageState
    extends State<CurenncyConverterMaterialPage> {
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

//dispose actually disposes (in this case the textcontroller) after its used to avoid memory leaks
  @override
  void dispose() {
    textEditingController.dispose();
    //super.dispose disposes everything that is present in the state class.
    super.dispose();
  }

  //if we want to get a value before the build function is called, because we want to display it. So for that reason we have a method given by state class which is "initState()"
  // @override
  // void initState() {
  //   //super.initState calls the initstate of the parent class
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    print('build rebuilt');

    final border = OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 2.0,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        borderRadius: BorderRadius.circular(5));

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 94, 117),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 48, 94, 117),
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
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
              TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Please Enter The Amount In USD',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  //filled give us the placeholder
                  filled: true,
                  //fillcolor gives the color to the placeholder
                  fillColor: Colors.white,
                  //focusedborder is for the border which we can style give colors etc
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),

              //BUTTON
              //using sizedbox to give space between the placeholder and button
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: convert,

                //in style we are using button style and then using WidgetStateProperty to use certain properties like color shape etc, instead we can use Textbutton.styleFrom which gives us direct access to these properties, for the reason I am commenting what i did so that i know the alternative and i will use the easiest one.
                // style: ButtonStyle(
                //   backgroundColor: const WidgetStatePropertyAll(Colors.black),
                //   foregroundColor: const WidgetStatePropertyAll(Colors.white),
                //   minimumSize: const WidgetStatePropertyAll(
                //     Size(double.infinity, 50),
                //   ),
                //   shape: WidgetStatePropertyAll(
                //     RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                // ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  //no matter what the device or screensize is, its gonna be fixed so we will use minimum size
                  //therefore we used double.infinity which means taking maximum amount of space as possible
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                child: const Text('Convert'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
