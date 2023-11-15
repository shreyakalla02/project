import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
        ],
        currentIndex: 0, // Set the initial selected index
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle navigation based on the selected index
          if (index == 0) {
            GoRouter.of(context).go('/profile');
          } else if (index == 1) {
            GoRouter.of(context).go('/dashboard');
          } else if (index == 2) {
            GoRouter.of(context).go('/calendar');
          }
        },
      ),
    );
  }
}
