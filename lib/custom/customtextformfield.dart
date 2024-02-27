import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final Widget? suffix;
  final String? hint;


  final TextInputType keybboardtype;
  final String? Function(String?)? validator; // Simplified validator type

  const CustomTextField(
      {Key? key,
      this.hint,
      this.keybboardtype = TextInputType.text,
      this.labelText,
      this.prefixIcon,
      this.obscureText = false,
      required this.controller,
      this.suffix,
      this.validator})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool hasfocused = false;
  final FocusNode _thirdFocus = FocusNode();


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: widget.keybboardtype,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.obscureText,
        onEditingComplete: () {
          // Dismiss the keyboard when "Done" is pressed on the last field
          FocusScope.of(context).unfocus();
        },

        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.labelText,
          prefixIcon:
              widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
          suffixIcon: widget.suffix!=null?widget.suffix:null


             ,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: hasfocused ? Colors.red : Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ));
  }
}
