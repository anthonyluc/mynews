import 'package:flutter/material.dart';
import '../news/news_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});
  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    const NewsPage(category: 'technologie'),
    const NewsPage(category: 'science'),
    const NewsPage(category: 'crypto'),
    const NewsPage(category: 'manga'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        backgroundColor: Colors.white,
        unselectedItemColor: const Color(0xffacacac),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xffacacac),
        ),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Technologie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'science',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'crypto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'manga',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
