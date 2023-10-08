import 'package:test/test.dart';
import 'package:leetcode/295_median.dart';

void main() {
  test('295 median #1', () async {
    var medianFinder = MedianFinder();
    medianFinder.addNum(1); // arr = [1]
    medianFinder.addNum(2); // arr = [1, 2]
    expect(medianFinder.findMedian(), 1.5); // return 1.5 (i.e., (1 + 2) / 2)
    medianFinder.addNum(3); // arr[1, 2, 3]
    expect(medianFinder.findMedian(), 2.0); // return 2.0
  });
  test('295 median 1->9', () async {
    var medianFinder = MedianFinder();
    medianFinder.addNum(1); // 1 |
    expect(medianFinder.findMedian(), 1);
    medianFinder.addNum(2); // 1 | 2
    expect(medianFinder.findMedian(), 1.5);
    medianFinder.addNum(3); // 1,2 | 3
    expect(medianFinder.findMedian(), 2.0);
    medianFinder.addNum(4); // 1,2 | 3,4
    expect(medianFinder.findMedian(), 2.5);
    medianFinder.addNum(5); // 1,2,3 | 4,5
    expect(medianFinder.findMedian(), 3);
    medianFinder.addNum(6); // 1,2,3 | 4,5,6
    expect(medianFinder.findMedian(), 3.5);
    medianFinder.addNum(7); // 1,2,3,4 | 5,6,7
    expect(medianFinder.findMedian(), 4);
    medianFinder.addNum(8); // 1,2,3,4 | 5,6,7,8
    expect(medianFinder.findMedian(), 4.5);
    medianFinder.addNum(9); // 1,2,3,4,5 | 6,7,8,9
    expect(medianFinder.findMedian(), 5);
  });

  test('295 median 9->1', () async {
    var medianFinder = MedianFinder();
    medianFinder.addNum(9); // 9 |
    expect(medianFinder.findMedian(), 9);
    medianFinder.addNum(8); // 8 | 9
    expect(medianFinder.findMedian(), 8.5);
    medianFinder.addNum(7); // 7,8 | 9
    expect(medianFinder.findMedian(), 8);
    medianFinder.addNum(6); // 6,7 | 8,9
    expect(medianFinder.findMedian(), 7.5);
    medianFinder.addNum(5); // 5,6,7 | 8,9
    expect(medianFinder.findMedian(), 7);
    medianFinder.addNum(4); // 4,5,6 | 7,8,9
    expect(medianFinder.findMedian(), 6.5);
    medianFinder.addNum(3); // 3,4,5,6 | 7,8,9
    expect(medianFinder.findMedian(), 6);
    medianFinder.addNum(2); // 2,3,4,5 | 6,7,8,9
    expect(medianFinder.findMedian(), 5.5);
    medianFinder.addNum(1); // 1,2,3,4,5 | 6,7,8,9
    expect(medianFinder.findMedian(), 5);
  });

    test('295 median 1->4,1->4', () async {
    var medianFinder = MedianFinder();
    medianFinder.addNum(1); // 1 |
    expect(medianFinder.findMedian(), 1);
    medianFinder.addNum(2); // 1 | 2
    expect(medianFinder.findMedian(), 1.5);
    medianFinder.addNum(3); // 1,2 | 3
    expect(medianFinder.findMedian(), 2.0);
    medianFinder.addNum(4); // 1,2 | 3,4
    expect(medianFinder.findMedian(), 2.5);
    medianFinder.addNum(1); // 1,1,2 | 3,4
    expect(medianFinder.findMedian(), 2);
    medianFinder.addNum(2); // 1,1,2 | 2,3,4
    expect(medianFinder.findMedian(), 2);
    medianFinder.addNum(3); // 1,1,2,2 | 3,3,4
    expect(medianFinder.findMedian(), 2);
    medianFinder.addNum(4); // 1,1,2,2 | 3,3,4,4
    expect(medianFinder.findMedian(), 2.5);
  });
}
