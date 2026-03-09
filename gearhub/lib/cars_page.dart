import 'package:flutter/material.dart';
import 'models.dart';
import 'widgets.dart';

class CarsPage extends StatelessWidget {
  final void Function(int) onTabSwitch;

  const CarsPage({super.key, required this.onTabSwitch});

  @override
  Widget build(BuildContext context) {
    // Showing Ferrari F40 (index 1) as the default car detail
    final car = featuredCars[1];

    return CustomScrollView(
      slivers: [
        // ── Top Glass Bar ─────────────────────────
        SliverToBoxAdapter(
          child: GlassTopBar(
            selectedTab: 1,
            onTabChanged: onTabSwitch,
          ),
        ),

        // ── Car Title ─────────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 28, 22, 0),
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

        // ── Car Image Card ────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: GlassCarImageCard(car: car),
          ),
        ),

        // ── Description ───────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
            child: Text(
              'The Ferrari F40 (1987–1992) is a legendary "race car for the road" '
              'and the final model personally approved by Enzo Ferrari. Built to '
              'celebrate the brand\'s 40th anniversary, it was the first production '
              'car to break the 200 mph barrier, powered by a raw 471 hp twin-turbo V8. '
              'Stripped of all luxury and driver aids—lacking even power steering and '
              'door handles—it remains the ultimate benchmark for analog supercar performance.',
              style: TextStyle(
                fontSize: 14,
                height: 1.65,
                color: Colors.white.withOpacity(0.72),
                letterSpacing: 0.1,
              ),
            ),
          ),
        ),

        // ── Spec Grid ─────────────────────────────
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.15,
            ),
          ),
        ),

        // Bottom padding for nav bar
        const SliverToBoxAdapter(child: SizedBox(height: 110)),
      ],
    );
  }
}