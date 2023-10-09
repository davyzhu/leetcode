import 'package:test/test.dart';
import 'package:leetcode/198_robber.dart';

void main() {
  test('198 robber #1', () async {
    var nums = [1, 2, 3, 1];
    var s = Solution();
    expect(s.rob(nums), 4);
  });

  test('198 robber #2', () async {
    var nums = [2, 7, 9, 3, 1];
    var s = Solution();
    expect(s.rob(nums), 12);
  });
}
