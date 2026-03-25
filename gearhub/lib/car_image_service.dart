import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class CarImageService {
  CarImageService._();
  static final CarImageService instance = CarImageService._();

  Directory? _appSupportDir;
  Directory? _cacheDir;

  /// Returns the app's support directory (persists across launches).
  Future<Directory> getAppSupportDir() async {
    _appSupportDir ??= await getApplicationSupportDirectory();
    return _appSupportDir!;
  }

  /// Returns a dedicated car-image cache directory inside the app cache.
  /// Use this when you later add runtime image downloads or user photo imports.
  Future<Directory> getImageCacheDir() async {
    if (_cacheDir == null) {
      final base = await getApplicationCacheDirectory();
      _cacheDir = Directory(p.join(base.path, 'car_images'));
      if (!await _cacheDir!.exists()) {
        await _cacheDir!.create(recursive: true);
      }
    }
    return _cacheDir!;
  }

  /// Clears the runtime image cache directory.
  Future<void> clearImageCache() async {
    final dir = await getImageCacheDir();
    if (await dir.exists()) await dir.delete(recursive: true);
    _cacheDir = null;
  }


  Future<File?> getCachedImage(String key) async {
    final dir = await getImageCacheDir();
    final file = File(p.join(dir.path, '$key.jpg'));
    return await file.exists() ? file : null;
  }
}

// ─────────────────────────────────────────────
//  CarAssetImage
//
//  Renders a bundled asset image (assets/images/).
//  Falls back to a styled placeholder if the asset
//  path is empty or the image fails to load.
// ─────────────────────────────────────────────
class CarAssetImage extends StatefulWidget {
  final String assetPath;
  final String imageKey; // 👈 NEW
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color accentColor;

  const CarAssetImage({
    super.key,
    required this.assetPath,
    required this.imageKey,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.accentColor = const Color(0xFFEF5350),
  });

  @override
  State<CarAssetImage> createState() => _CarAssetImageState();
}

class _CarAssetImageState extends State<CarAssetImage> {
  File? _file;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final file =
        await CarImageService.instance.getCachedImage(widget.imageKey);

    if (mounted) {
      setState(() {
        _file = file;
        _loading = false;
      });
    }
  }

  @override
Widget build(BuildContext context) {
  // If still loading, show asset instead of placeholder
  if (_loading) {
    return Image.asset(
      widget.assetPath,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
    );
  }

  // ✅ If cached file exists
  if (_file != null) {
    return Image.file(
      _file!,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
    );
  }

  // ✅ Fallback to asset ALWAYS
  return Image.asset(
    widget.assetPath,
    width: widget.width,
    height: widget.height,
    fit: widget.fit,
    errorBuilder: (_, __, ___) => _placeholder(),
  );
}

  Widget _placeholder() {
    return _AssetPlaceholder(
      width: widget.width,
      height: widget.height,
      accentColor: widget.accentColor,
    );
  }
}

// ─────────────────────────────────────────────
//  Placeholder shown when an asset is missing
// ─────────────────────────────────────────────
class _AssetPlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  final Color accentColor;

  const _AssetPlaceholder({
    this.width,
    this.height,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withOpacity(0.15),
            Colors.white.withOpacity(0.04),
          ],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.directions_car_rounded,
          size: 48,
          color: accentColor.withOpacity(0.45),
        ),
      ),
    );
  }
}