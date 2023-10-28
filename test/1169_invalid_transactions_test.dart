import 'package:test/test.dart';
import 'package:leetcode/1169_invalid_transactions.dart';

void main() {
  group('leetcode', () {
    test('alice same name diff city #1', () async {
      var transactions = ["alice,20,800,mtv", "alice,50,100,beijing"];
      var output = ["alice,20,800,mtv", "alice,50,100,beijing"];
      var s = Solution();
      expect(s.invalidTransactions(transactions), unorderedEquals(output));
    });
    test('alice same name diff city #2', () async {
      var transactions = [
        "alice,20,800,mtv",
        "alice,50,100,beijing",
        "alice,60,100,mtv"
      ];
      var output = [
        "alice,20,800,mtv",
        "alice,50,100,beijing",
        "alice,60,100,mtv"
      ];
      var s = Solution();
      expect(s.invalidTransactions(transactions), unorderedEquals(output));
    });
    test('alice exceed \$1000', () async {
      var transactions = ["alice,20,800,mtv", "alice,50,1200,mtv"];
      var output = ["alice,50,1200,mtv"];
      var s = Solution();
      expect(s.invalidTransactions(transactions), unorderedEquals(output));
    });

    test('bob exceed \$1000 && same name diff city', () async {
      var transactions = [
        "bob,689,1910,barcelona",
        "alex,696,122,bangkok",
        "bob,832,1726,barcelona",
        "bob,820,596,bangkok",
        "chalicefy,217,669,barcelona",
        "bob,175,221,amsterdam"
      ];
      var output = [
        "bob,689,1910,barcelona",
        "bob,832,1726,barcelona",
        "bob,820,596,bangkok"
      ];
      var s = Solution();
      expect(s.invalidTransactions(transactions), unorderedEquals(output));
    });
    test('bob exceed \$1000', () async {
      var transactions = ["alice,20,800,mtv", "bob,50,1200,mtv"];
      var output = ["bob,50,1200,mtv"];
      var s = Solution();
      expect(s.invalidTransactions(transactions), unorderedEquals(output));
    });
  });
}
