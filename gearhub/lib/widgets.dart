import 'dart:ui';
import 'package:flutter/material.dart';
import 'car_listing_model.dart';

// ─────────────────────────────────────────────
//  Glass Top Bar
// ─────────────────────────────────────────────
class GlassTopBar extends StatelessWidget {
  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  const GlassTopBar({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 4),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color(0xFF1C1C1E).withOpacity(0.85),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.12),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Home tab
                      GestureDetector(
                        onTap: () => onTabChanged(0),
                        behavior: HitTestBehavior.opaque,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 280),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            gradient: selectedTab == 0
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFFEF7B50),
                                      Color(0xFFB84A1C)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                            boxShadow: selectedTab == 0
                                ? [
                                    BoxShadow(
                                      color: const Color(0xFFEF5350)
                                          .withOpacity(0.5),
                                      blurRadius: 14,
                                      offset: const Offset(0, 3),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: selectedTab == 0
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: selectedTab == 0
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.50),
                            ),
                          ),
                        ),
                      ),
                      // Cars tab
                      GestureDetector(
                        onTap: () => onTabChanged(1),
                        behavior: HitTestBehavior.opaque,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 280),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            gradient: selectedTab == 1
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFFEF7B50),
                                      Color(0xFFB84A1C)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                            boxShadow: selectedTab == 1
                                ? [
                                    BoxShadow(
                                      color: const Color(0xFFEF5350)
                                          .withOpacity(0.5),
                                      blurRadius: 14,
                                      offset: const Offset(0, 3),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Text(
                            'Cars',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: selectedTab == 1
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: selectedTab == 1
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  Top Tab Pill (kept for compatibility)
// ─────────────────────────────────────────────
class TopTabPill extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const TopTabPill({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: isActive ? Colors.white : Colors.white.withOpacity(0.50),
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  Spec Card (used on Cars Page)
// ─────────────────────────────────────────────
class SpecCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color accentColor;

  const SpecCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.10),
                accentColor.withOpacity(0.06),
              ],
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.13),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: accentColor, size: 26),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.5),
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  Glass Car Image Card (used on Cars Page)
// ─────────────────────────────────────────────
class GlassCarImageCard extends StatelessWidget {
  final CarListing car;

  const GlassCarImageCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.10),
                car.accentColor.withOpacity(0.10),
              ],
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.15),
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 16,
                left: 20,
                child: Text(
                  '${car.year}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.6),
                    letterSpacing: 1,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Text(car.emoji, style: const TextStyle(fontSize: 90)),
                    // Replace with:
                    // Image.asset('assets/${car.name}.png', height: 140, fit: BoxFit.contain)
                  ],
                ),
              ),
              // Sheen overlay
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(24)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.08),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}