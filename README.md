# [FlutterJsonPath] in Dart

# A way to get and set json Map values using key paths!

> NOTE: A valid `Map<String, dynamic>` can be obtained using json encode/decode functions. This package will not work properly if your Map variable was initialized using Map Literals

## Features

Now you can read and write your json files without converting them to a model mapped version. Just use the key path to go directly where you want and **get**, **set**, **delete** or **gen** keys and values!

# Installing

Add `FlutterJsonPath` to your pubspec.yaml file:

```yaml
dependencies:
  flutter_json_path: latest_version
```

Import `FlutterJsonPath` in files that it will be used:

```dart
import 'package:flutter_json_path/flutter_json_path.dart';
```

## Getting started

Just create an instance of `FlutterJsonPath` and start working:

```dart
final parser = FlutterJsonPath();
final result = parser.gen('foo/bar/baz');
print('gen: $result'); // gen: {foo: {bar: CLUB}}
```

## Usage

```dart
import 'dart:convert';
import 'package:flutter_json_path/flutter_json_path.dart';

void main() {
  // Just to use as an example.
  // This is Map Literals initialization.
  Map<String, dynamic> target = {
    'foo': {
      'bar': {
        'baz': 42,
      },
    },
  };
  // This package does not work with Map Literals.
  // Must convert your Map to Json string and to Map again.
  // (if this is the case)
  target = jsonDecode(jsonEncode(target));

  final parser = FlutterJsonPath();

  var json1 = {...target};
  var value = parser.get(json1, 'foo/bar/baz');
  print('get: $value'); // get: 42

  var json2 = {...target};
  parser.set(json2, 'foo/bar', null);
  print('set: $json2'); // set: {foo: {bar: CLUB}}

  var json3 = {...target};
  parser.delete(json3, 'foo/bar');
  print('del: $json3');  // del: {foo: {}}
}
```

**Show some ❤️ and star the repo to support the project**
