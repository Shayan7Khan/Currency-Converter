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


    return  Scaffold(
      backgroundColor:const  Color.fromARGB(255, 48, 94, 117),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TEXT/OUPUT
             const Text('0', style:
             TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)
              ),
              ),

              //INPUT PLACEHOLDER
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                style: const TextStyle(
                  color: Colors.black
                ),
                decoration: InputDecoration(
                  hintText:'Please Enter The Amount In USD', hintStyle: const TextStyle(
                    color: Colors.black
                    ),
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
            TextButton(onPressed: (){
              debugPrint('Button Clicked');
            },
            style: const ButtonStyle(
              backgroundColor:WidgetStatePropertyAll(Colors.black),
              foregroundColor: WidgetStatePropertyAll(Colors.white)
            ),
             child: const Text('Convert'),
             
             )
          ],
        ),
      ),
    );
  }
}
