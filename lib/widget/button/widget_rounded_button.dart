import 'package:flutter/material.dart';

class WidgetRoundedButton extends StatelessWidget {
  const WidgetRoundedButton(
      {super.key, required this.title, required this.ontap});
  final String title;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.blue),
          ),
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
