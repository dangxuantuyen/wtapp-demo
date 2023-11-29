import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopTitle extends StatelessWidget {
  TopTitle({super.key, required this.textTitle});
  final String textTitle;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        textTitle,
        style: GoogleFonts.lato(
            textStyle: const TextStyle(color: Colors.blue, fontSize: 40)),
      ),
    );
  }
}
