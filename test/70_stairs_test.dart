import 'package:leetcode/70_stairs.dart';
import 'package:test/test.dart';

void main() {
    test('stairs=1', () async {
    var s = Solution();
    expect(s.climbStairs(1), 1);
  });
  test('stairs=2', () async {
    var s = Solution();
    expect(s.climbStairs(2), 2);
  });
  test('stairs=3', () async {
    var s = Solution();
    expect(s.climbStairs(3), 3);
  });
}
