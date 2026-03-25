import 'package:flutter/material.dart';
import 'cars_list_page.dart';

// ─────────────────────────────────────────────
//  Cars Page
//  Navigation: CarsListPage → CarDetailPage
//  is handled via Navigator.push inside
//  CarsListPage when a card is tapped.
// ─────────────────────────────────────────────
class CarsPage extends StatelessWidget {
  final void Function(int) onTabSwitch;

  const CarsPage({super.key, required this.onTabSwitch});

  @override
  Widget build(BuildContext context) {
    return CarsListPage(onTabSwitch: onTabSwitch);
  }
}