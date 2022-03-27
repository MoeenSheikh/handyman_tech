import 'package:flutter/material.dart';
import 'package:handyman_tech/components/component_text_widgets.dart';
class RepairScreen extends StatefulWidget {
  const RepairScreen({Key key}) : super(key: key);

  @override
  _RepairScreenState createState() => _RepairScreenState();
}

class _RepairScreenState extends State<RepairScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.call,size: 30,color: Colors.black,),
        title: Center(child: ComponentText.buildTextWidget(title: "Repair",fontSize: 22)),
        backgroundColor: Colors.grey[300],

        actions: [
          IconButton(onPressed: (){

          },
              icon: Icon(Icons.person_rounded,size: 30,color: Colors.black,))

        ],
      ),
      body: Center(
        child: ComponentText.buildTextWidget(title: "No orders in repairing",fontSize: 22),
      ),
    );
  }
}
