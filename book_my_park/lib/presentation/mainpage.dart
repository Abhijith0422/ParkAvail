import 'package:book_my_park/presentation/bottomnav.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';
import 'profilepage.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final List list = [const HomeScreen(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: (context, int index, _) {
          return list[index];
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
