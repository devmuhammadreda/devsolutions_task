import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../features/home/domain/entities/product_entity.dart';
import '../../features/home/domain/entities/rating_entity.dart';

class HiveService {
  bool _isInitialized = false;

  HiveService(); // Public constructor

  Future<void> init() async {
    if (_isInitialized) return;
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(ProductEntityAdapter());
      Hive.registerAdapter(RatingEntityAdapter());
      _isInitialized = true;
    } catch (e) {
      throw Exception('Failed to initialize Hive: $e');
    }
  }

  Future<Box<T>> openBox<T>(String boxName) async {
    await init();
    try {
      return await Hive.openBox<T>(boxName);
    } catch (e) {
      throw Exception('Failed to open box $boxName: $e');
    }
  }

  Future<void> add<T>(String boxName, String key, T value) async {
    final box = await openBox<T>(boxName);
    try {
      await box.put(key, value);
    } catch (e) {
      throw Exception('Failed to add to $boxName: $e');
    }
  }

  Future<void> remove<T>(String boxName, String key) async {
    final box = await openBox<T>(boxName);
    try {
      await box.delete(key);
    } catch (e) {
      throw Exception('Failed to remove from $boxName: $e');
    }
  }

  Future<T?> get<T>(String boxName, String key) async {
    final box = await openBox<T>(boxName);
    try {
      return box.get(key);
    } catch (e) {
      throw Exception('Failed to get from $boxName: $e');
    }
  }

  Future<List<T>> getAll<T>(String boxName) async {
    final box = await openBox<T>(boxName);
    try {
      return box.values.toList();
    } catch (e) {
      throw Exception('Failed to get all from $boxName: $e');
    }
  }

  Future<void> closeBox(String boxName) async {
    try {
      final box = Hive.box(boxName);
      await box.close();
    } catch (e) {
      throw Exception('Failed to close box $boxName: $e');
    }
  }
}
