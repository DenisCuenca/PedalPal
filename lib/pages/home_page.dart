import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:pedalpal/pages/dashboard.dart';
import 'package:pedalpal/pages/map.dart';
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
    return const Text("firebase Auth");
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
    List<Widget> _screensList = [Dashboard(), MapScreen()];

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
        barColor: Color.fromARGB(255, 241, 241, 241),
        domeCircleColor: Color(0xFB6900),
        selectedIndex: _selectedIndex,
        onTabChange: (clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        tabs: [
          MoltenTab(
            icon: Icon(
              Icons.home_rounded,
            ),
            selectedColor: Colors.white,
            unselectedColor: const Color.fromARGB(255, 36, 36, 36),
          ),
          MoltenTab(
            icon: Icon(Icons.location_on_rounded),
            selectedColor: Colors.white,
            unselectedColor: const Color.fromARGB(255, 36, 36, 36),
          ),
          MoltenTab(
            icon: Icon(Icons.bar_chart_rounded, color: Colors.black),
            selectedColor: Colors.white,
            unselectedColor: const Color.fromARGB(255, 36, 36, 36),
          ),
          MoltenTab(
            icon: Icon(Icons.person_3_rounded, color: Colors.black),
            selectedColor: Colors.white,
            unselectedColor: const Color.fromARGB(255, 36, 36, 36),
          ),
        ],
      ),
    );
  }
}
