class Solution {
  final List<String> results = [];
  late final String s;
  late final List<String> wordDict;
  List<String> wordBreak(String s, List<String> wordDict) {
    this.s = s;
    this.wordDict = wordDict;
    breakFirst([], 0);
    return results;
  }

  void breakFirst(List<String> result, int start) {
    for (var w in wordDict) {
      if (s.startsWith(w, start)) {
        result.add(w);

        if (start + w.length == s.length) {
          results.add(result.join(' '));
        } else {
          breakFirst(result, start + w.length);
        }

        assert(result.removeLast() == w);
      }
    }
  }
}
