import 'package:test/test.dart';
import 'package:leetcode/432_AllOne.dart';

void main() {
  test('432 AllOne #1', () async {
    var allOne = AllOne();
    expect(allOne.getMaxKey(), equals(''));
    expect(allOne.getMinKey(), equals(''));
    allOne.inc("hello");
    expect(allOne.getMaxKey(), equals('hello'));
    expect(allOne.getMinKey(), equals('hello'));
    allOne.inc("hello");
    expect(allOne.getMaxKey(), equals('hello'));
    expect(allOne.getMinKey(), equals('hello'));
    allOne.inc("leet");
    expect(allOne.getMaxKey(), equals('hello'));
    expect(allOne.getMinKey(), equals('leet'));
    allOne.dec("hello");
    expect(allOne.getMaxKey(), equals(anyOf('hello', 'leet')));
    expect(allOne.getMinKey(), equals(anyOf('hello', 'leet')));
    allOne.dec("hello");
    expect(allOne.getMaxKey(), equals('leet'));
    expect(allOne.getMinKey(), equals('leet'));
    allOne.dec("leet");
    expect(allOne.getMaxKey(), equals(''));
    expect(allOne.getMinKey(), equals(''));
  });

  test('432 AllOne #2', () async {
    var allOne = AllOne();
    allOne.inc('a');
    allOne.inc('b');
    allOne.inc('b');
    allOne.inc('c');
    allOne.inc('c');
    allOne.inc('c');
    allOne.dec('b');
    allOne.dec('b');
    expect(allOne.getMinKey(), equals('a'));
    allOne.dec('a');
    expect(allOne.getMaxKey(), equals('c'));
    expect(allOne.getMinKey(), equals('c'));    
  });
}
