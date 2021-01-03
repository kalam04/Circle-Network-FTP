import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class OtherPage1 extends StatefulWidget {
  @override
  _OtherPage1State createState() => _OtherPage1State();
}

class _OtherPage1State extends State<OtherPage1> {
  @override
  Widget build(BuildContext context) {
    final providerdat1=Provider.of<MyModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("The Next Page"),),
      body: Center(
        child: Text(providerdat1.someValue.toString()),
      ),
    );
  }
}


class OtherPage2 extends StatefulWidget {
  @override
  _OtherPage2State createState() => _OtherPage2State();
}

class _OtherPage2State extends State<OtherPage2> {

  @override
  Widget build(BuildContext context) {
    final providerData=Provider.of<MyModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("The Next Page"),),
      body: Center(
        child: Text(providerData.someValue.toString()),
      ),
    );
  }
}

