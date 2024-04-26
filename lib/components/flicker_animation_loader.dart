import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/app_colors.dart';

class FlickeringLoadingWidget extends StatefulWidget {
  final Color? flickerColor;
  FlickeringLoadingWidget(this.flickerColor);
  @override
  _FlickeringLoadingWidgetState createState() => _FlickeringLoadingWidgetState();
}

class _FlickeringLoadingWidgetState extends State<FlickeringLoadingWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Adjust the duration to control the flicker speed
    );

    _opacityAnimation = Tween<double>(
      begin: 0.3, // Starting opacity
      end: 1.0, // Ending opacity
    ).animate(_controller);

    // Repeatedly toggle the opacity
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Card(elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Container(
              width: double.maxFinite, // Adjust size as needed
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: widget.flickerColor != null ? widget.flickerColor : AppColors.primaryColor500, // Adjust color as needed
                borderRadius: BorderRadius.circular(10)
              ),
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