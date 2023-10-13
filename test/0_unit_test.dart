import 'package:test/test.dart';

void main() {
  test('.split() splits the string on the delimiter', () {
    expect('foo,bar,baz',
        allOf([contains('foo'), isNot(startsWith('bar')), endsWith('baz')]));
  });
  test('anyOf', () async {
    expect('foo', anyOf([contains('bar'), contains('foo')]));
  });

  test('unorderedEquals', () async {
    expect([1, 2], unorderedEquals([1, 2]));
    expect([2, 1], unorderedEquals([1, 2]));
    expect([1, 2, 1], unorderedEquals([1, 1, 2]));
  });

  test('unorderedMatches', () async {
    expect([1, 2, 1], unorderedMatches([greaterThan(0), greaterThan(0), greaterThan(1)]));
  });

}
