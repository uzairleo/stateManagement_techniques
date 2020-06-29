




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
'''
import 'package:flutter/material.dart';
import 'package:statemanagement_techniques/Code/CodeList.dart';
import 'package:statemanagement_techniques/CodeScreen/codeScreen.dart';


class InheritedWidgetEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget_Example"),
        actions: <Widget>[IconButton(icon: Icon(Icons.code), onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>(CodeScreen(codeList[1]))
          ));
        })],
      ),
      body: _RootWidget(),
    );
  }
}
class MyInheritedWidget extends InheritedWidget{
  final _RootWidgetState myState;
  MyInheritedWidget({Key key ,Widget child,@required this.myState})
  :super(key:key,child:child);
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return this.myState.getCounter !=oldWidget.myState.getCounter; 
  }
 static MyInheritedWidget of(BuildContext context){
   return context.dependOnInheritedWidgetOfExactType(aspect:MyInheritedWidget);
 }

}

class _RootWidget extends StatefulWidget {
  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<_RootWidget> {
 
 int counter=0;
  int get getCounter=> counter;
 
 _incrementCounter(){
   setState(() {
     counter++;
   });
 }
 _decrementCounter(){
   setState(() {
     counter--;
   });
 }
   @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
          myState: this,
          child:ListView(
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
              "good to used this or go with this methods.Which is "
              "nothing just passing a state data to child widgets.\n\n"
              "But for large app i recommend one must used provider or "
              "scope model to maintain the code Quality.",
              textAlign: TextAlign.justify,
            ),
          ),
          CardRootWidget(),
        ],
      ),
    );
  }

}

class CardRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rootWidget=MyInheritedWidget.of(context).myState;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 4.0,
          child: Column(children: <Widget>[
            Text("(Root Widget)"),
            Text("rootWidget.counter",
                style: Theme.of(context).textTheme.headline4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CardChildWidget(),
                CardChildWidget(),
              ],
            )
          ])),
    );
  }
}

class CardChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rootWidget=MyInheritedWidget.of(context).myState;
    return Card(
      margin: EdgeInsets.all(4.0).copyWith(bottom: 32.0, top: 38.0),
      elevation: 2.6,
      color: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("child widget"),
          Text("rootWidget.counter", style: Theme.of(context).textTheme.headline4),
          ButtonBar(children: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  rootWidget._incrementCounter();
                }),
            IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  rootWidget._decrementCounter();
                }),
          ])
        ],
      ),
    );
  }
}

''',
'''
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:statemanagement_techniques/Code/CodeList.dart';
import 'package:statemanagement_techniques/CodeScreen/codeScreen.dart';


class ScopedModelEx extends StatelessWidget {
  const ScopedModelEx({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scoped_Model"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.code),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => (CodeScreen(codeList[2]))));
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

// ###1. Define a state class, extending from scoped_model.Model.
class _MyState extends Model {
  int _counter = 0;

  int get counterValue => _counter;

  void incrementCounter() {
    _counter++;
    // Must add notifyListeners() when UI need to be changed.
    // This will notify ALL it's descendants in the widget tree.
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}

class _MyDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text(
            "ScopedModel allows efficient sharing/updating of app's state from "
            "children widgets down the widgets tree.\n\n"
            "In this example, the app's root widget is a ScopedModel, "
            "so it's state is shared to the two 'CounterAndButtons' children"
            " widgets below. \n\n"
            "Clicking on child widget's button would update the MyStateModel "
            "of root widget.\n"),
        // ###2. Put the ScopedModel at the root of the widget tree, so that all
        // children widget can access the state.
        ScopedModel<_MyState>(
          model: _MyState(),
          child: _AppRootWidget(),
        ),
      ],
    );
  }
}

class _AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<_MyState>(
     rebuildOnChange: true,
     builder:  (context, child, model)=>Card(
        elevation: 4.0,
        child: Column(
          children: <Widget>[
            Text('(root widget)'),
            Text('{model.counterValue}',
            style: Theme.of(context).textTheme.headline4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _CounterAndButton(),
                _CounterAndButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CounterAndButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ###3. Wrap children widgets ScopedModelDescendant widget to access the
    // associated state model.
    return ScopedModelDescendant<_MyState>(
      // Note: Set `rebuildOnChange` to false if the current widget doesn't
      // need updating. E.g. When "add-to-cart" button is pressed, the app's
      // state is updated, but "product-details" page doesn't need updating.
      rebuildOnChange: true,
      builder: (context, child, model) => Card(
        margin: EdgeInsets.all(4.0).copyWith(top: 32.0, bottom: 32.0),
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            Text('(child widget)'),
            Text(
              '{model.counterValue}',
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
''',
'''
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
          // Text('{myState.counter}'),
          Consumer<Counter>(//consumers are the particular listener or descenders
            builder:(context,myState,child)=> Text('{myState.counter}')),
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
            '{myState.counter}',
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

''',
'''
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
        Text("Provider is the officially recommended way to manage app states, "
            "it's quite similar to ScopedModel in sharing/updating of app's "
            "state from children widgets down the widgets tree. In addition, "
            "you can provider multiple states at app root.\n\n"
            "In this example, the app's root widget is a MultiProvider, which "
            "provides two states: the number of seconds elapsed (StreamProvider) "
            "and the counter value(ChangeNotifierProvider).\n\n"),
        ViewModelBuilder<CounterViewModel>.reactive(
          viewModelBuilder:()=>CounterViewModel(),
          builder: (context,model,child){
          return _AppRootWidget(
            model:model,
          );
          },
          
          onModelReady: (model)=> model.counter,),
      ],
    );
  }
}

class _AppRootWidget extends StatelessWidget {
  final  model ;
_AppRootWidget({this.model});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Text('(root widget)'),
          Text('{model.counter}'),
          Text('{myState.counter}',
            style:Theme.of(context).textTheme.headline4 ,),
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
  final model ;
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
            '{myState.counter}',
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

import 'package:flutter/material.dart';


class CounterViewModel extends ChangeNotifier {
  int counter = 0;

  // int get counterValue => _counter;

  void incrementCounter() {
    counter++;
    // Must add notifyListeners() when UI need to be changed.
    notifyListeners();
  }

  void decrementCounter() {
    counter--;
    //No need of setState() function add notifyListeners and it will do it everything for us
    notifyListeners();
  }
}


'''
];