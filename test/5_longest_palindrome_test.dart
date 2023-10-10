import 'package:test/test.dart';
import 'package:leetcode/5_longest_palindrome.dart';

void main() {
  test('5 longest palindrome #1', () async {
    var s = "babad";
    var sol = Solution();
    expect(sol.longestPalindrome(s), anyOf('bab', 'aba'));
  });
  test('5 longest palindrome #2', () async {
    var s = "cbbd";
    var sol = Solution();
    expect(sol.longestPalindrome(s), equals('bb'));
  });

  test('5 longest palindrome #3', () async {
    var s = "bb";
    var sol = Solution();
    expect(sol.longestPalindrome(s), equals('bb'));
  });
}
