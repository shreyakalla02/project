// Import necessary packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/profile/login.dart';
import 'package:project/profile/sign_up.dart';
import 'package:project/profile/home_page.dart'; // This will be the main app screen after login
import 'package:project/edit_profile/edit_profile.dart';
import 'package:project/dashboard/dashboard.dart';
import 'package:project/calendar/calender.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create an instance of GoRouter
    final GoRouter _router = GoRouter(
      initialLocation: '/login',
      navigatorBuilder: (context, state, action) {
        return Navigator(
          pages: [
            MaterialPage(child: LoginPage()),
            MaterialPage(child: SignUpPage()),
            if (state.currentLocation == '/home')
              MaterialPage(child: HomePage()),
            if (state.currentLocation == '/profile')
              MaterialPage(child: ProfilePage()),
            if (state.currentLocation == '/dashboard')
              MaterialPage(child: DashboardPage()),
            if (state.currentLocation == '/calendar')
              MaterialPage(child: CalendarPage()),
          ],
        );
      },
      // Ensure you provide an instance of GoNavigatorObserver
      navigatorObserver: () => GoNavigatorObserver(),
    );

    return MaterialApp(
      title: 'CALTrack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'CALTrack',
          // Use the _router instance for routerDelegate
          routerDelegate: _router.routerDelegate,
          routeInformationParser: _router.routeInformationParser,
        );
      },
    );
  }
}
