import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:flutter/services.dart';

class ListItem extends StatelessWidget {
  String title;
  String des;
  String url;
  ListItem({Key? key, required this.title, required this.des,required this.url}) : super(key: key);

  void _showToast(BuildContext context,String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 500),
        content: Text(msg),
      ),
    );
  }
  Future<void> shareViaWhatsapp() async{
    final FlutterShareMe flutterShareMe = FlutterShareMe();
    String? response= await flutterShareMe.shareToWhatsApp(msg: url);
    debugPrint(response);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black
        ),
        height: 250,
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        // color: Colors.blue,
        child: Column(
          children:[
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 22,color: Colors.white)
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Center(
                    child: Text(
                      des,
                      style: TextStyle(fontSize: 14,color: Colors.white)
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    height: 100,
                    child: ElevatedButton.icon(
                      icon: Icon(
                      Icons.ios_share,
                      color: Colors.black,
                      size: 30.0,
                    ),
                      onPressed: (){
                        shareViaWhatsapp();
                      },
                      label: Text("Whatsapp",style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent
                        )

                    ),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    height: 100,
                    child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        onPressed: (){
                          Clipboard.setData(ClipboardData(text: url));
                          _showToast(context, "Link Copied to ClipBoard");
                        },
                        label: Text("Copy url",style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.greenAccent
                        )

                    ),
                  ),
                )
                // ElevatedButton(onPressed: onPressed, child: child)
              ],
            )
          ]
        ),
      ),
    );

  }
}
