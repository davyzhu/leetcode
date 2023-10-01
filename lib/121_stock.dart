class Solution {
  int maxProfit(List<int> prices) {
    var minPrice = 100000;
    var maxProfit = 0;
    for (var price in prices) {
      if (price < minPrice) {
        minPrice = price;
      }

      if (price - minPrice > maxProfit) {
        maxProfit = price - minPrice;
      }
    }
    return maxProfit;
  }
}
