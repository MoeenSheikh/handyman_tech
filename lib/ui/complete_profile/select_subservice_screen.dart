import 'package:flutter/material.dart';
import 'package:handyman_tech/components/component_button.dart';
import 'package:handyman_tech/components/component_sized_box.dart';
import 'package:handyman_tech/components/component_text_widgets.dart';
import 'package:handyman_tech/ui/home/home_page.dart';
import 'package:handyman_tech/ui/home/tabbar_screen.dart';
class SelectSubServiceScreen extends StatefulWidget {
  final String area;
  final String serviceName;
  const SelectSubServiceScreen({this.area,this.serviceName,Key key}) : super(key: key);

  @override
  _SelectSubServiceScreenState createState() => _SelectSubServiceScreenState();
}

class _SelectSubServiceScreenState extends State<SelectSubServiceScreen> {
  bool check=false;
  List selectedIndex=[];
  List<String> subServices=["AC repair","AC mounting","AC general service","AC installation","Dispenser fixing"
  ];
  @override
  Widget build(BuildContext context) {
    for(int i=0;i<subServices.length;i++)
      {
        selectedIndex.add(false);
      }
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
                title: "Select your SubService!",
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
              ComponentSizedBox.topMargin(size: 15),
              Expanded(
                  child:ListView.separated(
                      itemCount: subServices.length,

                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 2,
                        );
                      },
                      itemBuilder: (BuildContext context,int index){
                        return ListTile(

                          title: ComponentText.buildTextWidget(title: subServices[index]),
                          leading: Icon(Icons.ac_unit),
                          selectedTileColor: Colors.green,
                          selected: selectedIndex[index],
                          onTap: (){
                            setState(() {
                              selectedIndex[index]=!selectedIndex[index];
                            });
                          },
                        );
                        // return Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: InkWell(
                        //     onTap: (){
                        //
                        //       setState(() {
                        //         check=!check;
                        //       });
                        //
                        //     },
                        //     child: Container(
                        //       height: 50,
                        //       width: 180,
                        //       decoration: BoxDecoration(
                        //           color: (!check)?Colors.green:Colors.grey[300],
                        //           borderRadius: BorderRadius.circular(10),
                        //           ),
                        //       child: Row(
                        //         children: [
                        //           ComponentSizedBox.sideMargin(size: 15),
                        //           Icon(Icons.ac_unit,color: Colors.red,),
                        //           ComponentSizedBox.sideMargin(size: 30),
                        //           ComponentText.buildTextWidget(title: subServices[index]),
                        //
                        //
                        //
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // );
                      }
                  )
              ),
              ComponentSizedBox.topMargin(size: 15),
              ComponentButton.buildButton(title: 'Continue',onPressed: (){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => TabBarScreen()),
                        (route) => false);
                //Get.to(()=>  RegisterScreen());
              })
            ],
          ),
        ),
      ),
    );
  }
}
