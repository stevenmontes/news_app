import 'package:flutter/material.dart';
import 'package:news_app/src/pages/tab1_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationProvider(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<_NavigationProvider>(context);

    return BottomNavigationBar(
        currentIndex: navigationProvider.currentPage,
        onTap: (value) => navigationProvider.currentPage = value,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Para ti'),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: 'Encabezados'),
        ]);
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<_NavigationProvider>(context);

    return PageView(
      controller: navigationProvider.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}

class _NavigationProvider extends ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 1);

  int get currentPage => _currentPage;

  set currentPage(int valor) {
    _currentPage = valor;
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
