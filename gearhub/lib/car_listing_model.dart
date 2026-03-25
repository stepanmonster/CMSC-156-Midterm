import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
//  CarListing Model
// ─────────────────────────────────────────────
class CarListing {
  final String name;
  final String variant;
  final int seats;
  final String transmission;
  final String price;
  final String emoji;
  final Color accentColor;
  final String bodyStyle;
  final String fuelType;
  final String acceleration;
  final String engine;
  final int year;
  final String description;

  const CarListing({
    required this.name,
    required this.variant,
    required this.seats,
    required this.transmission,
    required this.price,
    required this.emoji,
    required this.accentColor,
    required this.bodyStyle,
    required this.fuelType,
    required this.acceleration,
    required this.engine,
    required this.year,
    required this.description,
  });
}

// ─────────────────────────────────────────────
//  CarModel (used by HomePage featured carousel)
// ─────────────────────────────────────────────
class CarModel {
  final String name;
  final String emoji;
  final String description;
  final int year;
  final Color accentColor;

  const CarModel({
    required this.name,
    required this.emoji,
    required this.description,
    required this.year,
    required this.accentColor,
  });
}

// ─────────────────────────────────────────────
//  NewsItem (used by HomePage hot news)
// ─────────────────────────────────────────────
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
//  Featured Cars Data
// ─────────────────────────────────────────────
const List<CarModel> featuredCars = [
  CarModel(
    name: 'Ferrari F40',
    emoji: '🚗',
    year: 1987,
    accentColor: Color(0xFFB71C1C),
    description:
        'The Ferrari F40 is a legendary race car for the road and the final '
        'model personally approved by Enzo Ferrari, built to celebrate the '
        'brand\'s 40th anniversary.',
  ),
  CarModel(
    name: 'Koenigsegg Jesko',
    emoji: '🏎️',
    year: 2020,
    accentColor: Color(0xFF546E7A),
    description:
        'The Koenigsegg Jesko Attack is an extreme track-focused hypercar '
        'producing 1,600 hp on E85, featuring the revolutionary Light Speed '
        'Transmission with nine clutches and seven shafts.',
  ),
  CarModel(
    name: 'Lamborghini Aventador',
    emoji: '🏁',
    year: 2018,
    accentColor: Color(0xFFF9A825),
    description:
        'The Lamborghini Aventador SVJ holds the production car lap record '
        'at the Nürburgring Nordschleife, powered by a naturally aspirated '
        '6.5L V12 producing 770 hp.',
  ),
];

// ─────────────────────────────────────────────
//  Hot News Data
// ─────────────────────────────────────────────
const List<NewsItem> hotNews = [
  NewsItem(
    emoji: '🏎️',
    title: 'Koenigsegg Reveals Next-Gen Hypercar Platform',
    snippet:
        'Swedish manufacturer Koenigsegg has unveiled a new platform set to '
        'underpin its upcoming hypercar lineup, promising even greater power '
        'and lighter weight than the Jesko.',
  ),
  NewsItem(
    emoji: '🔋',
    title: 'Ferrari\'s First EV Confirmed for 2025',
    snippet:
        'Ferrari has officially confirmed its first fully electric vehicle, '
        'set to debut in 2025 with a target of over 1,000 hp and a soundtrack '
        'engineered to thrill.',
  ),
  NewsItem(
    emoji: '🏁',
    title: 'Lamborghini Aventador Successor Spotted Testing',
    snippet:
        'Spy shots reveal the heavily camouflaged Lamborghini Revuelto successor '
        'undergoing high-speed testing at the Nürburgring, hinting at a hybrid '
        'V12 setup pushing beyond 1,001 hp.',
  ),
  NewsItem(
    emoji: '🚗',
    title: 'Pagani Announces Limited Huayra Roadster BC Run',
    snippet:
        'Pagani has announced an ultra-limited run of the Huayra Roadster BC, '
        'restricted to just 40 units worldwide, each individually tailored to '
        'its owner\'s specification.',
  ),
];

