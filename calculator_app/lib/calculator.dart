import 'package:flutter/material.dart';
import 'model/buttons.dart';
import 'package:dart_eval/dart_eval.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> with SingleTickerProviderStateMixin {
  var expression = '';
  var result = '';
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void press(String value) {
    setState(() {
      if (value == 'C') {
        expression = '';
        result = '';
        _animationController.reset();
        return;
      }
      if (value == 'DEL') {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
        return;
      }
      if (value == '=') {
        try {
          var evalResult = eval(expression.replaceAll('×', '*').replaceAll('÷', '/'));
          result = evalResult.toString();
          _animationController.forward(from: 0.0);
        } catch (e) {
          result = 'Error';
        }
        return;
      }
      if (value == '+/-') {
        if (expression.isNotEmpty && expression != '0') {
          if (expression.startsWith('-')) {
            expression = expression.substring(1);
          } else {
            expression = '-$expression';
          }
        }
        return;
      }
      expression += value;
    });
  }

  Color getButtonColor(String button) {
    if (button == '=') {
      return const Color(0xFF4CAF50); // Verde para igual
    } else if (button == 'C' || button == 'DEL') {
      return const Color(0xFFEF5350); // Rojo para borrar
    } else if (['+', '-', '×', '÷', '%', '+/-'].contains(button)) {
      return const Color(0xFFFF9800); // Naranja para operadores
    } else {
      return const Color(0xFF424242); // Gris oscuro para números
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: SafeArea(
        child: Column(
          children: [
            // Display area
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Expression text
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        expression.isEmpty ? '0' : expression,
                        style: TextStyle(
                          fontSize: screenHeight * 0.04,
                          color: Colors.white70,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    // Result text with animation
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        child: Text(
                          result,
                          style: TextStyle(
                            fontSize: screenHeight * 0.06,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Buttons area
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: screenWidth * 0.02,
                    mainAxisSpacing: screenHeight * 0.01,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: buttons.length,
                  itemBuilder: (context, index) {
                    return CalculatorButton(
                      text: buttons[index],
                      color: getButtonColor(buttons[index]),
                      onPressed: () => press(buttons[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorButton extends StatefulWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward().then((_) {
      _controller.reverse();
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _handleTap,
          borderRadius: BorderRadius.circular(20),
          splashColor: Colors.white24,
          highlightColor: Colors.white10,
          child: Container(
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
