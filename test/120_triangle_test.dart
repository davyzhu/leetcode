import 'package:test/test.dart';
import 'package:leetcode/120_triangle.dart';

void main() {
  test('120 triangle #1', () async {
    var triangle = [
      [2],
      [3, 4],
      [6, 5, 7],
      [4, 1, 8, 3]
    ];
    var s = Solution();
    expect(s.minimumTotal(triangle), 11);
  });

  test('120 triangle #2', () async {
    var triangle = [
      [-10]
    ];
    var s = Solution();
    expect(s.minimumTotal(triangle), -10);
  });

  
  test('120 triangle #3', () async {
    var triangle = [
      [2],
      [3, 4],
    ];
    var s = Solution();
    expect(s.minimumTotal(triangle), 5);
  });

}
