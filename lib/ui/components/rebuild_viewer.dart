// Makes a scale transition for every rebuild (Tracking rebuilds) :
import 'package:flutter/material.dart';

class RebuildViewer extends StatelessWidget {
  final Widget child;
  const RebuildViewer({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: Container(
        // A unique key to force AnimatedSwitcher to do the transition everytime
        key: UniqueKey(),
        child: child,
      ),
    );
  }
}
