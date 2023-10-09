class Solution {
  int uniquePaths(int m, int n) {
    final List<List<int>> paths = [List.filled(n, 1)];
    for (var i = 1; i < m; i++) {
      paths.add(List.filled(n, 0));
      for (var j = 0; j < n; j++) {
        if (j == 0) {
          paths[i][0] = 1;
        } else {
          paths[i][j] = paths[i][j - 1] + paths[i - 1][j];
        }
      }
    }

    return paths[m - 1][n - 1];
  }
}
