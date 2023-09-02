class FlutterJsonPath {
  FlutterJsonPath([this.splitChar = '/']);

  final String splitChar;

  ///
  List<String> _split(String path) {
    if (path.isEmpty) {
      return [];
    }
    return path.contains(splitChar) ? path.split(splitChar) : [path];
  }

  Map<String, dynamic> gen(String path) {
    List<String> keys = _split(path);
    Map<String, dynamic> result = {};
    Map<String, dynamic> json = result;
    for (var key in keys) {
      json[key] = <String, dynamic>{};
      json = json[key];
    }
    return result;
  }

  dynamic get(
    Map<String, dynamic> map,
    String path, {
    bool forceContainKey = false,
  }) {
    Map<String, dynamic> json = map;
    List<String> keys = _split(path);
    for (int i = 0; i < keys.length; i++) {
      var key = keys[i];
      var end = (i == keys.length - 1);
      if (json.containsKey(key)) {
        if (end) {
          return json[key];
        } else {
          var child = Map<String, dynamic>.from(json[key] ?? {});
          json.remove(key);
          json[key] = child;
          json = json[key];
        }
      } else {
        if (forceContainKey) {
          throw Exception('Invalid key: $key');
        }
        return null;
      }
    }
  }

  void set(
    Map<String, dynamic> map,
    String path,
    dynamic value, {
    bool forceContainKey = false,
  }) {
    Map<String, dynamic> json = map;
    List<String> keys = _split(path);
    for (int i = 0; i < keys.length; i++) {
      var key = keys[i];
      var end = (i == keys.length - 1);
      if (json.containsKey(key)) {
        if (end) {
          json[key] = value;
          break;
        } else {
          var child = Map<String, dynamic>.from(json[key] ?? {});
          json.remove(key);
          json[key] = child;
          json = json[key];
        }
      } else {
        if (forceContainKey) {
          throw Exception('Invalid key: $key');
        }
        if (end) {
          json[key] = value;
          break;
        } else {
          json[key] = <String, dynamic>{};
        }
      }
    }
  }

  void delete(
    Map<String, dynamic> map,
    String path, {
    bool forceContainKey = false,
  }) {
    Map<String, dynamic> json = map;
    List<String> keys = _split(path);
    for (int i = 0; i < keys.length; i++) {
      var key = keys[i];
      var end = (i == keys.length - 1);
      if (json.containsKey(key)) {
        if (end) {
          json.removeWhere((k, v) => k == key);
          break;
        } else {
          var child = Map<String, dynamic>.from(json[key] ?? {});
          json.remove(key);
          json[key] = child;
          json = json[key];
        }
      } else {
        if (forceContainKey) {
          throw Exception('Invalid key: $key');
        }
        break;
      }
    }
  }
}
