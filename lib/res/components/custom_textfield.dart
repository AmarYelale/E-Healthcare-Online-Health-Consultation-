import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? textcontroller;
  const CustomTextField({super.key, required this.hint, this.textcontroller}) ;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();

}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
           border:const OutlineInputBorder(),
           hintText: widget.hint,
           ),
  ); 
      
    

  }
}