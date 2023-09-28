import 'dart:collection';

class TimeMap {
  final map = SplayTreeMap<int, int>();
  void add(int time) {
    if (map.containsKey(time)) {
      map[time] = map[time]! + 1;
    } else {
      map[time] = 1;
    }
  }

  int operator [](int time) {
    if (map.containsKey(time)) {
      return map[time]!;
    } else {
      var key = map.lastKeyBefore(time);
      if (key != null) {
        return map[key]!;
      } else {
        return 0;
      }
    }
  }

  void sum() {
    var total = 0;
    for (var key in map.keys) {
      final v = map[key]! + total;
      map[key] = v;
      total = v;
    }
  }
}

class Solution {
  List<int> fullBloomFlowers(
      final List<List<int>> flowers, final List<int> people) {
    // initialize
    var startMap = TimeMap();
    var endMap = TimeMap();
    var fullBloomCounts = List<int>.empty(growable: true);

    for (var f in flowers) {
      var (start, end) = (f[0], f[1]);
      startMap.add(start);
      endMap.add(end + 1);
    }
    startMap.sum();
    endMap.sum();

    print(startMap);
    print(endMap);
    for (var p in people) {
      fullBloomCounts.add(startMap[p] - endMap[p]);
    }
    return fullBloomCounts;
  }
}
