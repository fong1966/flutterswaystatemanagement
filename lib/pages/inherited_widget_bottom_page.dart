import 'package:flutter/material.dart';
import 'package:flutterswaystatemanagement/classes/inherited_widget_page_provider.dart';

class InheritedWidgetBottomPage extends StatefulWidget {
  const InheritedWidgetBottomPage({super.key});

  @override
  State<InheritedWidgetBottomPage> createState() =>
      _InheritedWidgetBottomPageState();
}

class _InheritedWidgetBottomPageState extends State<InheritedWidgetBottomPage> {
  late InheritedWidgetPageProvider _inheritedWidgetPageProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('BOTTOM WIDGET: didChangeDependencies');
    _inheritedWidgetPageProvider = InheritedWidgetPageProvider.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('BOTTOM CHILD WIDGET'),
            InkWell(
              onTap: _inheritedWidgetPageProvider.increaseNumberOfIdeas,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Icon(
                    Icons.lightbulb_outline,
                    size: 184.0,
                    color: Colors.lightGreen.shade500,
                  ),
                  Positioned(
                    bottom: 84.0,
                    child: Text(
                      '${_inheritedWidgetPageProvider.numberOfIdeas}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade800),
                    ),
                  ),
                ],
              ),
            ),
            const Text('Ideas'),
          ],
        ),
      ),
    );
  }
}
