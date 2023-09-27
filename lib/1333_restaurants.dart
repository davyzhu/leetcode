class Restaurant {
  final int id;
  final int rating;
  final int veganFriendly;
  final int price;
  final int distance;

  Restaurant(
      this.id, this.rating, this.veganFriendly, this.price, this.distance);
}

class Solution {
  List<int> filterRestaurants(List<List<int>> restaurants, int veganFriendly,
      int maxPrice, int maxDistance) {
    var restaurantsList = List<Restaurant>.empty(growable: true);
    for (var r in restaurants) {
      restaurantsList.add(Restaurant(r[0], r[1], r[2], r[3], r[4]));
    }
    if (veganFriendly == 1) {
      restaurantsList.retainWhere((r) => r.veganFriendly == 1);
    }
    restaurantsList.retainWhere((r) => r.price <= maxPrice);
    restaurantsList.retainWhere((r) => r.distance <= maxDistance);
    restaurantsList.sort(comparator);
    return restaurantsList.map((r) => r.id).toList();
  }

  int comparator(final Restaurant a, final Restaurant b) {
    if (a.rating == b.rating) {
      return a.id > b.id ? -1 : 1;
    } else if (a.rating < b.rating) {
      return 1;
    } else {
      return -1;
    }
  }
}
