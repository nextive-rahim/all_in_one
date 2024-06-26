import 'package:flutter/material.dart';

class ResponsiveLayoutDashboardInterview extends StatelessWidget {
  final Widget webLageScaffold;
  // final Widget webMediumScaffold;
  // final Widget webSmallScaffold;
  const ResponsiveLayoutDashboardInterview({
    super.key,
    required this.webLageScaffold,
    // required this.webMediumScaffold,
    // required this.webSmallScaffold
  });

  // @override
  // State<ResponsiveLayoutDashboardFirstTime> createState() =>
  //     _ResponsiveLayoutDashboardFirstTimeState();
// }

// class _ResponsiveLayoutDashboardFirstTimeState
//     extends State<ResponsiveLayoutDashboardFirstTime> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // if (constraints.maxWidth > 1000) {
      return webLageScaffold;
      // } else if (constraints.maxWidth < 1000 && constraints.minWidth > 700) {
      //   return webMediumScaffold;
      // } else {
      //   return webSmallScaffold;
      // }
    });
  }
}
