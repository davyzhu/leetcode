import 'package:leetcode/605_place_flower.dart';
import 'package:test/test.dart';

void main() {
  test('head 1: can place', () {
    var s = Solution();
    var flowerbed = [0];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(true));
  });
  test('head 1: cannot place', () {
    var s = Solution();
    var flowerbed = [0];
    var n = 2;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });
  test('head 2: can place', () {
    var s = Solution();
    var flowerbed = [0, 0];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(true));
  });
  test('head 2: cannot place', () {
    var s = Solution();
    var flowerbed = [0, 0];
    var n = 2;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });
  test('head 3: can place', () {
    var s = Solution();
    var flowerbed = [0, 0, 0];
    var n = 2;
    expect(s.canPlaceFlowers(flowerbed, n), equals(true));
  });
  test('head 3: cannot place', () {
    var s = Solution();
    var flowerbed = [0, 0, 0];
    var n = 3;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });
  test('head 1: cannot place', () {
    var s = Solution();
    var flowerbed = [0, 1];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });
  test('head 2: can place', () {
    var s = Solution();
    var flowerbed = [0, 0, 1];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(true));
  });
  test('head 2: cannot place', () {
    var s = Solution();
    var flowerbed = [0, 0, 1];
    var n = 2;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });
  test('head 3: can place', () {
    var s = Solution();
    var flowerbed = [0, 0, 0, 1];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(true));
  });
  test('head 3: cannot place', () {
    var s = Solution();
    var flowerbed = [0, 0, 0, 1];
    var n = 2;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });

  test('tail 1: cannot place', () {
    var s = Solution();
    var flowerbed = [1, 0];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });
  test('tail 2: can place', () {
    var s = Solution();
    var flowerbed = [1, 0, 0];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(true));
  });
  test('tail 2: cannot place', () {
    var s = Solution();
    var flowerbed = [1, 0, 0];
    var n = 2;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });
  test('tail 3: can place', () {
    var s = Solution();
    var flowerbed = [1, 0, 0, 0];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(true));
  });
  test('tail 3: cannot place', () {
    var s = Solution();
    var flowerbed = [1, 0, 0, 0];
    var n = 2;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });

  test('middle 1: cannot place', () {
    var s = Solution();
    var flowerbed = [1, 0, 1];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });
  test('middle 2: cannot place', () {
    var s = Solution();
    var flowerbed = [1, 0, 0, 1];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });
  test('middle 3:can place', () {
    var s = Solution();
    var flowerbed = [1, 0, 0, 0, 1];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(true));
  });
  test('middle 3: cannot place', () {
    var s = Solution();
    var flowerbed = [1, 0, 0, 0, 1];
    var n = 2;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });
  test('middle 4:can place', () {
    var s = Solution();
    var flowerbed = [1, 0, 0, 0, 0, 1];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(true));
  });
  test('middle 4: cannot place', () {
    var s = Solution();
    var flowerbed = [1, 0, 0, 0, 0, 1];
    var n = 2;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });
  test('middle 5:can place', () {
    var s = Solution();
    var flowerbed = [1, 0, 0, 0, 0, 0, 1];
    var n = 2;
    expect(s.canPlaceFlowers(flowerbed, n), equals(true));
  });
  test('middle 5: cannot place', () {
    var s = Solution();
    var flowerbed = [1, 0, 0, 0, 0, 0, 1];
    var n = 3;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });

  test('head 1, tail 3, middle 2: can place', () {
    var s = Solution();
    var flowerbed = [0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0];
    var n = 1;
    expect(s.canPlaceFlowers(flowerbed, n), equals(true));
  });
  test('head 1, tail 3, middle 2: cannot place', () {
    var s = Solution();
    var flowerbed = [0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0];
    var n = 2;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });

  test('head 2, tail 3, middle 3: can place', () {
    var s = Solution();
    var flowerbed = [0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0];
    var n = 3;
    expect(s.canPlaceFlowers(flowerbed, n), equals(true));
  });
  test('head 2, tail 3, middle 3: cannot place', () {
    var s = Solution();
    var flowerbed = [0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0];
    var n = 4;
    expect(s.canPlaceFlowers(flowerbed, n), equals(false));
  });
}
