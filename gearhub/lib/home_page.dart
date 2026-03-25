import 'dart:ui';
import 'package:flutter/material.dart';
import 'car_listing_model.dart';
import 'widgets.dart';
import 'car_image_service.dart';

class HomePage extends StatefulWidget {
  final void Function(int) onTabSwitch;

  const HomePage({super.key, required this.onTabSwitch});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _featuredIndex = 0;
  final PageController _pageController =
      PageController(viewportFraction: 0.88);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // ── Top Glass Bar ─────────────────────────
        SliverPersistentHeader(
          pinned: true,
          delegate: GlassTopBarDelegate(
            child: GlassTopBar(
              selectedTab: 0,
              onTabChanged: widget.onTabSwitch,
            )
          ),
        ),

        // ── FEATURED Title ────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 28, 22, 14),
            child: Text(
              'FEATURED',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [Colors.white, Color(0xFFBDBDBD)],
                  ).createShader(const Rect.fromLTWH(0, 0, 200, 40)),
              ),
            ),
          ),
        ),

        // ── Featured Carousel ─────────────────────
        SliverToBoxAdapter(
          child: SizedBox(
            height: 260,
            child: PageView.builder(
              controller: _pageController,
              itemCount: featuredCars.length,
              onPageChanged: (i) => setState(() => _featuredIndex = i),
              itemBuilder: (ctx, i) {
                final car = featuredCars[i];
                return AnimatedScale(
                  scale: i == _featuredIndex ? 1.0 : 0.93,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  child: _FeaturedCarCard(car: car),
                );
              },
            ),
          ),
        ),

        // ── Dot Indicators ────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(featuredCars.length, (i) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: i == _featuredIndex ? 20 : 7,
                  height: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: i == _featuredIndex
                        ? const Color(0xFFEF5350)
                        : Colors.white.withOpacity(0.3),
                  ),
                );
              }),
            ),
          ),
        ),

        // ── Featured Description ──────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 18, 22, 0),
            child: GestureDetector(
              onTap: () => widget.onTabSwitch(1),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.65,
                    color: Colors.white.withOpacity(0.72),
                    letterSpacing: 0.1,
                  ),
                  children: [
                    TextSpan(text: featuredCars[_featuredIndex].description),
                    const TextSpan(
                      text: ' Tap to read more',
                      style: TextStyle(
                        color: Color(0xFFEF5350),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // ── HOT NEWS Title ────────────────────────
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 32, 22, 14),
            child: Text(
              'HOT NEWS',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [Colors.white, Color(0xFFBDBDBD)],
                  ).createShader(const Rect.fromLTWH(0, 0, 200, 40)),
              ),
            ),
          ),
        ),

        // ── News List ─────────────────────────────
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, i) => Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: _NewsCard(news: hotNews[i]),
            ),
            childCount: hotNews.length,
          ),
        ),

        // Bottom padding for nav bar
        const SliverToBoxAdapter(child: SizedBox(height: 110)),
      ],
    );
  }
}

class GlassTopBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  GlassTopBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70; // your bar height
  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant GlassTopBarDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}
// ─────────────────────────────────────────────
//  Featured Car Card
// ─────────────────────────────────────────────
class _FeaturedCarCard extends StatelessWidget {
  final CarModel car;
  const _FeaturedCarCard({required this.car});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SizedBox(
          height: 260,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // ── Asset photo ──────────────────────
              CarAssetImage(
                assetPath: car.imagePath,
                imageKey: car.name,
                width: double.infinity,
                height: 260,
                fit: BoxFit.cover,
                accentColor: car.accentColor,
              ),

              // ── Bottom gradient scrim ────────────
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.70),
                    ],
                    stops: const [0.45, 1.0],
                  ),
                ),
              ),

              // ── Glass border ─────────────────────
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.14),
                    width: 1,
                  ),
                ),
              ),

              // ── Top sheen ────────────────────────
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(24)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.09),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              // ── Name + year ──────────────────────
              Positioned(
                bottom: 18,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      car.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 0.2,
                        shadows: [
                          Shadow(
                            color: Colors.black54,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${car.year}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.65),
                        letterSpacing: 0.5,
                        shadows: const [
                          Shadow(color: Colors.black54, blurRadius: 6),
                        ],
                      ),
                    ),
                  ],
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
//  News Card
// ─────────────────────────────────────────────
class _NewsCard extends StatelessWidget {
  final NewsItem news;
  const _NewsCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Thumbnail ────────────────────────
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 90,
                    height: 80,
                    child: CarAssetImage(
                      assetPath: news.imagePath,
                      imageKey: news.title,
                      width: 90,
                      height: 80,
                      fit: BoxFit.cover,
                      accentColor: const Color(0xFFEF5350),
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                // ── Text ─────────────────────────────
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.55),
                            height: 1.5,
                          ),
                          children: [
                            TextSpan(text: news.snippet),
                            const TextSpan(
                              text: ' Tap to read more',
                              style: TextStyle(
                                color: Color(0xFFEF5350),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}