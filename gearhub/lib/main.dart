import 'dart:ui';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cars_page.dart';

void main() {
  runApp(const GearHubApp());
}

class GearHubApp extends StatelessWidget {
  const GearHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GearHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
      ),
      home: const MainPage(),
    );
  }
}

// ─────────────────────────────────────────────
//  Main Page (Tab Controller)
// ─────────────────────────────────────────────
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _selectedTab = 0; // 0 = Home, 1 = Cars
  int _selectedNav = 0;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();
    _fadeAnim =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void switchTab(int i) {
    setState(() => _selectedTab = i);
    _fadeController
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      extendBody: true,
      body: Stack(
        children: [
          // Ambient orbs
          _AmbientOrb(
            color: const Color(0xFFB71C1C).withOpacity(0.20),
            size: 340,
            top: -80,
            left: -60,
          ),
          _AmbientOrb(
            color: const Color(0xFF4A148C).withOpacity(0.18),
            size: 280,
            top: 220,
            right: -80,
          ),
          _AmbientOrb(
            color: const Color(0xFF1A237E).withOpacity(0.15),
            size: 260,
            bottom: 120,
            left: 20,
          ),

          // Page content
          FadeTransition(
            opacity: _fadeAnim,
            child: _selectedTab == 0
                ? HomePage(onTabSwitch: switchTab)
                : CarsPage(onTabSwitch: switchTab),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  Liquid Glass Bottom Navigation Bar
// ─────────────────────────────────────────────
class _LiquidGlassNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const _LiquidGlassNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<_LiquidGlassNavBar> createState() => _LiquidGlassNavBarState();
}

class _LiquidGlassNavBarState extends State<_LiquidGlassNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _bubbleController;

  @override
  void initState() {
    super.initState();
    _bubbleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..forward();
  }

  @override
  void dispose() {
    _bubbleController.dispose();
    super.dispose();
  }

  static const _items = [
    _NavItem(icon: Icons.home_rounded, label: 'Home'),
    _NavItem(icon: Icons.directions_car_rounded, label: 'Cars'),
    _NavItem(icon: Icons.garage_rounded, label: 'Garage'),
    _NavItem(icon: Icons.person_rounded, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.of(context).padding.bottom;
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: bottomPad + 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.18),
                  Colors.white.withOpacity(0.06),
                ],
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.22),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.40),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.05),
                  blurRadius: 1,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_items.length, (i) {
                final isActive = widget.selectedIndex == i;
                return GestureDetector(
                  onTap: () {
                    widget.onItemTapped(i);
                    _bubbleController
                      ..reset()
                      ..forward();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: isActive
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: const LinearGradient(
                              colors: [Color(0xFFEF5350), Color(0xFFC62828)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFEF5350).withOpacity(0.55),
                                blurRadius: 18,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          )
                        : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _items[i].icon,
                          size: 22,
                          color: isActive
                              ? Colors.white
                              : Colors.white.withOpacity(0.45),
                        ),
                        if (isActive) ...[
                          const SizedBox(width: 6),
                          Text(
                            _items[i].label,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}

// ─────────────────────────────────────────────
//  Ambient Orb Helper
// ─────────────────────────────────────────────
class _AmbientOrb extends StatelessWidget {
  final Color color;
  final double size;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  const _AmbientOrb({
    required this.color,
    required this.size,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: IgnorePointer(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [color, color.withOpacity(0)],
            ),
          ),
        ),
      ),
    );
  }
}