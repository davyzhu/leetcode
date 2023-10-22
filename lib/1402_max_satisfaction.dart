class Solution {
  int maxSatisfaction(List<int> satisfaction) {
    satisfaction.sort();
    int total = 0;
    int index = satisfaction.length;
    for (var i = satisfaction.length - 1; i >= 0; i--) {
      total += satisfaction[i];
      if (total <= 0) {
        index = i + 1;
        break;
      }
      if (i == 0 && total > 0) {
        index = 0;
        break;
      }
    }
    int result = 0;
    for (var i = index; i < satisfaction.length; i++) {
      result += satisfaction[i] * (i - index + 1);
    }
    return result;
  }
}
