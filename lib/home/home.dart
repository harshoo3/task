import 'package:flutter/material.dart';
import 'package:new_task/home/models/buttons.dart';
import 'package:new_task/home/models/listItems.dart';

import 'package:new_task/strings/strings.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var strings={}
  List<String> userNameList = <String>[];
  final String description = Strings.description;

   callback(newUserNameList) {
     setState(() {
       userNameList = newUserNameList;
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Stack(
        children:[
          const Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 80,
                child: Center(
                  child:
                  Text(Strings.referApp,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  )
                )
            )
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,60 ,0, 170),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: userNameList.isEmpty?const SizedBox(
                  height: 100,
                  child: Center(child: Text(Strings.noUser))
              ):ListView.builder(
                itemCount: userNameList.length,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  debugPrint(userNameList.length.toString());
                  return ListItem(title: userNameList[index],des: description);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Buttons(text: Strings.whatsappShareButton,userNameList: userNameList,callback: callback,color: Colors.greenAccent,iconData: Icons.share,),
                    Buttons(text: Strings.copyLinkButton,userNameList: userNameList,callback: callback,color: Colors.white,iconData: Icons.copy,),
                  ],
                ),
              )
          ),

          // Buttons(func: _showToast(context, urls[0]))
        ]
      )
    );
  }

}
