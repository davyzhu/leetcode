import 'package:leetcode/122_stock_2.dart';
import 'package:test/test.dart';

void main() {
  test('122 stock 2: #1', () async {
    var s = Solution();
    var prices = [7,1,5,3,6,4];
    expect(s.maxProfit(prices), equals(7));
  });
    test('122 stock 2: #2', () async {
    var s = Solution();
    var prices = [1,2,3,4,5];
    expect(s.maxProfit(prices), equals(4));
  });
    test('122 stock 2: #3', () async {
    var s = Solution();
    var prices = [7,6,4,3,1];
    expect(s.maxProfit(prices), equals(0));
  });
}