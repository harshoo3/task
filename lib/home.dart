import 'package:flutter/material.dart';
import 'package:new_task/listItems.dart';

import 'package:new_task/strings.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var strings={}
  final List<String> repo_names = <String>['VisualDSA', 'VoteHub', 'MultiModalDL'];
  final List<String> description = <String>[Strings.visualdsaDes, Strings.votehubDes, Strings.multimodalDes];
  final List<String> urls = <String>[Strings.visualdsaurl, Strings.votehuburl, Strings.multimodalurl];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              itemCount: repo_names.length,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListItem(title: repo_names[index],des: description[index],url:urls[index]);
              },
            ),
          ],
        ),
      )
    );
  }
}
