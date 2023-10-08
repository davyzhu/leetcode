import 'dart:collection';

class AllOne {
  final List<HashSet<String>> countList = [];
  final Map<String, int> countMap = {};
  AllOne();

  void inc(String key) {
    final count = (!countMap.containsKey(key)) ? 1 : (countMap[key]! + 1);
    countMap[key] = count;
    if (countList.length < count) {
      assert(count - countList.length == 1);
      countList.add(HashSet<String>());
    }
    countList[count - 1].add(key);
    if (count >= 2) {
      countList[count - 2].remove(key);
    }
  }

  void dec(String key) {
    final count = countMap[key]!;
    if (count == 1) {
      countMap.remove(key);
      countList[0].remove(key);
    } else {
      assert(count >= 2);
      countMap[key] = count - 1;
      countList[count - 1].remove(key);
      countList[count - 2].add(key);
    }
  }

  String getMaxKey() {
    if (countMap.isNotEmpty) {
      for (var i = countList.length - 1; i >= 0; i--) {
        if (countList[i].isNotEmpty) {
          return countList[i].first;
        }
      }
      assert(false);
      return '';
    } else {
      return '';
    }
  }

  String getMinKey() {
    if (countMap.isNotEmpty) {
      for (var i = 0; i < countList.length; i++) {
        if (countList[i].isNotEmpty) {
          return countList[i].first;
        }
      }
      assert(false);
      return '';
    } else {
      return '';
    }
  }
}
