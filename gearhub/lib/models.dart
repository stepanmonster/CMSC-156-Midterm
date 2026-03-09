import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
//  Data Models
// ─────────────────────────────────────────────
class CarModel {
  final String name;
  final int year;
  final String description;
  final String bodyStyle;
  final String fuelType;
  final String acceleration;
  final String engine;
  final Color accentColor;
  final String emoji;

  const CarModel({
    required this.name,
    required this.year,
    required this.description,
    required this.bodyStyle,
    required this.fuelType,
    required this.acceleration,
    required this.engine,
    required this.accentColor,
    required this.emoji,
  });
}

class NewsItem {
  final String title;
  final String snippet;
  final String emoji;

  const NewsItem({
    required this.title,
    required this.snippet,
    required this.emoji,
  });
}

// ─────────────────────────────────────────────
//  Static Data
// ─────────────────────────────────────────────
const List<CarModel> featuredCars = [
  CarModel(
    name: 'Pagani Huayra',
    year: 2011,
    description:
        'The Pagani Huayra is a mid-engine Italian hypercar produced from 2011–2018 (and subsequent variants), powered by a 6.0L twin-turbo Mercedes-AMG V12 engine producing ~700–764+ hp.',
    bodyStyle: 'Hypercar',
    fuelType: 'Petrol',
    acceleration: '2.8s',
    engine: 'V12 Twin-Turbo',
    accentColor: Color(0xFF546E7A),
    emoji: '🏎️',
  ),
  CarModel(
    name: 'Ferrari F40',
    year: 1987,
    description:
        'The Ferrari F40 (1987–1992) is a legendary "race car for the road" and the final model personally approved by Enzo Ferrari. The first production car to break the 200 mph barrier.',
    bodyStyle: 'Supercar',
    fuelType: 'Petrol',
    acceleration: '4.1s',
    engine: 'V8 90°',
    accentColor: Color(0xFFB71C1C),
    emoji: '🚗',
  ),
  CarModel(
    name: 'Lamborghini Aventador',
    year: 2011,
    description:
        'The Lamborghini Aventador features a naturally aspirated 6.5L V12 engine producing 700 hp. Its angular design and dramatic performance made it one of the most iconic supercars ever made.',
    bodyStyle: 'Supercar',
    fuelType: 'Petrol',
    acceleration: '2.9s',
    engine: 'V12 NA',
    accentColor: Color(0xFFF9A825),
    emoji: '🏁',
  ),
];

const List<NewsItem> hotNews = [
  NewsItem(
    title: '10 Most Anticipated Supercars of 2026',
    snippet:
        'The automotive world is ushering in a new era. Supercars, poised to enter the market with the power of advanced technology and software, are redefining performance.',
    emoji: '🚀',
  ),
  NewsItem(
    title:
        "Bugatti unveils the F.K.P. Hommage at the Ultimate Supercar Garage, celebrating 20 years of the Veyron",
    snippet:
        'Following its digital unveiling on January 22, Bugatti presented the physical World Premiere of the stunning tribute hypercar.',
    emoji: '🐝',
  ),
  NewsItem(
    title: "Surprise! This is Genesis' brand new V8-engined supercar",
    snippet:
        'Well, this was rather unexpected. Genesis – the luxury arm of Hyundai that so far has mostly focused on squishy saloons and chromed SUVs – has unveiled a proper supercar.',
    emoji: '🔥',
  ),
];