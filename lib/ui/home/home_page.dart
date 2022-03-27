import 'package:flutter/material.dart';
import 'package:handyman_tech/components/component_sized_box.dart';
import 'package:handyman_tech/components/component_text_widgets.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool offline=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.call,size: 30,color: Colors.black,),
        title: Center(child: ComponentText.buildTextWidget(title: "Home",fontSize: 22)),
        backgroundColor: Colors.grey[300],

        actions: [
          IconButton(onPressed: (){

          },
              icon: Icon(Icons.person_rounded,size: 30,color: Colors.black,))

        ],
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
                  child: InkWell(
                    onTap: (){
                      if(offline==false){
                        setState(() {
                          offline=true;
                        });
                      }

                    },
                    child: Container(
                      height: 50,
                      width: 100,
                       decoration: BoxDecoration(
                          color: (offline)?Colors.red:Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                          ),
                      child: Center(
                        child: ComponentText.buildTextWidget(title: "Offline"),
                      ),
                    ),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
                  child:InkWell(
                    onTap:(){
                      if(offline==true)
                        {
                          setState(() {
                            offline=false;
                          });
                        }
                    },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: (offline)?Colors.grey[300]:Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: ComponentText.buildTextWidget(title: "Online"),
                    ),
                  ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
                  child: InkWell(
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: (offline)?Colors.grey[300]:Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: ComponentText.buildTextWidget(title: "Refresh"),
                      ),
                    ),
                  ),

                ),

              ],
            ),
            ComponentSizedBox.topMargin(size: 10),
            ComponentText.buildTextWidget(title: "Notifications")
          ],
        ),
      ),
    );
  }
}
