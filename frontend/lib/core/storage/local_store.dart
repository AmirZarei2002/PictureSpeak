import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class LocalStore {
  LocalStore(this._file, this._data);

  final File _file;
  final Map<String, dynamic> _data;

  static Future<LocalStore> open() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/picturespeak_store.json');
    Map<String, dynamic> data = {};
    if (file.existsSync()) {
      try {
        data = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
      } catch (_) {
        data = {}; 
      }
    }
    return LocalStore(file, data);
  }

  String? getString(String key) => _data[key] as String?;

  Future<void> setString(String key, String value) async {
    _data[key] = value;
    await _persist();
  }

  Future<void> remove(String key) async {
    _data.remove(key);
    await _persist();
  }

  Future<void> _persist() => _file.writeAsString(jsonEncode(_data));
}

final localStoreProvider = Provider<LocalStore>(
  (ref) => throw UnimplementedError('localStoreProvider must be overridden'),
);
