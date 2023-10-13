import 'package:leetcode/140_word_break_2.dart';
import 'package:test/test.dart';

void main() {
  test('140 word break 2 #1', () async {
    var s = "catsanddog";
    var wordDict = ["cat", "cats", "and", "sand", "dog"];
    var sol = Solution();
    var result = ["cats and dog", "cat sand dog"];
    expect(sol.wordBreak(s, wordDict), unorderedEquals(result));
  });

  test('140 word break 2 #2', () async {
    var s = "pineapplepenapple";
    var wordDict = ["apple", "pen", "applepen", "pine", "pineapple"];
    var sol = Solution();
    var result = [
      "pine apple pen apple",
      "pineapple pen apple",
      "pine applepen apple"
    ];
    expect(sol.wordBreak(s, wordDict), unorderedEquals(result));
  });

  test('140 word break 2 #3', () async {
    var s = "catsandog";
    var wordDict = ["cats", "dog", "sand", "and", "cat"];
    var sol = Solution();
    var result = [];
    expect(sol.wordBreak(s, wordDict), unorderedEquals(result));
  });
}
