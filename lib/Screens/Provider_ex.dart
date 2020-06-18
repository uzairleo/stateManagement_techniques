import 'package:flutter/material.dart';
import 'package:statemanagement_techniques/Code/CodeList.dart';
import 'package:statemanagement_techniques/CodeScreen/codeScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class ProviderEx extends StatelessWidget {
  const ProviderEx({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      //  builder: (context)=>Counter(),
      create: (context) => Counter(),

      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider_Example"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.code),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => (CodeScreen(codeList[3]))));
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _MyDemoApp(),
        ),
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int counter = 0;

  // int get counterValue => _counter;

  void incrementCounter() {
    counter++;
    // Must add notifyListeners() when UI need to be changed.
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    notifyListeners();
  }
}

class _MyDemoApp extends StatefulWidget {
  @override
  __MyDemoAppState createState() => __MyDemoAppState();
}

class __MyDemoAppState extends State<_MyDemoApp> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text("Provider is the officially recommended way to manage app states, "
            "it's quite similar to ScopedModel in sharing/updating of app's "
            "state from children widgets down the widgets tree. In addition, "
            "you can provider multiple states at app root.\n\n"
            "In this example, the app's root widget is a MultiProvider, which "
            "provides two states: the number of seconds elapsed (StreamProvider) "
            "and the counter value(ChangeNotifierProvider).\n\n"),
        _AppRootWidget(),
      ],
    );
  }
}

class _AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //it will completely rebuild the Card or this widget suppose we just want to rebuild the only listener text then we use listener false and used consumer
    // final myState = Provider.of<Counter>(context,listen: false);
    // final myState = Provider.of<Counter>(context);
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Text('(root widget)'),
          // Text('${myState.counter}'),
          Consumer<Counter>(//consumers are the particular listener or descenders
            builder:(context,myState,child)=> Text('${myState.counter}')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _CounterAndButton(),
              _CounterAndButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class _CounterAndButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myState = Provider.of<Counter>(context);
    return Card(
      margin: EdgeInsets.all(4.0).copyWith(top: 32.0, bottom: 32.0),
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Text('(child widget)'),
          Text(
            '${myState.counter}',
            style: Theme.of(context).textTheme.headline4,
          ),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => myState.incrementCounter(),
              ),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => myState.decrementCounter(),
              )
            ],
          )
        ],
      ),
    );
  }
}
