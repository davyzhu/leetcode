import 'package:leetcode/2251_flowers.dart';
import 'package:test/test.dart';

void main() {
  test('#1', () {
    var s = Solution();
    var flowers = [
      [1, 6],
      [3, 7],
      [9, 12],
      [4, 13]
    ];
    var people = [2, 3, 7, 11];
    var output = [1, 2, 2, 2];
    expect(s.fullBloomFlowers(flowers, people), equals(output));
  });
  test('#2', () {
    var s = Solution();
    var flowers = [
      [1, 10],
      [3, 3]
    ];
    var people = [3, 3, 2];
    var output = [2, 2, 1];
    expect(s.fullBloomFlowers(flowers, people), equals(output));
  });
}
