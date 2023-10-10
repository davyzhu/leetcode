import 'dart:collection';

class FreqStack {
  final numFreq = HashMap<int, int>(); // num -> freq
  final List<HashMap<int, List<int>>> freqNumTime = [];
  var timer = 0;
  FreqStack() {
    freqNumTime.add(HashMap());
  }

  void push(int val) {
    if (numFreq.containsKey(val)) {
      numFreq[val] = numFreq[val]! + 1;
    } else {
      numFreq[val] = 1;
    }
    if (freqNumTime.length < numFreq[val]!) {
      freqNumTime.add(HashMap());
    }
    final idx = numFreq[val]!;
    if (idx == 1) {
      freqNumTime[0][val] = [timer];
    } else {
      freqNumTime[idx - 1][val] = freqNumTime[idx - 2].remove(val)!;
      freqNumTime[idx - 1][val]!.add(timer);
    }
    timer++;
  }

  int pop() {
    var maxTime = -1;
    var maxValue = -1;
    for (var i = freqNumTime.length - 1; i >= 0; i--) {
      if (freqNumTime[i].isNotEmpty) {
        for (var e in freqNumTime[i].entries) {
          final num = e.key;
          final time = e.value;
          if (time.last > maxTime) {
            maxTime = time.last;
            maxValue = num;
          }
        }

        // change freq in numFreq
        // remove time and change freq in freqNumTime
        final freq = numFreq[maxValue]!;
        if (freq == 1) {
          numFreq.remove(maxValue);
          freqNumTime[0].remove(maxValue);
        } else {
          assert(freq >= 2);
          numFreq[maxValue] = freq - 1;
          freqNumTime[freq - 1][maxValue]!.removeLast();
          freqNumTime[freq - 2][maxValue] = freqNumTime[freq - 1].remove(maxValue)!;

        }
        return maxValue;
      }
    }
    assert(false);
    return -1;
  }
}
