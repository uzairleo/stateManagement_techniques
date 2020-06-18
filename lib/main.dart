import 'package:flutter/material.dart';
import 'package:statemanagement_techniques/Screens/BLoc_example.dart';
import 'package:statemanagement_techniques/Screens/InheritedWidget_ex.dart';
import 'package:statemanagement_techniques/Screens/Provider_ex.dart';
import 'package:statemanagement_techniques/Screens/ScopeModel_ex.dart';
import 'package:statemanagement_techniques/Screens/SimpleStateManag_ex.dart';

void main() {
  runApp(StatemangExample());
}

class StatemangExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'state_management_examples',
      home: DashBoard(),
    );
  }
}

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "StateManagement Techniques \n In Flutter",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            _buttonWidget(
              context: context,
              title: "Simple Method by passing data",
              screen: SimpleStateMangEx(),
            ),
            _buttonWidget(
                context: context,
                title: "Using InheritedWidget",
                screen: InheritedWidgetEx()),
            _buttonWidget(
              context: context,
              title: "Using ScopeModel",
              screen: ScopedModelEx(),
            ),
            _buttonWidget(
              context: context,
              title: "Using Provider",
              screen: ProviderEx(),
            ),
            _buttonWidget(
                context: context, title: "Using Bloc", screen: BLocEx()),

            // info(),
          ],
        ),
      ),
    );
  }

  _buttonWidget({String title, Widget screen, BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        color: Colors.grey[300],
        onPressed: () {
          _navigateTo(
            context: context,
            navigatedScreen: screen,
          );
        },
        child: Text(title),
      ),
    );
  }

  _navigateTo({BuildContext context, Widget navigatedScreen}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => (navigatedScreen),
    ));
  }
}
