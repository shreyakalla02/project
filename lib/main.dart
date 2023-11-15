import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/profile/login.dart';
import 'package:project/profile/sign_up.dart';
import 'package:project/dashboard/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        // Your theme data here.
      ),
      home: NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: 'Login',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_2_sharp),
            label: 'Sign up',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.dashboard_customize_sharp),
            icon: Icon(Icons.dashboard_customize_sharp),
            label: 'Dashboard',
          ),
        ],
      ),
      body: <Widget>[
        LoginPage(),
        SignUpPage(),
        DashboardPage(),
      ][currentPageIndex],
    );
  }
}
