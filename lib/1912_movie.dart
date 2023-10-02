import 'dart:collection';

class RecordPS implements Comparable<RecordPS> {
  final int price;
  final int shop;

  RecordPS(this.price, this.shop);

  @override
  int compareTo(other) {
    if (price < other.price) {
      return -1;
    } else if (price > other.price) {
      return 1;
    } else {
      if (shop < other.shop) {
        return -1;
      } else if (shop > other.shop) {
        return 1;
      } else {
        return 0;
      }
    }
  }

  @override
  String toString() {
    return 'price:$price, shop:$shop';
  }
}

class RecordPSM implements Comparable<RecordPSM> {
  final int price;
  final int shop;
  final int movie;

  RecordPSM(this.price, this.shop, this.movie);

  @override
  int compareTo(other) {
    if (price < other.price) {
      return -1;
    } else if (price > other.price) {
      return 1;
    } else {
      if (shop < other.shop) {
        return -1;
      } else if (shop > other.shop) {
        return 1;
      } else {
        if (movie < other.movie) {
          return -1;
        } else if (movie > other.movie) {
          return 1;
        } else {
          return 0;
        }
      }
    }
  }

  @override
  String toString() {
    return 'price:$price, shop:$shop, movie:$movie';
  }

  @override
  bool operator ==(Object other) {
    return other is RecordPSM &&
        runtimeType == other.runtimeType &&
        price == other.price &&
        shop == other.shop &&
        movie == other.movie;
  }

  @override
  int get hashCode => Object.hash(price, shop, movie);
}

class RecordSM {
  final int shop;
  final int movie;

  RecordSM(this.shop, this.movie);
  @override
  bool operator ==(Object other) {
    return other is RecordSM &&
        runtimeType == other.runtimeType &&
        shop == other.shop &&
        movie == other.movie;
  }

  @override
  int get hashCode => Object.hash(shop, movie);
}

class MovieRentingSystem {
  final SplayTreeSet<RecordPSM> rented = SplayTreeSet();
  final Set<RecordPSM> unRented = {};
  final Map<int, SplayTreeSet<RecordPS>> dbM2PS = {}; // movie -> (price, shop)
  final Map<RecordSM, int> dbSM2P = {}; // (shop, movie) -> price

  MovieRentingSystem(int n, List<List<int>> entries) {
    for (var e in entries) {
      var shop = e[0];
      var movie = e[1];
      var price = e[2];

      unRented.add(RecordPSM(price, shop, movie));
      if (!dbM2PS.containsKey(movie)) {
        dbM2PS[movie] = SplayTreeSet<RecordPS>();
      }
      dbM2PS[movie]!.add(RecordPS(price, shop));
      dbSM2P[RecordSM(shop, movie)] = price;
    }
  }

  /// Finds the cheapest 5 shops that have an unrented copy of a given movie.
  List<int> search(int movie) {
    //print(db[movie]);
    if (dbM2PS.containsKey(movie)) {
      return dbM2PS[movie]!
          .where((r) => unRented.contains(RecordPSM(r.price, r.shop, movie)))
          .take(5)
          .map((e) => e.shop)
          .toList();
    } else {
      return [];
    }
  }

  /// Rents an unrented copy of a given movie from a given shop.
  void rent(int shop, int movie) {
    final price = dbSM2P[RecordSM(shop, movie)];
    unRented.remove(RecordPSM(price!, shop, movie));
    rented.add(RecordPSM(price, shop, movie));
  }

  /// Drops off a previously rented copy of a given movie at a given shop.
  void drop(int shop, int movie) {
    final price = dbSM2P[RecordSM(shop, movie)];
    rented.remove(RecordPSM(price!, shop, movie));
    unRented.add(RecordPSM(price, shop, movie));
  }

  /// Returns the cheapest 5 rented movies (shop, movie)
  List<List<int>> report() {
    // rented/unrented (price, shop, movie)
    return rented.take(5).map((e) => [e.shop, e.movie]).toList();
  }
}
