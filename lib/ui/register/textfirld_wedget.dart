import 'package:flutter/material.dart';

class Textform extends StatelessWidget {
   String title ;
   String hint ;
   TextInputType keyboardtype ;
   TextEditingController controller;
   String? Function(String?) validator ;
   Textform({super.key, required this.title,required this.hint,
     this.keyboardtype= TextInputType.text ,required this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
        Container(
          child: TextFormField(
            validator: validator,
            keyboardType:keyboardtype ,
            decoration: InputDecoration(
                errorBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
                hintText: hint ,
            ),
            controller: controller,

          ),
        ),
        SizedBox(height: 14,)
      ],
    );
  }
}
