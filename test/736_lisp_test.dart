import 'package:test/test.dart';
import 'package:leetcode/736_lisp.dart';

void main() {
  test('736 lisp #1', () async {
    var s = Solution();
    var expression = '(let x 2 (mult x (let x 3 y 4 (add x y))))';
    expect(s.evaluate(expression), equals(14));
  });
  test('736 lisp #1.1', () async {
    var s = Solution();
    var expression = '(let x -12 (mult x (let x 3 y 4 (add x y))))';
    expect(s.evaluate(expression), equals(-84));
  });

  test('736 lisp #2', () async {
    var s = Solution();
    var expression = '(let x 30 x -2 x)';
    expect(s.evaluate(expression), equals(-2));
  });
  test('736 lisp #2.1', () async {
    var s = Solution();
    var expression = '(let x 3 x 2 x)';
    expect(s.evaluate(expression), equals(2));
  });
  test('736 lisp #3', () async {
    var s = Solution();
    var expression = '(let x 1 y 2 x (add x y) (add x y))';
    expect(s.evaluate(expression), equals(5));
  });
}
