import 'package:flutter_json_path/flutter_json_path.dart';

void main() {
  final Map<String, dynamic> map = {
    'foo': {
      'bar': {
        'baz': 42,
      },
    },
  };

  final parser = FlutterJsonPath();

  var json1 = {...map};
  var value = parser.get(json1, 'foo/bar/baz');
  print('get: $value'); // get: 42

  var json2 = {...map};
  parser.set(json2, 'foo/bar', 'CLUB');
  print('set: $json2'); // set: {foo: {bar: CLUB}}

  var json3 = {...map};
  parser.delete(json3, 'foo/bar');
  print('del: $json3');  // del: {foo: {}}
}


