import 'package:flutter/material.dart';
import 'package:handyman_tech/components/component_sized_box.dart';
import 'package:handyman_tech/components/component_text_widgets.dart';
import 'package:handyman_tech/ui/complete_profile/select_service_screen.dart';
class AreaScreen extends StatefulWidget {

  const AreaScreen({Key key}) : super(key: key);

  @override
  _AreaScreenState createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  List<String> areas=["Johar Town","Gulshan Ravi","Samnabad","Saggian","DHA phase 3","Chuburji","Mall Road",
  "Ali Town","Bahria Town","Air avenue","Rehman Garden"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: ComponentText.buildTextWidget(
          title: "Complete Profile",
          fontSize: 20,

        )),
        backgroundColor: Colors.grey[300],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ComponentText.buildTextWidget(
                title: "Select your Area!",
                fontSize: 30,
              ),
              ComponentSizedBox.topMargin(size: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                  child: TextFormField(
                    onChanged: (value){

                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },

                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search)
                    ),
                  ),
                ),
              ),
              Expanded(
                  child:ListView.builder(
                    itemCount: areas.length,
                      itemBuilder: (BuildContext context,int index){
                        return ListTile(
                          title: Text(areas[index]),
                          onTap: (){
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => SelectServiceScreen()),
                                    (route) => false);
                          },
                        );
                      }
                  )

              )
            ],
          ),
        ),
      ),
    );
  }
}
