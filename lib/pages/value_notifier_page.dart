import 'package:flutter/material.dart';
import 'package:flutterswaystatemanagement/classes/idea_type.dart';
import 'package:flutterswaystatemanagement/classes/ideas_value_notifier.dart';
import 'package:flutterswaystatemanagement/classes/ideas_value_notifier_provider.dart';
import 'package:flutterswaystatemanagement/classes/log_provider.dart';
import 'log_history.dart';

class ValueNotifierPage extends StatefulWidget {
  const ValueNotifierPage({super.key});

  @override
  State<ValueNotifierPage> createState() => _ValueNotifierPageState();
}

class _ValueNotifierPageState extends State<ValueNotifierPage> {
  late IdeasValueNotifier ideasValueNotifier;
  late Log log;

  @override
  void initState() {
    super.initState();
    ideasValueNotifier = IdeasValueNotifier(
      value: IdeaCount(
        numberOfIdeas: ValueNotifier<int>(0),
        numberOfPossibilities: ValueNotifier<int>(0),
      ),
    );
    log = Log(logHistory: '');
  }

  @override
  void dispose() {
    ideasValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return LogProvider(
                  log: log,
                  color: Colors.orange,
                  child: const LogHistory(),
                );
              }));
            },
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 100.0,
            child: Row(
              children: <Widget>[
                ValueListenableBuilder(
                  valueListenable: ideasValueNotifier.value.numberOfIdeas,
                  builder: (BuildContext context, int value, Widget? child) {
                    debugPrint('$value!');
                    return InkWell(
                      child: Column(
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.lightbulb_outline,
                                size: 184.0,
                                color: Colors.orange.shade500,
                              ),
                              Positioned(
                                bottom: 84.0,
                                child: LogProvider(
                                  log: log,
                                  child: IdeasValueNotifierProvider(
                                    ideasValueNotifier: ideasValueNotifier,
                                    child: const NumberOfIdeas(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text('Ideas'),
                        ],
                      ),
                      onTap: () {
                        ideasValueNotifier.addNumberOfIdeas(1);
                      },
                    );
                  },
                ),
                ValueListenableBuilder(
                  valueListenable:
                      ideasValueNotifier.value.numberOfPossibilities,
                  builder: (BuildContext context, int value, Widget? child) {
                    return InkWell(
                      child: Column(
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.notifications_none,
                                size: 184.0,
                                color: Colors.orange.shade500,
                              ),
                              Positioned(
                                bottom: 62.0,
                                child: LogProvider(
                                  log: log,
                                  child: IdeasValueNotifierProvider(
                                    ideasValueNotifier: ideasValueNotifier,
                                    child: const NumberOfPossibilities(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text('Possibilities'),
                        ],
                      ),
                      onTap: () {
                        ideasValueNotifier.addNumberOfPossibilities(1);
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NumberOfIdeas extends StatelessWidget {
  final IdeaType? ideaType;

  const NumberOfIdeas({super.key, this.ideaType});

  @override
  Widget build(BuildContext context) {
    final Log log = LogProvider.of(context)!.log;
    final IdeasValueNotifier ideasValueNotifier =
        IdeasValueNotifierProvider.of(context)!.ideasValueNotifier;
    log.logHistory +=
        '\n${IdeaType.ideas}: ${ideasValueNotifier.value.numberOfIdeas.value}';
    debugPrint(
        'BUILD: ${IdeaType.ideas}: ${ideasValueNotifier.value.numberOfIdeas.value}');

    return Text(
      '${ideasValueNotifier.value.numberOfIdeas.value}',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey.shade800),
    );
  }
}

class NumberOfPossibilities extends StatelessWidget {
  final IdeaType? ideaType;

  const NumberOfPossibilities({super.key, this.ideaType});

  @override
  Widget build(BuildContext context) {
    final Log log = LogProvider.of(context)!.log;
    final IdeasValueNotifier ideasValueNotifier =
        IdeasValueNotifierProvider.of(context)!.ideasValueNotifier;
    log.logHistory +=
        '\n${IdeaType.possibilities}: ${ideasValueNotifier.value.numberOfPossibilities.value}';
    debugPrint(
        'BUILD: ${IdeaType.possibilities}: ${ideasValueNotifier.value.numberOfPossibilities.value}');

    return Text(
      '${ideasValueNotifier.value.numberOfPossibilities.value}',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey.shade800),
    );
  }
}
