import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:pedalpal/pages/dashboard.dart';
import 'package:pedalpal/pages/map.dart';
import 'package:pedalpal/pages/stadistics/stadistics.dart';
import 'package:pedalpal/pages/user_page/user_page.dart';
import '../services/auth/auth.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Row(
      children: [
        Text(
          "Encuentra tu bici",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.pedal_bike_rounded)
      ],
    );
  }

  Widget _userUid() {
    return Text(user?.email ?? "eser email");
  }

  Widget _signOutButton() {
    return ElevatedButton(onPressed: signOut, child: const Text("Sign out"));
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void changeNavIndex(int num) {
      setState(() {
        _selectedIndex = num;
      });
      print("dsadasdasdas");
    }

    List<Widget> _screensList = [
      Dashboard(funcionCallback: changeNavIndex),
      const MapScreen(),
      const Stadistics(),
      const UserPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      // body: Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   padding: EdgeInsets.all(20),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       _userUid(),
      //       _signOutButton(),
      //     ],
      //   ),
      // ),
      body: _screensList[_selectedIndex],
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: const Color.fromARGB(217, 248, 248, 248),
        domeCircleColor: const Color(0xFB6900),
        selectedIndex: _selectedIndex,
        onTabChange: (clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
            icon: const Icon(
              Icons.home_outlined,
            ),
            selectedColor: Colors.white,
            unselectedColor: const Color.fromARGB(255, 36, 36, 36),
          ),
          MoltenTab(
            icon: const Icon(Icons.location_on_outlined),
            selectedColor: Colors.white,
            unselectedColor: const Color.fromARGB(255, 36, 36, 36),
          ),
          MoltenTab(
            icon: const Icon(Icons.bar_chart_outlined),
            selectedColor: Colors.white,
            unselectedColor: const Color.fromARGB(255, 36, 36, 36),
          ),
          MoltenTab(
            icon: const Icon(Icons.person_3_outlined),
            selectedColor: Colors.white,
            unselectedColor: const Color.fromARGB(255, 36, 36, 36),
          ),
        ],
      ),
    );
  }
}
