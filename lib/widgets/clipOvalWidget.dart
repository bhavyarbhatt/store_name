
import 'package:flutter/material.dart';
import 'package:store_name/screen/screenOne.dart';

class ClipOvalWidget extends StatelessWidget {

  final Function onTap;

  const ClipOvalWidget({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15,20,10,10),
      child: ClipOval(
        child: Material(
          color: Colors.blue, // button color
          child: InkWell(
            splashColor: Colors.red, // inkwell color
            child: SizedBox(width: 15, height: 15,
              //    child: Icon(Icons.menu)
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
