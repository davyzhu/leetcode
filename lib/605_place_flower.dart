class Solution {
  bool canPlaceFlowers(List<int> flowerbed, int n) {
    var maxValidPlots = 0;
    var allZeros = 0;
    for (var f in flowerbed) {
      if (f == 0) {
        allZeros++;
      }
    }
    if (allZeros == flowerbed.length) {
      maxValidPlots = (flowerbed.length + 1) >> 1;
    } else {
      var vacancies = List<int>.empty(growable: true);
      int count = 0;
      for (var i = 0; i < flowerbed.length; i++) {
        if (flowerbed[i] == 0) {
          count++;
        } else {
          vacancies.add(count);
          count = 0;
        }
      }
      vacancies.add(count);
      for (var i = 0; i < vacancies.length; i++) {
        if (i == 0 || i == vacancies.length - 1) {
          maxValidPlots += vacancies[i] >> 1;
        } else {
          maxValidPlots += (vacancies[i] - 1) >> 1;
        }
      }
    }
    return n <= maxValidPlots;
  }
}
