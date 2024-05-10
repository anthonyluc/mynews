import 'package:flutter/material.dart';
import '../news/news_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});
  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: const <Widget>[
        NewsPage(category: 'Technologie'),
        NewsPage(category: 'Science'),
        NewsPage(category: 'Crypto'),
        NewsPage(category: 'Manga'),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        // backgroundColor: Colors.white,
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
        // selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
