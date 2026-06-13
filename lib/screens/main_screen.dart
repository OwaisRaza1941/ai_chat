import 'package:ai_chat/screens/assistant/assistant_screen.dart';
import 'package:ai_chat/screens/explore/explore_screen.dart';
import 'package:ai_chat/screens/history/history_screen.dart';
import 'package:ai_chat/screens/home/home_screen.dart';
import 'package:ai_chat/screens/profile/profile_screen.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainScreen> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> screens = [
    HomeScreen(),
    ExploreScreen(),
    AssistantScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: selectedIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (selectedIndex != 0) {
          setState(() {
            selectedIndex = 0;
          });
        }
      },
      child: Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),

          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.surface,

            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).hintColor,

            selectedLabelStyle: AppTextStyle.bodySmall.copyWith(
              fontWeight: FontWeight.bold,
            ),

            unselectedLabelStyle: AppTextStyle.bodySmall,

            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: _onItemTapped,

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                activeIcon: _activeIcon(Icons.chat),
                label: 'Chats',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                activeIcon: _activeIcon(Icons.explore),
                label: 'Explore',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.assistant),
                activeIcon: _activeIcon(Icons.assistant),
                label: 'Assistant',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                activeIcon: _activeIcon(Icons.history),
                label: 'History',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: _activeIcon(Icons.person_outline),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _activeIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon, color: Theme.of(context).colorScheme.primary),
    );
  }
}
