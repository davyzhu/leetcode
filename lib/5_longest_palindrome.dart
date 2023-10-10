class Solution {
  String longestPalindrome(String s) {
    if (s.isEmpty) {
      return '';
    }
    final n = s.length;
    final c = s.split('').toList(growable: false);
    assert(n == c.length);
    final List<List<bool>> startEndTable = [];
    for (var i = 0; i < n; i++) {
      startEndTable.add(List.filled(n, false));
    }
    var longestD = 0;
    String? result;
    for (var i = 0; i < n; i++) {
      startEndTable[i][i] = true;
      result = s.substring(0, 1);
    }
    for (var i = 0; i < n - 1; i++) {
      if (c[i] == c[i + 1]) {
        startEndTable[i][i + 1] = true;
        if (1 > longestD) {
          longestD = 1;
          result = s.substring(i, i + 2);
        }
      }
    }

    for (var d = 2; d <= n - 1; d++) {
      for (var i = 0; i <= n - 1 - d; i++) {
        final j = i + d;
        assert(i + 1 <= j - 1);
        if (startEndTable[i + 1][j - 1] && (c[i] == c[j])) {
          startEndTable[i][j] = true;
          if (d > longestD) {
            longestD = d;
            result = s.substring(i, j + 1);
          }
        }
      }
    }
    return result!;
  }
}
