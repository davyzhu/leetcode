import 'package:test/test.dart';
import 'package:leetcode/1465_max_area.dart';
void main() {
  test('1465 #1', () async {
    var h = 5, w = 4, horizontalCuts = [1, 2, 4], verticalCuts = [1, 3];
    var s = Solution();
    expect(s.maxArea(h, w, horizontalCuts, verticalCuts), 4);
  });
    test('1465 #2', () async {
    var h = 5, w = 4, horizontalCuts = [3,1], verticalCuts = [1];
    var s = Solution();
    expect(s.maxArea(h, w, horizontalCuts, verticalCuts), 6);
  });
    test('1465 #3', () async {
    var h = 5, w = 4, horizontalCuts = [3], verticalCuts = [3];
    var s = Solution();
    expect(s.maxArea(h, w, horizontalCuts, verticalCuts), 9);
  });
}
