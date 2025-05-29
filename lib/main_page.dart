import 'package:allocation_work/core/widgets/title_text_widget.dart';
import 'package:allocation_work/features/allocation/presentation/pages/allocation_page.dart';
import 'package:allocation_work/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [WorkAllocationPage(), DashboardPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildCustomBottomNavBar(),
    );
  }

  Widget _buildCustomBottomNavBar() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.work, 0, "Work"),
              _buildNavItem(Icons.dashboard, 1, "Dashboard"),
            ],
          ),
          if (_selectedIndex == 0 || _selectedIndex == 1)
            Positioned(
              top: -25,
              left: _selectedIndex == 0
                  ? MediaQuery.of(context).size.width * 0.16
                  : MediaQuery.of(context).size.width * 0.66,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  _selectedIndex == 0 ? Icons.work : Icons.dashboard,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, String labeltext) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Take only needed space
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.grey,
              size: 26,
            ),
            const SizedBox(height: 4), // spacing between icon and text
            FittedBox(
              child: Text(
                labeltext,
                style: TextStyle(
                  fontSize: 10,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
