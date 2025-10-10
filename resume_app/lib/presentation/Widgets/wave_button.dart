import 'package:flutter/material.dart';

class WaveButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  const WaveButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  _SimplePulseButtonState createState() => _SimplePulseButtonState();
}

class _SimplePulseButtonState extends State<WaveButton> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(_animation.value * 0.5),
                  blurRadius: 15,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Center(
              child: widget.child,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}