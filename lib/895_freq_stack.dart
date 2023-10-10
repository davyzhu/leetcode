import 'dart:collection';
// 1st version: time=3376ms
// 2nd version: time=484ms
class FreqTime implements Comparable<FreqTime> {
  final int val;
  List<int> timeStack = [];

  FreqTime(this.val);

  void pushTimer(int timer) {
    timeStack.add(timer);
  }

  void popTimer() {
    timeStack.removeLast();
  }

  int get freq {
    return timeStack.length;
  }

  @override
  int compareTo(other) {
    if (freq > other.freq) {
      return -1;
    } else if (freq < other.freq) {
      return 1;
    } else {
      if (timeStack.last > other.timeStack.last) {
        return -1;
      } else if (timeStack.last < other.timeStack.last) {
        return 1;
      } else {
        return 0;
      }
    }
  }

  @override
  String toString() {
    return 'val[$val], time$timeStack';
  }
}

class FreqStack {
  final valFreqMap = HashMap<int, FreqTime>(); // val -> FreqTime
  final freqTimeSet = SplayTreeSet<FreqTime>();
  var timer = 0;
  FreqStack();

  void push(int val) {
    if (valFreqMap.containsKey(val)) {
      var t = valFreqMap[val]!;
      freqTimeSet.remove(t);
      t.pushTimer(timer);
      freqTimeSet.add(t);
    } else {
      var t = FreqTime(val);
      t.pushTimer(timer);
      valFreqMap[val] = t;
      freqTimeSet.add(t);
    }
    timer++;
  }

  int pop() {
    var result = freqTimeSet.first;
    if (result.freq == 1) {
      valFreqMap.remove(result.val);
      freqTimeSet.remove(result);
    } else {
      freqTimeSet.remove(result);
      result.popTimer();
      freqTimeSet.add(result);
    }
    return result.val;
  }
}
