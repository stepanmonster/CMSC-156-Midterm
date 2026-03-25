import 'dart:ui';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'car_listing_model.dart';
import 'car_detail_page.dart';

// ─────────────────────────────────────────────
//  Cars List Page
// ─────────────────────────────────────────────
class CarsListPage extends StatelessWidget {
  final void Function(int) onTabSwitch;

  const CarsListPage({super.key, required this.onTabSwitch});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // ── Top Glass Bar ─────────────────────────
        SliverToBoxAdapter(
          child: GlassTopBar(selectedTab: 1, onTabChanged: onTabSwitch),
        ),

        // ── Page Title ────────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 24, 22, 20),
            child: Text(
              'Car List',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.2,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [Colors.white, Color(0xFFBDBDBD)],
                  ).createShader(const Rect.fromLTWH(0, 0, 250, 50)),
              ),
            ),
          ),
        ),

        // ── Car Cards ─────────────────────────────
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, i) => Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: _CarListCard(
                car: carListings[i],
                onTap: () => Navigator.push(
                  ctx,
                  MaterialPageRoute(
                    builder: (_) => CarDetailPage(
                      car: carListings[i],
                      onTabSwitch: onTabSwitch,
                    ),
                  ),
                ),
              ),
            ),
            childCount: carListings.length,
          ),
        ),

        // Bottom padding for nav bar
        const SliverToBoxAdapter(child: SizedBox(height: 110)),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  Car List Card
// ─────────────────────────────────────────────
class _CarListCard extends StatelessWidget {
  final CarListing car;
  final VoidCallback onTap;

  const _CarListCard({required this.car, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.09),
                  Colors.white.withOpacity(0.03),
                ],
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.11),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  // ── Thumbnail ───────────────────
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      width: 110,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            car.accentColor.withOpacity(0.18),
                            Colors.white.withOpacity(0.05),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          car.emoji,
                          style: const TextStyle(fontSize: 48),
                        ),
                        // Replace with real image:
                        // Image.asset('assets/${car.name}.png', fit: BoxFit.contain)
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  // ── Details ─────────────────────
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 0.1,
                          ),
                        ),
                        Text(
                          car.variant,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.45),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.person_outline_rounded,
                                size: 14,
                                color: Colors.white.withOpacity(0.55)),
                            const SizedBox(width: 4),
                            Text(
                              '${car.seats}',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.55),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(Icons.sync_rounded,
                                size: 14,
                                color: Colors.white.withOpacity(0.55)),
                            const SizedBox(width: 4),
                            Text(
                              car.transmission,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.55),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          car.price,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.white.withOpacity(0.25),
                    size: 22,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}