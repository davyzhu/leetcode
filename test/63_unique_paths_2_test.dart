import 'package:test/test.dart';
import 'package:leetcode/63_unique_paths_2.dart';

void main() {
  test('63 unique paths 2 #1', () async {
    var s = Solution();
    var obstacleGrid = [
      [0, 0, 0],
      [0, 1, 0],
      [0, 0, 0]
    ];
    expect(s.uniquePathsWithObstacles(obstacleGrid), 2);
  });

  test('63 unique paths 2 #2', () async {
    var s = Solution();
    var obstacleGrid = [
      [0, 1],
      [0, 0]
    ];
    expect(s.uniquePathsWithObstacles(obstacleGrid), 1);
  });
}
