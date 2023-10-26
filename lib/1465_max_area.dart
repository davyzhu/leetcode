import 'dart:math';

class Solution {
  int maxArea(int h, int w, List<int> horizontalCuts, List<int> verticalCuts) {
    horizontalCuts.sort();
    verticalCuts.sort();
    horizontalCuts.add(h);
    verticalCuts.add(w);

    return (maxSpan(horizontalCuts) * maxSpan(verticalCuts)) %
        ((pow(10, 9) as int) + 7);
  }

  int maxSpan(final List<int> cuts) {
    int maxSpan = cuts[0];
    for (var i = 1; i < cuts.length; i++) {
      var span = cuts[i] - cuts[i - 1];
      if (span > maxSpan) {
        maxSpan = span;
      }
    }
    return maxSpan;
  }
}
