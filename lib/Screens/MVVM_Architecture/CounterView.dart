import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:statemanagement_techniques/Code/CodeList.dart';
import 'package:statemanagement_techniques/CodeScreen/codeScreen.dart';
import 'package:statemanagement_techniques/Screens/MVVM_Architecture/CounterViewModel.dart';

/// In Model view Viewm model we have some major points so before starting that we
/// will first learn the major topics related with mvvm
/// 1=> View ( view is actually widget place or it may be ur screen ui )
/// 2=> View-Model ( view model is the place where ur logic or state data is present or we can also called this as a stat model)
/// 3=> Services (services is that place which is used globally by the rest of classes and it contain the network call , database helper classes or authenticahelper classes etc)
/// Lets start

// Before starting i wanna to mention that for simplicity we take all these three parts in this same file

//=>view or screen ui

class CounterView extends StatelessWidget {
  const CounterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MVVM_Example"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.code),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => (CodeScreen(codeList[4]))));
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _MyDemoApp(),
      ),
    );
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
        Text("FilledStacks proposes using an MVVM style architecture.\n"
            " The View is usually a widget layout for one screen of your"
            " app. It doesn’t contain any logic or state, though.\nThat is "
            "contained in the View Model, which doesn’t know any specific"
            " details about the View. \n\nMost apps need to store and access "
            "data and that is handled by Services, which are just Dart classes"
            " that abstract away the details so that the View Models don’t need "
            "to worry about how it’s done.\n\n"),
        ViewModelBuilder<CounterViewModel>.reactive(
          viewModelBuilder: () => CounterViewModel(),
          builder: (context, model, child) {
            return _AppRootWidget(
              model: model,
            );
          },
          onModelReady: (model) => model.counter,
        ),
      ],
    );
  }
}

class _AppRootWidget extends StatelessWidget {
  final model;
  _AppRootWidget({this.model});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Text('(root widget)'),
          Text(
            '${model.counter}',
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _CounterAndButton(model),
              _CounterAndButton(model),
            ],
          ),
        ],
      ),
    );
  }
}

class _CounterAndButton extends StatelessWidget {
  final model;
  _CounterAndButton(this.model);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4.0).copyWith(top: 32.0, bottom: 32.0),
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Text('(child widget)'),
          Text(
            '${model.counter}',
            style: Theme.of(context).textTheme.headline4,
          ),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => model.incrementCounter(),
              ),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => model.decrementCounter(),
              )
            ],
          )
        ],
      ),
    );
  }
}
