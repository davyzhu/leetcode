import 'package:leetcode/32_parentheses.dart';
import 'package:test/test.dart';

void main() {
  test('', () {
    var sol = Solution();
    var s = '';
    expect(sol.longestValidParentheses(s), equals(0));
  });
  test('(', () {
    var sol = Solution();
    var s = '(';
    expect(sol.longestValidParentheses(s), equals(0));
  });
  test(')', () {
    var sol = Solution();
    var s = ')';
    expect(sol.longestValidParentheses(s), equals(0));
  });
  test('()', () {
    var sol = Solution();
    var s = '()';
    expect(sol.longestValidParentheses(s), equals(2));
  });
  test('(()', () {
    var sol = Solution();
    var s = '(()';
    expect(sol.longestValidParentheses(s), equals(2));
  });
  test('()(', () {
    var sol = Solution();
    var s = '()(';
    expect(sol.longestValidParentheses(s), equals(2));
  });
  test(')()', () {
    var sol = Solution();
    var s = ')()';
    expect(sol.longestValidParentheses(s), equals(2));
  });
  test('())', () {
    var sol = Solution();
    var s = '())';
    expect(sol.longestValidParentheses(s), equals(2));
  });
  test('()()', () {
    var sol = Solution();
    var s = '()()';
    expect(sol.longestValidParentheses(s), equals(4));
  });
  test('())()', () {
    var sol = Solution();
    var s = '())()';
    expect(sol.longestValidParentheses(s), equals(2));
  });
  test('()(()', () {
    var sol = Solution();
    var s = '()(()';
    expect(sol.longestValidParentheses(s), equals(2));
  });
  test(')()())', () {
    var sol = Solution();
    var s = ')()())';
    expect(sol.longestValidParentheses(s), equals(4));
  });
  test('(()()(', () {
    var sol = Solution();
    var s = '(()()(';
    expect(sol.longestValidParentheses(s), equals(4));
  });
  test('(())', () {
    var sol = Solution();
    var s = '(())';
    expect(sol.longestValidParentheses(s), equals(4));
  });
  test('(())', () {
    var sol = Solution();
    var s = '(())';
    expect(sol.longestValidParentheses(s), equals(4));
  });
  test('((())', () {
    var sol = Solution();
    var s = '((())';
    expect(sol.longestValidParentheses(s), equals(4));
  });
  test('(()))', () {
    var sol = Solution();
    var s = '(()))';
    expect(sol.longestValidParentheses(s), equals(4));
  });
    test('(())(())', () {
    var sol = Solution();
    var s = '(())(())';
    expect(sol.longestValidParentheses(s), equals(8));
  });
}
