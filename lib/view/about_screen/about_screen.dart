import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/view/about_screen/components/about_details_widget.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "About",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://www.dpzone.in/wp-content/uploads/1/Animation-DP-Display-Picture-01.jpg",
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const ExpansionTileWidget(
              heading: 'Developer Info',
              iconName: Icons.person,
              children: <Widget>[
                AboutWidget(
                  heading: 'Name',
                  subHeading: 'Venakata Naga Bhaskar Pothina',
                ),
                AboutWidget(
                  heading: 'Email',
                  subHeading: 'nagabhaskar759@gmail.com',
                ),
              ],
            ),
            const Divider(),
            const ExpansionTileWidget(
              heading: 'AppInfo',
              iconName: Icons.info,
              children: <Widget>[
                AboutWidget(
                  heading: 'App Name',
                  subHeading: 'Weatherly',
                ),
                AboutWidget(
                  heading: 'Version',
                  subHeading: 'v1.0.0',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
    required this.children,
    required this.heading,
    required this.iconName,
  });
  final List<Widget> children;
  final IconData iconName;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        // collapsedTextColor: Colors.white,
        // collapsedBackgroundColor: Colors.red,
        // collapsedIconColor: Colors.amber
        // ,
        childrenPadding: EdgeInsets.zero,
        leading: Icon(iconName),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        title: Text(heading),
        children: children,
      ),
    );
  }
}
