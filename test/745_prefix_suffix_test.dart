import 'package:leetcode/745_prefix_suffix.dart';
import 'package:test/test.dart';

void main() {
  test('#1', () {
    var wordFilter = WordFilter(["abc"]);
    expect(wordFilter.f('a', 'c'), equals(0));
    expect(wordFilter.f('c', 'a'), equals(-1));
    expect(wordFilter.f('ab', 'c'), equals(0));
    expect(wordFilter.f('a', 'bc'), equals(0));
    expect(wordFilter.f('b', 'c'), equals(-1));
  });

  test('charIndex #a', () {
    expect(charIndex('a'), equals(0));
  });
  test('charIndex #z', () {
    expect(charIndex('z'), equals(25));
  });
  test('charIndex #{', () {
    expect(charIndex('{'), equals(26));
  });
}
