import 'package:leetcode/62_unique_paths.dart';
import 'package:test/test.dart';

void main() {
  test('62 unique paths #1', () async {
    var m = 3;
    var n = 7;
    var s = Solution();
    expect(s.uniquePaths(m, n), 28);
  });
  test('62 unique paths #2', () async {
    var m = 3;
    var n = 2;
    var s = Solution();
    expect(s.uniquePaths(m, n), 3);
  });
    test('62 unique paths #3', () async {
    var m = 2;
    var n = 2;
    var s = Solution();
    expect(s.uniquePaths(m, n), 2);
  });

}
