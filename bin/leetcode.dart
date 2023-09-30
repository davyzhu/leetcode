void main() {
  createCoprime();
}

void createCoprime() {
  final sw = Stopwatch()..start();
  var coprime = List<List<bool>>.empty(growable: true);
  for (var i = 1; i <= 50; i++) {
    coprime.add([]);
    for (var j = 1; j <= 50; j++) {
      if (i.gcd(j) == 1) {
        coprime[i - 1].add(true);
      } else {
        coprime[i - 1].add(false);
      }
    }
  }
  sw.stop();
  print(sw.elapsedMicroseconds);
  //print(coprime);
}

void createNotCoprime() {
  var notCoprimeSet = List<Set<int>?>.empty(growable: true);
  for (var i = 1; i <= 50; i++) {
    notCoprimeSet.add({});
    for (var j = i; j <= 50; j++) {
      if (i.gcd(j) != 1) {
        notCoprimeSet[i - 1]!.add(j);
      }
    }
  }
  print(notCoprimeSet);
}
