import 'package:leetcode/121_stock.dart';
import 'package:test/test.dart';

void main() {
  test('stock #1', () async {
    var s = Solution();
    var prices = [7, 1, 5, 3, 6, 4];
    expect(s.maxProfit(prices), equals(5));
  });
  test('stock #2', () async {
    var s = Solution();
    var prices = [7, 6, 4, 3, 1];
    expect(s.maxProfit(prices), equals(0));
  });
}
