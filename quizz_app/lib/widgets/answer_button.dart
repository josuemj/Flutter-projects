import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({
    required this.answerText,
    required this.onTap,
    super.key,
  });

  final String answerText;
  final void Function() onTap;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      // We use a GestureDetector to handle the press state
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              // 3D Shadow Layer (Static at the bottom)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 6, // Offset to create the depth
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black, // Hard shadow color
                    borderRadius: BorderRadius.zero, // Pixel art sharp corners
                  ),
                ),
              ),
              // Main Button Face Layer (Moves up and down)
              AnimatedContainer(
                duration: const Duration(milliseconds: 50),
                width: double.infinity,
                // When not pressed, we hold it up with margin-bottom.
                // When pressed, we push it down with margin-top.
                margin: EdgeInsets.only(
                  bottom: _isPressed ? 0 : 6,
                  top: _isPressed ? 6 : 0,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.purpleAccent, // Main color
                  border: Border.all(
                      color: Colors.black, width: 3), // Thick pixel border
                  borderRadius: BorderRadius.zero,
                ),
                child: Text(
                  widget.answerText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.vt323(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
