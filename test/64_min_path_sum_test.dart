import 'package:test/test.dart';
import 'package:leetcode/64_min_path_sum.dart';

void main() {
  test('64 min path sum #1', () async {
    var s = Solution();
    var grid = [
      [1, 3, 1],
      [1, 5, 1],
      [4, 2, 1]
    ];
    expect(s.minPathSum(grid), equals(7));
  });
  test('64 min path sum #2', () async {
    var s = Solution();
    var grid = [
      [1, 2, 3],
      [4, 5, 6]
    ];
    expect(s.minPathSum(grid), equals(12));
  });
}
