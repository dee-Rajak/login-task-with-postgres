import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final int fontsize;
  final double len;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.fontsize = 35,
    required this.len,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * len,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.all(10)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Set the border radius
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.amber.shade800),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: GoogleFonts.lexendDeca(
              fontSize: size.aspectRatio * fontsize,
            ),
          )),
    );
    // return Container(
    //   width: size.width * 0.8,
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: TextField(
    //     controller: controller,
    //     decoration: InputDecoration(
    //       hintText: hintText,
    //       border: InputBorder.none,
    //       contentPadding: const EdgeInsets.all(10),
    //     ),
    //   ),
    // );
  }
}
