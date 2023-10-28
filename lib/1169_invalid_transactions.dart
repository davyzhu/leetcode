class Transaction {
  final int id;
  final String name;
  final int time;
  final int amount;
  final String city;
  final String str;
  bool isInvalid = false;
  Transaction(this.id, this.name, this.time, this.amount, this.city, this.str);
}

class Solution {
  List<String> invalidTransactions(List<String> transactions) {
    final trans = <Transaction>[];
    final transNames = <String, List<Transaction>>{};
    var i = 0;
    for (var t in transactions) {
      var s = t.split(',');
      var a = Transaction(i++, s[0], int.parse(s[1]), int.parse(s[2]), s[3], t);
      if (a.amount > 1000) {
        a.isInvalid = true;
      }
      if (!transNames.containsKey(a.name)) {
        transNames[a.name] = [a];
      } else {
        transNames[a.name]!.add(a);
      }
      trans.add(a);
    }
    for (var i = 0; i < trans.length; i++) {
      if (!trans[i].isInvalid) {
        // check all transactions with the same name
        for (var t in transNames[trans[i].name]!) {
          if (trans[i] != t) {
            if ((t.time - trans[i].time).abs() <= 60 &&
                t.city != trans[i].city) {
              trans[i].isInvalid = true;
              t.isInvalid = true;
              break;
            }
          }
        }
      }
    }
    return trans.where((t) => t.isInvalid).map((t) => t.str).toList();
  }
}
