import 'package:flutter/material.dart';

class ForecastCardHeading extends StatelessWidget {
  const ForecastCardHeading({
    super.key,
    required this.iconName,
    required this.heading,
  });
  final IconData iconName;
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            iconName,
            size: 18,
            color: Colors.white54,
          ),
          Text(
            heading,
            style: const TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
