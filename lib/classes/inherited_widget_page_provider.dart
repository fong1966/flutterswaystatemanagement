import 'package:flutter/material.dart';

class InheritedWidgetPageProvider extends InheritedWidget {
  final int numberOfIdeas;
  final void Function() increaseNumberOfIdeas;

  const InheritedWidgetPageProvider({
    super.key,
    required this.numberOfIdeas,
    required this.increaseNumberOfIdeas,
    required Widget child,
  }) : super(child: child);

  static InheritedWidgetPageProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedWidgetPageProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidgetPageProvider oldWidget) {
    return numberOfIdeas != oldWidget.numberOfIdeas;
  }
}
