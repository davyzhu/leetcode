const int maxPrefixLength = 7;
const int maxSuffixLength = 7;

class TrieNode {
  final children = List<TrieNode?>.filled(27, null);
  final wordIds = List<int?>.filled(27, null);
}

class WordFilter {
  final trie = TrieNode();
  WordFilter(List<String> words) {
    // "abcd" => "abcd{abcd","bcd{abcd","cd{abcd","d{abcd"
    for (var id = 0; id < words.length; id++) {
      var w = words[id];
      var w2 = '$w{$w';
      for (var j = 0; j < w.length; j++) {
        var sp = w2.substring(j); //sp is Suffix Prefix
        addTrie(sp, id);
      }
    }
  }

  void addTrie(String sp, int id) {
    var currTrie = trie;
    bool isPrefix = false;
    for (var i = 0; i < sp.length; i++) {
      var cid = charIndex(sp[i]);
      if (currTrie.children[cid] == null) {
        currTrie.children[cid] = TrieNode();
      }
      if (isPrefix) {
        if (currTrie.wordIds[cid] == null) {
          currTrie.wordIds[cid] = id;
        } else {
          if (id > currTrie.wordIds[cid]!) {
            currTrie.wordIds[cid] = id;
          }
        }
      }
      if (sp[i] == '{') {
        isPrefix = true;
      }
      currTrie = currTrie.children[cid]!;
    }
  }

  int f(String pref, String suff) {
    var sp = '$suff{$pref';
    var currTrie = trie;
    for (var i = 0; i < sp.length; i++) {
      var cid = charIndex(sp[i]);
      if (i == sp.length - 1 && currTrie.wordIds[cid] != null) {
        return currTrie.wordIds[cid]!;
      }

      if (currTrie.children[cid] == null) {
        return -1;
      } else {
        currTrie = currTrie.children[cid]!;
      }
    }
    return -1;
  }
}

int charIndex(String c) {
  assert(c.length == 1);
  return c.codeUnits[0] - 'a'.codeUnits[0];
}