// ─────────────────────────────────────────────
//  Static Data
// ─────────────────────────────────────────────
const List<CarListing> carListings = [
  CarListing(
    name: 'Ferrari F40',
    variant: 'Type F120',
    seats: 2,
    transmission: 'Manual',
    price: '\$2,000,000',
    emoji: '🚗',
    accentColor: Color(0xFFB71C1C),
    bodyStyle: 'Supercar',
    fuelType: 'Petrol',
    acceleration: '4.1s',
    engine: 'V8 90°',
    year: 1987,
    description:
        'The Ferrari F40 (1987–1992) is a legendary "race car for the road" '
        'and the final model personally approved by Enzo Ferrari. Built to '
        'celebrate the brand\'s 40th anniversary, it was the first production '
        'car to break the 200 mph barrier, powered by a raw 471 hp twin-turbo V8. '
        'Stripped of all luxury and driver aids—lacking even power steering and '
        'door handles—it remains the ultimate benchmark for analog supercar performance.',
  ),
  CarListing(
    name: 'Koenigsegg Jesko',
    variant: 'Attack',
    seats: 2,
    transmission: 'Automatic',
    price: '\$3,000,000',
    emoji: '🏎️',
    accentColor: Color(0xFF546E7A),
    bodyStyle: 'Hypercar',
    fuelType: 'Petrol',
    acceleration: '2.5s',
    engine: 'V8 Twin-Turbo',
    year: 2020,
    description:
        'The Koenigsegg Jesko Attack (2020–present) is an extreme track-focused '
        'hypercar producing 1,600 hp on E85. Named after Jesko von Koenigsegg, '
        'the father of founder Christian von Koenigsegg, it features the revolutionary '
        'Light Speed Transmission (LST) with nine clutches and seven shafts. '
        'Aerodynamically optimized to generate over 1,000 kg of downforce, '
        'it is one of the most capable track cars ever built.',
  ),
  CarListing(
    name: 'Pagani Huayra',
    variant: 'C9 BC',
    seats: 2,
    transmission: 'Manual',
    price: '\$3,400,000',
    emoji: '🏁',
    accentColor: Color(0xFF1565C0),
    bodyStyle: 'Hypercar',
    fuelType: 'Petrol',
    acceleration: '2.8s',
    engine: 'V12 Twin-Turbo',
    year: 2011,
    description:
        'The Pagani Huayra BC (2016) is an ultra-exclusive track variant of the '
        'Huayra, limited to just 20 units. Powered by a 6.0L Mercedes-AMG V12 '
        'twin-turbo engine producing 789 hp, it features a bespoke carbon-titanium '
        'chassis and active aerodynamics. Named after Imre Bartha and Cristiano '
        'Ceccato, it weighs only 1,218 kg and delivers a raw, visceral driving '
        'experience unique to Pagani.',
  ),
  CarListing(
    name: 'Dodge Challenger SRT',
    variant: 'Type LA',
    seats: 5,
    transmission: 'Automatic',
    price: '\$125,000',
    emoji: '🚙',
    accentColor: Color(0xFFB71C1C),
    bodyStyle: 'Muscle Car',
    fuelType: 'Petrol',
    acceleration: '3.4s',
    engine: 'V8 Supercharged',
    year: 2018,
    description:
        'The Dodge Challenger SRT Hellcat (2015–2023) is the most powerful '
        'muscle car ever produced by an American manufacturer. Its supercharged '
        '6.2L HEMI V8 engine delivers 717 hp, sending power to the rear wheels '
        'through an 8-speed automatic or 6-speed manual transmission. '
        'A true icon of American performance culture, it blends retro styling '
        'with brutal straight-line performance.',
  ),
  CarListing(
    name: 'Koenigsegg Jesko',
    variant: 'Attack',
    seats: 2,
    transmission: 'Automatic',
    price: '\$3,000,000',
    emoji: '🏎️',
    accentColor: Color(0xFF546E7A),
    bodyStyle: 'Hypercar',
    fuelType: 'Petrol',
    acceleration: '2.5s',
    engine: 'V8 Twin-Turbo',
    year: 2020,
    description:
        'The Koenigsegg Jesko Attack (2020–present) is an extreme track-focused '
        'hypercar producing 1,600 hp on E85. Named after Jesko von Koenigsegg, '
        'the father of founder Christian von Koenigsegg, it features the revolutionary '
        'Light Speed Transmission (LST) with nine clutches and seven shafts. '
        'Aerodynamically optimized to generate over 1,000 kg of downforce.',
  ),
  CarListing(
    name: 'Lamborghini Aventador',
    variant: 'SVJ',
    seats: 2,
    transmission: 'Automatic',
    price: '\$517,770',
    emoji: '🏁',
    accentColor: Color(0xFFF9A825),
    bodyStyle: 'Supercar',
    fuelType: 'Petrol',
    acceleration: '2.8s',
    engine: 'V12 NA',
    year: 2018,
    description:
        'The Lamborghini Aventador SVJ (2018–2022) holds the production car lap '
        'record at the Nürburgring Nordschleife. Its naturally aspirated 6.5L V12 '
        'produces 770 hp and screams to an 8,500 rpm redline. The SVJ features '
        'Lamborghini\'s ALA 2.0 active aerodynamics system and four-wheel steering, '
        'making it as sharp in corners as it is brutal on the straights.',
  ),
];