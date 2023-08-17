import 'package:flutter/material.dart';

class IdeaCount {
  final ValueNotifier<int> numberOfIdeas;
  final ValueNotifier<int> numberOfPossibilities;

  IdeaCount({
    required this.numberOfIdeas,
    required this.numberOfPossibilities,
  });
}

class IdeasValueNotifier extends ValueNotifier<IdeaCount> {
  IdeasValueNotifier({required IdeaCount value}) : super(value);

  void addNumberOfIdeas(int numberOfIdeas) {
    value.numberOfIdeas.value += numberOfIdeas;
    notifyListeners();
  }

  void addNumberOfPossibilities(int numberOfPossibilities) {
    value.numberOfPossibilities.value += numberOfPossibilities;
    notifyListeners();
  }
}
