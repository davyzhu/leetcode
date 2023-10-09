class Solution {
  int minPathSum(List<List<int>> grid) {
    final m = grid.length;
    final n = grid[0].length;
    final List<List<int>> paths = [];
    for (var i = 0; i < m; i++) {
      paths.add(List.filled(n, 0));
    }
    paths[0][0] = grid[0][0];
    for (var i = 1; i < n; i++) {
      paths[0][i] = grid[0][i] + paths[0][i - 1];
    }
    for (var i = 1; i < m; i++) {
      paths[i][0] = grid[i][0] + paths[i - 1][0];
    }
    for (var i = 1; i < m; i++) {
      for (var j = 1; j < n; j++) {
        paths[i][j] = _min(paths[i][j - 1], paths[i - 1][j]) + grid[i][j];
      }
    }
    return paths[m - 1][n - 1];
  }

  _min(int a, int b) {
    return (a > b) ? b : a;
  }
}
