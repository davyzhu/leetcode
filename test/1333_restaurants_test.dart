import 'package:leetcode/1333_restaurants.dart';
import 'package:test/test.dart';

void main() {
  test('#1', () {
    final restaurants = [
      [1, 4, 1, 40, 10],
      [2, 8, 0, 50, 5],
      [3, 8, 1, 30, 4],
      [4, 10, 0, 10, 3],
      [5, 1, 1, 15, 1]
    ];
    final veganFriendly = 1;
    final maxPrice = 50;
    final maxDistance = 10;
    var sol = Solution();
    expect(
        sol.filterRestaurants(
            restaurants, veganFriendly, maxPrice, maxDistance),
        equals([3, 1, 5]));
  });

  test('#2', () {
    final restaurants = [
      [1, 4, 1, 40, 10],
      [2, 8, 0, 50, 5],
      [3, 8, 1, 30, 4],
      [4, 10, 0, 10, 3],
      [5, 1, 1, 15, 1]
    ];
    final veganFriendly = 0;
    final maxPrice = 50;
    final maxDistance = 10;
    var sol = Solution();
    expect(
        sol.filterRestaurants(
            restaurants, veganFriendly, maxPrice, maxDistance),
        equals([4, 3, 2, 1, 5]));
  });

  test('#3', () {
    final restaurants = [
      [1, 4, 1, 40, 10],
      [2, 8, 0, 50, 5],
      [3, 8, 1, 30, 4],
      [4, 10, 0, 10, 3],
      [5, 1, 1, 15, 1]
    ];
    final veganFriendly = 0;
    final maxPrice = 30;
    final maxDistance = 3;
    var sol = Solution();
    expect(
        sol.filterRestaurants(
            restaurants, veganFriendly, maxPrice, maxDistance),
        equals([4, 5]));
  });
}
