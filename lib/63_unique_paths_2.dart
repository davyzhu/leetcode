class Solution {
  int uniquePathsWithObstacles(List<List<int>> obstacleGrid) {
    final m = obstacleGrid.length;
    final n = obstacleGrid[0].length;
    final List<List<int>> paths = [List.filled(n, 1)];
    var idx = obstacleGrid[0].indexWhere((e) => e == 1);
    if (idx != -1) {
      paths[0].fillRange(idx, n, 0);
    }
    for (var i = 1; i < m; i++) {
      paths.add(List.filled(n, 0));
      for (var j = 0; j < n; j++) {
        if (obstacleGrid[i][j] == 1) {
          paths[i][j] = 0;
        } else {
          if (j == 0) {
            paths[i][0] = paths[i-1][0];
          } else {
            paths[i][j] = paths[i][j - 1] + paths[i - 1][j];
          }
        }
      }
    }
    return paths[m - 1][n - 1];
  }
}
