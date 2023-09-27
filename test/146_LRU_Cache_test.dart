import 'package:leetcode/146_LRU_Cache.dart';
import 'package:test/test.dart';

void main() {
  test('lRUCache', () {
    var lRUCache = LRUCache(2);
    lRUCache.put(1, 1); // cache is {1=1}
    lRUCache.put(2, 2); // cache is {1=1, 2=2}
    expect(lRUCache.get(1), equals(1)); // return 1
    lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
    expect(lRUCache.get(2), equals(-1)); // returns -1 (not found)
    lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
    expect(lRUCache.get(1), equals(-1)); // return -1 (not found)
    expect(lRUCache.get(3), equals(3)); // return 3
    expect(lRUCache.get(4), equals(4)); // return 4
  });
}
