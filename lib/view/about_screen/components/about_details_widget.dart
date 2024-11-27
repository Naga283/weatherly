import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({
    super.key,
    required this.heading,
    required this.subHeading,
  });
  final String heading;
  final String subHeading;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ListTile(
        title: Text(
          heading,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey.shade500,
              ),
        ),
        contentPadding: EdgeInsets.zero,
        subtitle: Text(
          subHeading,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
