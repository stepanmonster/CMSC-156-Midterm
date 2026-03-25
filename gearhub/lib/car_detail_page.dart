import 'dart:ui';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'car_listing_model.dart';

// ─────────────────────────────────────────────
//  Car Detail Page
// ─────────────────────────────────────────────
class CarDetailPage extends StatelessWidget {
  final CarListing car;
  final void Function(int) onTabSwitch;

  const CarDetailPage({
    super.key,
    required this.car,
    required this.onTabSwitch,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      extendBody: true,
      body: Stack(
        children: [
          // ── Ambient orbs (matching main app) ────
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

          // ── Scrollable Content ───────────────────
          CustomScrollView(
            slivers: [
              // ── Back Button ─────────────────────
              SliverToBoxAdapter(
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      behavior: HitTestBehavior.opaque,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 14,
                            color: Colors.white.withOpacity(0.55),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Cars',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.55),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // ── Car Title ───────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 16, 22, 0),
                  child: Text(
                    car.name,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.5,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [Colors.white, Color(0xFFEF9A9A)],
                        ).createShader(const Rect.fromLTWH(0, 0, 300, 60)),
                    ),
                  ),
                ),
              ),

              // ── Car Image Card ──────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                  child: _CarImageCard(car: car),
                ),
              ),

              // ── Description ─────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
                  child: Text(
                    car.description,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.65,
                      color: Colors.white.withOpacity(0.72),
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),

              // ── Spec Grid ───────────────────────
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(18, 22, 18, 0),
                sliver: SliverGrid(
                  delegate: SliverChildListDelegate([
                    SpecCard(
                      icon: Icons.directions_car_rounded,
                      label: 'Body Style',
                      value: car.bodyStyle,
                      accentColor: const Color(0xFFEF5350),
                    ),
                    SpecCard(
                      icon: Icons.local_gas_station_rounded,
                      label: 'Fuel Type',
                      value: car.fuelType,
                      accentColor: const Color(0xFFFF7043),
                    ),
                    SpecCard(
                      icon: Icons.speed_rounded,
                      label: '0–100 K/h',
                      value: car.acceleration,
                      accentColor: const Color(0xFFAB47BC),
                    ),
                    SpecCard(
                      icon: Icons.settings_rounded,
                      label: 'Engine Car',
                      value: car.engine,
                      accentColor: const Color(0xFF42A5F5),
                    ),
                  ]),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.15,
                  ),
                ),
              ),

              // Bottom padding
              const SliverToBoxAdapter(child: SizedBox(height: 110)),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  Car Image Card
// ─────────────────────────────────────────────
class _CarImageCard extends StatelessWidget {
  final CarListing car;
  const _CarImageCard({required this.car});

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
                    // Replace with real image:
                    // Image.asset('assets/${car.name}.png', height: 140, fit: BoxFit.contain)
                  ],
                ),
              ),
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

// ─────────────────────────────────────────────
//  Ambient Orb (duplicated from main for
//  self-contained background on this page)
// ─────────────────────────────────────────────
class _AmbientOrb extends StatelessWidget {
  final Color color;
  final double size;
  final double? top, left, right, bottom;

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