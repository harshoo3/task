import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:flutter/services.dart';
import 'package:new_task/strings/strings.dart';
import 'package:share_plus/share_plus.dart';
class Buttons extends StatefulWidget {
  String text;
  Function(List<String>) callback;
  Color color;
  IconData iconData;
  List<String> userNameList;
  Buttons({Key? key,required this.text,required this.userNameList,required this.callback,required this.color,required this.iconData}) : super(key: key);

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
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
    String? response= await flutterShareMe.shareToWhatsApp(msg: Strings.url);
    debugPrint(response);
    if(response=='success'){
      widget.userNameList.add(Strings.userName);
      widget.callback(widget.userNameList);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:1,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton.icon(
            icon: Icon(
              widget.iconData,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: (){
              if(widget.text==Strings.whatsappShareButton) {
                shareViaWhatsapp();
              } else if(widget.text==Strings.copyLinkButton) {
                Clipboard.setData(const ClipboardData(text: Strings.url));
                _showToast(context, Strings.linkCopied);
                // Share.share(Strings.url);
              }
            },
            label: Text(widget.text,style: const TextStyle(color: Colors.black)),
            style: ElevatedButton.styleFrom(
                primary: widget.color
            )
        ),
      ),
    );
  }
}
