import 'package:flutter/material.dart';
import 'package:untitledcalculator/data/components.dart';

class buttons extends StatelessWidget {
  final String title;
  final Color colors;
  final VoidCallback onpress;
  const buttons(
      {super.key, this.colors = const Color(0xff822372),
        required this.onpress,required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: 60,
            width: 70,
            decoration: BoxDecoration(
                color: colors, borderRadius: BorderRadius.circular(20),border: Border.all(
              color: Colors.greenAccent,width: 3
            )),
            child: Center(
                child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 29),
            )),
          ),
        ),
      ),
    );
  }
}
