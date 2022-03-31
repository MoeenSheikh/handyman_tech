import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        title: Text("Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22
            ),),

        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 55.0,
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person,size: 35,color: Colors.white,),

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,15,10,4),
                child:  Row(
                    children: [
                      Container(

                        height: 50,
                        width: 187,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Center(
                          child: Text("Wallet 0 Rs",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(

                        height: 50,
                        width: 187,

                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("Bonus 0 Rs",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),),
                        ),
                      ),
                    ],
                  ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          )
                      ),
                      child: ListTile(
                        title: Text("Abdul"),
                        leading: Icon(Icons.person_pin_sharp),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          )
                      ),
                      child: ListTile(
                        title: Text("03300221222"),
                        leading: Icon(Icons.phone),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text("Payment Methods"),
                    SizedBox(height: 7,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Bank Transfer"),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Bank Name:"),
                                Text("Al Baraka"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Account title:"),
                                Text("Mr Ali"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Account no:"),
                                Text("01034428282"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Branch Code:"),
                                Text("0307"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          )
                      ),
                      child: ListTile(
                        title: Text("Log Out"),
                        leading: Icon(Icons.logout),
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
