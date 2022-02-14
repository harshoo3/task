import 'package:flutter/material.dart';


class ListItem extends StatelessWidget {
  String title;
  String des;
  ListItem({Key? key, required this.title, required this.des}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.blueGrey
        ),
        height: 150,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        // color: Colors.blue,
        child: Column(
          children:[
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blueGrey
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 22,color: Colors.white)
                      ),
                    ),
                    Icon(Icons.verified,color: Colors.greenAccent,),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey
                  ),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Center(
                    child: Text(
                      des,
                      style: TextStyle(fontSize: 14,color: Colors.black)
                    ),
                  ),
                ),
              ),
            ),

          ]
        ),
      ),
    );

  }
}
