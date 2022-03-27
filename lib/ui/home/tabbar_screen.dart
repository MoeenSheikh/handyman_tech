import 'package:flutter/material.dart';
import 'package:handyman_tech/ui/home/order_list_screen.dart';
import 'package:handyman_tech/ui/home/repair_screen.dart';

import 'home_page.dart';
class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key key}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    RepairScreen(),
    OrderListScreen(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: bottomNavBar()
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget bottomNavBar(){
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.red),
              label: 'Home',
              backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.handyman,color: Colors.red),
              label: 'Repair',
              backgroundColor: Colors.white
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list,color: Colors.red),
              label: 'List',
              backgroundColor: Colors.white
          ),

        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onItemTapped,

        elevation: 5
    );
  }
}
