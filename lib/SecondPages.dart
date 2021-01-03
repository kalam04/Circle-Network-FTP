import 'package:circle_network_ftp/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'OtherPage1.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final providerdat=Provider.of<MyModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Second Page"),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: InkWell(child: Text("other Pages1"),onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OtherPage1()));
                  },),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: InkWell(child: Text("other Pages2"),onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OtherPage2()));
                  },),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(providerdat.someValue.toString()),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
