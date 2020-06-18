



import 'package:flutter/cupertino.dart';

List<String> codeList=[
'''
import 'package:flutter/material.dart';
import 'package:statemanagement_techniques/CodeScreen/codeScreen.dart';

class SimpleStateMangEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleState_Manag_Example"),
        actions: <Widget>[IconButton(icon: Icon(Icons.code), onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>(CodeScreen())
          ));
        })],
      ),
      body: RootWidget(),
    );
  }
}

class RootWidget extends StatefulWidget {
  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int _counter = 0;
  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "\nThis is a simple and ordinary approach for"
            " achieving state Management in flutter.\n\n This"
            " Method done by passing the state data from     "
            "parents widget to child widgets and so on.\n\nBut "
            "when we are coding a large application then its "
            "will a mess or a headache for a person to presist"
            " the actual state so i recommend for basics its "
            "good to used this or go with this methods.\n",
            textAlign: TextAlign.justify,
          ),
        ),
        CardRootWidget(_counter, incrementCounter, decrementCounter),
      ],
    );
  }
}

class CardRootWidget extends StatefulWidget {
  final int value;
  final incrementCount;
  final decrementCount;
  CardRootWidget(this.value, this.incrementCount, this.decrementCount);

  @override
  _CardRootWidgetState createState() => _CardRootWidgetState();
}

class _CardRootWidgetState extends State<CardRootWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 4.0,
          child: Column(children: <Widget>[
            Text("(Root Widget)"),
            Text('widget.value'",
                style: Theme.of(context).textTheme.headline4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CardChildWidget(
                    widget.value, widget.incrementCount, widget.decrementCount),
                CardChildWidget(
                    widget.value, widget.incrementCount, widget.decrementCount),
              ],
            )
          ])),
    );
  }
}

class CardChildWidget extends StatelessWidget {
  final int counter;
  final Function incrementCount;
  final Function decrementCount;
  CardChildWidget(this.counter, this.incrementCount, this.decrementCount);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4.0).copyWith(bottom: 32.0, top: 38.0),
      elevation: 2.6,
      color: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("child widget"),
          Text('counter', style: Theme.of(context).textTheme.headline4),
          ButtonBar(children: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  incrementCount();
                }),
            IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  decrementCount();
                }),
          ])
        ],
      ),
    );
  }
}


''',
"uzairleo"

];