import 'dart:convert';

import 'package:flutter_json_path/flutter_json_path.dart';

void main() {
  Map<String, dynamic> target = {
    'foo': {
      'bar': {
        'baz': 42,
      },
    },
  };

  target = jsonDecode(jsonEncode(target));

  final parser = FlutterJsonPath();

  var json = parser.gen('foo/bar/baz');
  print('gen: $json'); // gen: {foo: {bar: {baz: {}}}}

  var json1 = {...target};
  var value = parser.get(json1, 'foo/bar/baz');
  print('get: $value'); // get: 42

  var json2 = {...target};
  parser.set(json2, 'foo/bar', 'CLUB');
  print('set: $json2'); // set: {foo: {bar: CLUB}}

  var json3 = {...target};
  parser.delete(json3, 'foo/bar');
  print('del: $json3'); // del: {foo: {}}
}
