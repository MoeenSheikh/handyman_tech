import 'package:flutter/material.dart';
import 'package:handyman_tech/components/component_text_widgets.dart';
class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key key}) : super(key: key);

  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.call,size: 30,color: Colors.black,),
        title: Center(child: ComponentText.buildTextWidget(title: "Order List",fontSize: 22)),
        backgroundColor: Colors.grey[300],

        actions: [
          IconButton(onPressed: (){

          },
              icon: Icon(Icons.person_rounded,size: 30,color: Colors.black,))

        ],
      ),

    );
  }
}
