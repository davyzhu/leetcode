void main() {
  var flowerbed = [1, 1, 0, 0, 0, 1, 0, 0, 1, 1];
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
  print(vacancies);
}
