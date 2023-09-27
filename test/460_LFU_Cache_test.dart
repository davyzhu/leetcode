import 'package:leetcode/460_LFU_Cache.dart';
import 'package:test/test.dart';

void main() {
  test('#1', () {
    // cnt(x) = the use counter for key x
    // cache=[] will show the last used order for tiebreakers (leftmost element is  most recent)
    LFUCache lfu = LFUCache(2);
    lfu.put(1, 1); // cache=[1,_], cnt(1)=1
    lfu.put(2, 2); // cache=[2,1], cnt(2)=1, cnt(1)=1
    expect(lfu.get(1), equals(1)); // return 1
    // cache=[1,2], cnt(2)=1, cnt(1)=2
    lfu.put(3,
        3); // 2 is the LFU key because cnt(2)=1 is the smallest, invalidate 2.
    // cache=[3,1], cnt(3)=1, cnt(1)=2
    expect(lfu.get(2), equals(-1)); // return -1 (not found)
    expect(lfu.get(3), equals(3)); // return 3
    // cache=[3,1], cnt(3)=2, cnt(1)=2
    lfu.put(
        4, 4); // Both 1 and 3 have the same cnt, but 1 is LRU, invalidate 1.
    // cache=[4,3], cnt(4)=1, cnt(3)=2
    expect(lfu.get(1), equals(-1)); // return -1 (not found)
    expect(lfu.get(3), equals(3)); // return 3
    // cache=[3,4], cnt(4)=1, cnt(3)=3
    expect(lfu.get(4), equals(4)); // return 4
    // cache=[4,3], cnt(4)=2, cnt(3)=3
  });

  test('#2', () {
    LFUCache lfu = LFUCache(3);
    lfu.put(2, 2);
    lfu.put(1, 1);
    expect(lfu.get(2), equals(2));
    expect(lfu.get(1), equals(1));
    expect(lfu.get(2), equals(2));
    lfu.put(3, 3);
    lfu.put(4, 4);
    expect(lfu.get(3), equals(-1));
    expect(lfu.get(2), equals(2));
    expect(lfu.get(1), equals(1));
    expect(lfu.get(4), equals(4));
  });
  test('#3', () {
    LFUCache lfu = LFUCache(10);
    lfu.put(10, 13);
    lfu.put(3, 17);
    lfu.put(6, 11);
    lfu.put(10, 5);
    lfu.put(9, 10);
    expect(lfu.get(13), equals(-1));
    lfu.put(2, 19);
    expect(lfu.get(2), equals(19));
    expect(lfu.get(3), equals(17));
    lfu.put(5, 25);
    expect(lfu.get(8), equals(-1));
    lfu.put(9, 22);
    lfu.put(5, 5);
    lfu.put(1, 30);
    expect(lfu.get(11), equals(-1));
    lfu.put(9, 12);
    expect(lfu.get(7), equals(-1));
    expect(lfu.get(5), equals(5));
    expect(lfu.get(8), equals(-1));
    expect(lfu.get(9), equals(12));
    lfu.put(4, 30);
    lfu.put(9, 3);
    expect(lfu.get(9), equals(3));
    expect(lfu.get(10), equals(5));
    expect(lfu.get(10), equals(5));
    lfu.put(6, 14);
    lfu.put(3, 1);
    expect(lfu.get(3), equals(1));
    lfu.put(10, 11);
    expect(lfu.get(8), equals(-1));
    lfu.put(2, 14);
    expect(lfu.get(1), equals(30));
    expect(lfu.get(5), equals(5));
    expect(lfu.get(4), equals(30));
    lfu.put(11, 4);
    lfu.put(12, 24);
    lfu.put(5, 18);
    expect(lfu.get(13), equals(-1));
    lfu.put(7, 23);
    expect(lfu.get(8), equals(-1));
    expect(lfu.get(12), equals(24));
    lfu.put(3, 27);
    lfu.put(2, 12);
    expect(lfu.get(5), equals(18));
    lfu.put(2, 9);
    lfu.put(13, 4);
    lfu.put(8, 18);
    lfu.put(1, 7);
    expect(lfu.get(6), equals(14));
    lfu.put(9, 29);
    lfu.put(8, 21);
    expect(lfu.get(5), equals(18));
    lfu.put(6, 30);
    lfu.put(1, 12);
    expect(lfu.get(10), equals(11));
    lfu.put(4, 15);
    lfu.put(7, 22);
    lfu.put(11, 26);
    lfu.put(8, 17);
    lfu.put(9, 29);
    expect(lfu.get(5), equals(18));
    lfu.put(3, 4);
    lfu.put(11, 30);
    expect(lfu.get(12), equals(-1));
    // last put 4
    lfu.put(4, 29);
    expect(lfu.get(3), equals(4));
    expect(lfu.get(9), equals(29));
    expect(lfu.get(6), equals(30));
    lfu.put(3, 4);
    expect(lfu.get(1), equals(12));
    expect(lfu.get(10), equals(11));
    lfu.put(3, 29);
    lfu.put(10, 28);
    lfu.put(1, 20);
    lfu.put(11, 13);
    expect(lfu.get(3), equals(29));
    lfu.put(3, 12);
    lfu.put(3, 8);
    lfu.put(10, 9);
    lfu.put(3, 26);
    expect(lfu.get(8), equals(17));
    expect(lfu.get(7), equals(-1));
    expect(lfu.get(5), equals(18));
    lfu.put(13, 17);
    lfu.put(2, 27);
    lfu.put(11, 15);
    expect(lfu.get(12), equals(-1));
    lfu.put(9, 19);
    lfu.put(2, 15);
    lfu.put(3, 16);
    expect(lfu.get(1), equals(20));
    lfu.put(12, 17);
    lfu.put(9, 1);
    lfu.put(6, 19);
    //bug
    expect(lfu.get(4), equals(29));
    expect(lfu.get(5), equals(18));
    expect(lfu.get(5), equals(18));
    lfu.put(8, 1);
    lfu.put(11, 7);
    lfu.put(5, 2);
    lfu.put(9, 28);
    expect(lfu.get(1), equals(20));
    lfu.put(2, 2);
    lfu.put(7, 4);
    lfu.put(4, 22);
    lfu.put(7, 24);
    lfu.put(9, 26);
    lfu.put(13, 28);
    lfu.put(11, 26);
  });
}
