import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatelessWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TEXT/OUPUT
            const Text(
              '0',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),

            //INPUT PLACEHOLDER
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
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
            ),

            //BUTTON
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  debugPrint('Button Clicked');
                },
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
//commit from pc
