import 'package:flutter/material.dart';

// A reusable LoadingIndicator widget that can be customized
class LoadingIndicator extends StatelessWidget {
  final double? size; // Optional size customization
  final Color? color; // Optional color customization
  final double? strokeWidth; // Customizable stroke width

  // Constructor to pass the customization options (size, color, strokeWidth)
  const LoadingIndicator({Key? key, this.size, this.color, this.strokeWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 6.0, // Default to a thicker stroke width if not provided
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? Theme.of(context).primaryColor, // Default to primary color
        ),
        backgroundColor: Colors.transparent, // Optional background color
        value: null,
        semanticsLabel: 'Loading...', // Optional: accessibility feature
      ),
    );
  }
}
