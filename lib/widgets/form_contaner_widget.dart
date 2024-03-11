import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {

  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField; 


  const FormContainerWidget({super.key,
   this.controller,
   this.fieldKey,
   this.isPasswordField});

  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}