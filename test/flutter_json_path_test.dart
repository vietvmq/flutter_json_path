import 'package:flutter_json_path/flutter_json_path.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlutterJsonPath', () {
    test('gen creates a nested map', () {
      final parser = FlutterJsonPath();
      final result = parser.gen('foo/bar/baz');
      expect(result, {
        'foo': {
          'bar': {
            'baz': {},
          },
        },
      });
    });

    test('get retrieves value from nested map', () {
      final parser = FlutterJsonPath();
      final Map<String, dynamic> map = {
        'foo': {
          'bar': {
            'baz': 42,
          },
        },
      };
      final result = parser.get(map, 'foo/bar/baz');
      expect(result, 42);
    });

    test('set sets value in nested map', () {
      final parser = FlutterJsonPath();
      final Map<String, dynamic> map = {
        'foo': {
          'bar': null,
        },
      };
      parser.set(map, 'foo/bar/baz', 42);
      expect(map, {
        'foo': {
          'bar': {
            'baz': 42,
          },
        },
      });
    });

    test('delete removes value from nested map', () {
      final parser = FlutterJsonPath();
      final Map<String, dynamic> map = {
        'foo': {
          'bar': {
            'baz': 42,
          },
        },
      };
      parser.delete(map, 'foo/bar');
      expect(map, {
        'foo': {},
      });
    });

    test('get throws Exception for invalid key', () {
      final parser = FlutterJsonPath();
      final Map<String, dynamic> map = {
        'foo': {},
      };
      expect(
        () => parser.get(map, 'foo/bar', forceContainKey: true),
        throwsException,
      );
    });

    test('set throws Exception for invalid key', () {
      final parser = FlutterJsonPath();
      final map = <String, dynamic>{};
      expect(
        () => parser.set(map, 'foo/bar/baz', 42, forceContainKey: true),
        throwsException,
      );
    });

    test('delete throws Exception for invalid key', () {
      final parser = FlutterJsonPath();
      final Map<String, dynamic> map = {
        'foo': {},
      };
      expect(
        () => parser.delete(map, 'foo/bar', forceContainKey: true),
        throwsException,
      );
    });
  });
}
