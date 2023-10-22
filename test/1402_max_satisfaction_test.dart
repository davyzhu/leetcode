import 'package:test/test.dart';
import 'package:leetcode/1402_max_satisfaction.dart';

void main() {
  test('1402 length=1 #1', () async {
    var s = Solution();
    var satisfaction = [1];
    expect(s.maxSatisfaction(satisfaction), 1);
  });
  test('1402 length=1 #2', () async {
    var s = Solution();
    var satisfaction = [-1];
    expect(s.maxSatisfaction(satisfaction), 0);
  });
  test('1402 length=1 #3', () async {
    var s = Solution();
    var satisfaction = [0];
    expect(s.maxSatisfaction(satisfaction), 0);
  });
  test('1402 length=2 #1', () async {
    var s = Solution();
    var satisfaction = [2, 1];
    expect(s.maxSatisfaction(satisfaction), 5);
  });
  test('1402 length=2 #2', () async {
    var s = Solution();
    var satisfaction = [0, 1];
    expect(s.maxSatisfaction(satisfaction), 2);
  });
  test('1402 length=2 #3', () async {
    var s = Solution();
    var satisfaction = [-1, 1];
    expect(s.maxSatisfaction(satisfaction), 1);
  });
  test('1402 length=3 #1', () async {
    var s = Solution();
    var satisfaction = [4, 3, 2];
    expect(s.maxSatisfaction(satisfaction), 20);
  });
  test('1402 length=3 #2', () async {
    var s = Solution();
    var satisfaction = [-1, -4, -5];
    expect(s.maxSatisfaction(satisfaction), 0);
  });

  test('1402 length=5 #1', () async {
    var s = Solution();
    var satisfaction = [-1,-8,0,5,-9];
    expect(s.maxSatisfaction(satisfaction), 14);
  });
}
