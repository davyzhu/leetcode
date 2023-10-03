class Solution {
  List<int>? ways;
  int climbStairs(int n) {
    ways = List<int>.filled(45, 0);
    ways![0] = 1;
    ways![1] = 2;

    return dp(n);
  }

  int dp(int n) {
    if (ways![n - 1] == 0) {
      ways![n - 1] = dp(n - 1) + dp(n - 2);
    }
    return ways![n - 1];
  }
}
