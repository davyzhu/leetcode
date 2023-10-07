import 'package:test/test.dart';
import 'package:leetcode/1206_skiplist.dart';

void main() {
  test('1206 skiplist #1', () async {
    
    Skiplist skiplist = Skiplist();
    skiplist.add(1);
    skiplist.add(2);
    skiplist.add(3);
    expect(skiplist.search(0), false);
    skiplist.add(4);
    expect(skiplist.search(1), true);
    expect(skiplist.erase(0), false);
    expect(skiplist.erase(1), true);
    expect(skiplist.search(1), false);
  });

  test('1206 skiplist #2', () async {
    Skiplist skiplist = Skiplist();
    skiplist.add(1);
    skiplist.add(2);
    skiplist.add(3);
    expect(skiplist.search(0), false);
    skiplist.add(4);
    expect(skiplist.search(1), true);
    skiplist.add(5);
    expect(skiplist.search(3), true);
    expect(skiplist.search(6), false);
  });

  test('1206 skiplist duplicate', () async {
    Skiplist skiplist = Skiplist();
    expect(skiplist.search(1), false);
    skiplist.add(1);
    expect(skiplist.search(1), true);
    skiplist.add(1);
    expect(skiplist.search(1), true);
    expect(skiplist.erase(1), true);
    expect(skiplist.search(1), true);
    expect(skiplist.erase(1), true);
    expect(skiplist.search(1), false);
    expect(skiplist.erase(1), false);
  });
}
