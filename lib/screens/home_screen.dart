import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/category_card.dart';
import '../widgets/header.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/custom_nav_bar.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  //
  late final List<Widget> _pages = [
    _buildHomeContent(), // your current UI
    const Center(child: Text("Category Page")), // or another screen
  ];

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

Widget _buildHomeContent() {
  return CustomScrollView(
    slivers: [
      SliverToBoxAdapter(
        child: const CustomNavBar(showBack: false),
      ),

      SliverToBoxAdapter(
        child: AppHeader(
          title: "OtegaPlus Kitchen",
          subtitle: "What will you like to order today",
        ),
      ),

      SliverPadding(
        padding: const EdgeInsets.all(6),
        sliver: DecoratedSliver(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                final category = categories[index];

                return CategoryCard(
                  category: category,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => CategoryScreen(category: category),
                      ),
                    );
                  },
                );
              },
              childCount: categories.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1,
            ),
          ),
        ),
      ),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Container(
          color: Colors.white,
        ),
      ),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
