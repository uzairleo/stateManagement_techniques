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
    return this.myState.getCounter != oldWidget.myState.getCounter; 
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
              "\nInheritedWidget is a little complex paradigm in flutter."
              "Regarding this A Quote is very famous that is \n\n\t\t\t\t\t\t\t"
              "'THOSE WHO UNDERSTAND INHERITEDWIDGET NEEDS NO EXPLANATION AND "
              "THOS WHO DIDNT NO EXPLANATION WOR FOR THEM '\n \n\t\t\t\t\t\t\tInherited widget is"
              "a pitty smart approach for statemanagement in flutter. All u have "
              "to do here is to just define ur own class that will extends "
              "INHERITEDWIDGET builtin class provide by flutter api, which "
              "will help u to call the parent instance using a myInheritdWidget "
              "object. Its best for maintaining Code quality but as flutter is maturing day by day "
              "so now we have also some more modern techniques to manage state",
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
            Text("${rootWidget.counter}",
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
          Text("${rootWidget.counter}", style: Theme.of(context).textTheme.headline4),
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
