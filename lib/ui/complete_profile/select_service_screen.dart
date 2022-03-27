import 'package:flutter/material.dart';
import 'package:handyman_tech/components/component_sized_box.dart';
import 'package:handyman_tech/components/component_text_widgets.dart';
import 'package:handyman_tech/ui/complete_profile/select_subservice_screen.dart';
class SelectServiceScreen extends StatefulWidget {
  const SelectServiceScreen({Key key}) : super(key: key);

  @override
  _SelectServiceScreenState createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
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
        child: Center(
          // padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ComponentSizedBox.topMargin(size: 15),
              ComponentText.buildTextWidget(
                title: "Select your Service!",
                fontSize: 30,
              ),
              ComponentSizedBox.topMargin(size: 25),
              buildKeypad(),

            ],
          ),
        ),
      ),

    );
  }
  Widget buildKeypad()
  {

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: Container(
        child: Column(
          children: [
            // columnWidths: {0: FractionColumnWidth(.4)},
            //defaultColumnWidth: IntrinsicColumnWidth(),

            Table(
              defaultColumnWidth: IntrinsicColumnWidth(),
              border: TableBorder.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 0),
              children: [
                TableRow( children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: buildButton("AC Services",
                        Icon(Icons.ac_unit,
                          color: Colors.red,size: 40,)

                    ),
                  ),
                  ComponentSizedBox.sideMargin(size: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: buildButton("Car Services",Icon(Icons.car_repair,
                      color: Colors.red,size: 40,)),
                  ),

                ]),

                TableRow( children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: buildButton("Carpenter",Icon(Icons.carpenter,
                      color: Colors.red,size: 40,)),
                  ),
                  ComponentSizedBox.sideMargin(size: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: buildButton("Cleaning",Icon(Icons.cleaning_services,
                      color: Colors.red,size: 40,)),
                  ),

                ]),
                TableRow( children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: buildButton("Electrician",Icon(Icons.electrical_services,
                      color: Colors.red,size: 40,)),
                  ),
                  ComponentSizedBox.sideMargin(size: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: buildButton("Geyser",Icon(Icons.hot_tub_sharp,
                      color: Colors.red,size: 40,)),
                  ),

                ]),
                TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: buildButton("Handyman",Icon(Icons.handyman,
                          color: Colors.red,size: 40,)),
                      ),
                      ComponentSizedBox.sideMargin(size: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: buildButton("Home Appliances",Icon(Icons.home_filled,
                          color: Colors.red,size: 40,)),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: buildButton("Painter",
                            Icon(Icons.format_paint_outlined,
                              color: Colors.red,size: 40,)),
                      ),
                      ComponentSizedBox.sideMargin(size: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: buildButton("Plumber",Icon(Icons.plumbing_sharp,
                          color: Colors.red,size: 40,)),
                      ),
                    ]
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
  Widget buildButton(String val,Icon icon)
  {
    return  InkWell(
      onTap: (){
        // if(val.contains("AC Services"))
        // {
           Navigator.push(context, MaterialPageRoute(builder: (context) =>  SelectSubServiceScreen()));
        // }
      },
      child: Container(
          height: 80,
          width: 120,
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100),
                    blurRadius: 10.0),
              ]),
          child: Column(
            children: [
              icon,
              ComponentSizedBox.topMargin(size: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: ComponentText.buildTextWidget(
                    title: val,
                    color: Colors.black,
                    fontSize: 12,
                    textAlign: TextAlign.center
                ),
              ),


            ],
          )

      ),
    );


  }
}
