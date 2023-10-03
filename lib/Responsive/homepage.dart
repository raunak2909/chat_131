import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffld;
  const HomePage({
    super.key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffld,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileScaffold;
        } else if (constraints.maxWidth < 1100) {
          return tabletScaffold;
        } else {
          return desktopScaffld;
        }
      },
    );
  }
}
