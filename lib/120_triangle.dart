class Solution {
  int minimumTotal(List<List<int>> triangle) {
    final length = triangle.length;

    if (length > 1) {
      for (var i = length - 2; i >= 0; i--) {
        for (var j = 0; j <= i; j++) {
          triangle[i][j] += _min(triangle[i+1][j],triangle[i+1][j+1]); 
        }
      }
    }

    return triangle[0][0];
  }

  int _min(a, b) => a < b ? a : b;
}
