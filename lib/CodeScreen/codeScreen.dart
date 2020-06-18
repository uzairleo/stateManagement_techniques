import 'package:flutter/material.dart';


class CodeScreen extends StatelessWidget {

final String code;
CodeScreen(this.code);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Code Demo"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.cancel), onPressed: (){
            Navigator.of(context).pop();
          })
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.only(left:12.0,top:12.9),
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Scrollbar(
            
                    child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
              child:SingleChildScrollView(
                child: Text(
                  code
                )
              )
            ),
          ),
        ),
      )
    );
  }
}