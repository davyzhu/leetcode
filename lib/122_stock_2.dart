class Solution {
  int maxProfit(List<int> prices) {
    int result = 0;
    int prev = 10000;
    for (var p in prices) {
      if (p > prev) {
        result += p - prev;
      }
      prev = p;
    }
    return result;
  }
}