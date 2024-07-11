import 'package:flutter/material.dart';

class Textformpass extends StatefulWidget {
  Textformpass(
      {super.key,
      required this.title,
      required this.hint,
      required this.iconpath,
      required this.valiedstring,
      required this.controller});
  String title;
  String hint;
  String iconpath;
  String valiedstring;
  TextEditingController controller;

  @override
  State<Textformpass> createState() => _TextformpassState();
}

class _TextformpassState extends State<Textformpass> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        Container(
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty || value.trim().isEmpty) {
                return widget.valiedstring;
              } else if (value.length < 8) {
                return 'password shoud be at least 8 Characters';
              }
              bool emailValid = RegExp(
                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]{8,}$')
                  .hasMatch(value);
              if (!emailValid) {
                return "Strong Password Format Ex(Join41@)";
              }
            },
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: widget.hint,
              suffixIcon:InkWell(
                  onTap: () {
                    if (obscure == true) {
                      obscure = false;
                    } else {
                      obscure = true;
                    }
                    setState(() {});
                  },
                  child: obscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
              ),
            ),
            controller: widget.controller,
            obscureText: obscure,
          ),
        ),
        SizedBox(
          height: 14,
        )
      ],
    );
  }
}
