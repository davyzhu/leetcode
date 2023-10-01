void main() {
  var edges = List<List<int>>.empty(growable: true);
  for (var i = 0; i < 99998; i++) {
    if (i.isEven) {
      edges.add([i,i+2]);
    } else {
      edges.add([i-1,i]);
    }
  }
  edges.add([99998,99999]);
  print(edges.length);

  var nums = List<int>.empty(growable: true);
  nums.add(3);
  for (var i = 0; i < 99999; i++) {
    if (i.isEven) {
      nums.add(2);
    } else {
      nums.add(6);
    }
  }
  print(nums.length);

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
