import 'package:test/test.dart';
import 'package:leetcode/509_fibonacci.dart';

void main() {
  test('509 fibonacci=0', () async {
    var s = Solution();
    expect(s.fib(0), 0);
  });
  test('509 fibonacci=1', () async {
    var s = Solution();
    expect(s.fib(1), 1);
  });
  test('509 fibonacci=2', () async {
    var s = Solution();
    expect(s.fib(2), 1);
  });
  test('509 fibonacci=3', () async {
    var s = Solution();
    expect(s.fib(3), 2);
  });
  test('509 fibonacci=4', () async {
    var s = Solution();
    expect(s.fib(4), 3);
  });
}
