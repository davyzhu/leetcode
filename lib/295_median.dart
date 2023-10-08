import 'dart:collection';

class MedianFinder {
  int lessEqualQueueLength = 0;
  int greaterQueueLength = 0;
  final lessEqualQueue = SplayTreeMap<int, int>(); // value, count
  final greaterQueue = SplayTreeMap<int, int>();
  int get totalLength {
    return lessEqualQueueLength + greaterQueueLength;
  }

  MedianFinder();

  void addNum(int num) {
    if (totalLength == 0) {
      lessEqualQueue[num] = 1;
      lessEqualQueueLength++;
    } else {
      if (lessEqualQueueLength == greaterQueueLength) {
        assert(lessEqualQueue.isNotEmpty && greaterQueue.isNotEmpty);
        if (num <= greaterQueue.firstKey()!) {
          // add num to lessEqualQueue
          if (lessEqualQueue.containsKey(num)) {
            lessEqualQueue[num] = lessEqualQueue[num]! + 1;
          } else {
            lessEqualQueue[num] = 1;
          }
        } else {
          // move largerQueue's first key to lessEqualQueue,
          var gQFirst = greaterQueue.firstKey();
          if (lessEqualQueue.containsKey(gQFirst)) {
            lessEqualQueue[gQFirst!] = lessEqualQueue[gQFirst]! + 1;
          } else {
            lessEqualQueue[gQFirst!] = 1;
          }
          if (greaterQueue[gQFirst] == 1) {
            greaterQueue.remove(gQFirst);
          } else {
            assert(greaterQueue[gQFirst]! >= 2);
            greaterQueue[gQFirst] = greaterQueue[gQFirst]! - 1;
          }
          // and add num to greaterQueue
          if (greaterQueue.containsKey(num)) {
            greaterQueue[num] = greaterQueue[num]! + 1;
          } else {
            greaterQueue[num] = 1;
          }
        }
        lessEqualQueueLength++;
      } else if (lessEqualQueueLength == (greaterQueueLength + 1)) {
        assert(lessEqualQueue.isNotEmpty);
        if (num < lessEqualQueue.lastKey()!) {
          // move lessEqualQueue's lastKey to greaterQueue
          int leQLast = lessEqualQueue.lastKey()!;
          if (lessEqualQueue[leQLast] == 1) {
            lessEqualQueue.remove(leQLast);
          } else {
            assert(lessEqualQueue[leQLast]! >= 2);
            lessEqualQueue[leQLast] = lessEqualQueue[leQLast]! - 1;
          }
          if (greaterQueue.containsKey(leQLast)) {
            greaterQueue[leQLast] = greaterQueue[leQLast]! + 1;
          } else {
            greaterQueue[leQLast] = 1;
          }
          // then add num to lessEqualQueue
          if (lessEqualQueue.containsKey(num)) {
            lessEqualQueue[num] = lessEqualQueue[num]! + 1;
          } else {
            lessEqualQueue[num] = 1;
          }
        } else {
          // add num to greaterQueue
          if (greaterQueue.containsKey(num)) {
            greaterQueue[num] = greaterQueue[num]! + 1;
          } else {
            greaterQueue[num] = 1;
          }
        }
        greaterQueueLength++;
      } else {
        assert(false,
            'lessEqualQueueLength:$lessEqualQueueLength, greaterQueueLength:$greaterQueueLength');
      }
    }
  }

  double findMedian() {
    //print('lessEqualQueue$lessEqualQueue, greaterQueue$greaterQueue');
    if (lessEqualQueueLength == (greaterQueueLength + 1)) {
      return lessEqualQueue.lastKey()!.toDouble();
    } else if (lessEqualQueueLength == greaterQueueLength) {
      return (lessEqualQueue.lastKey()! + greaterQueue.firstKey()!) / 2;
    } else {
      assert(false,
          'lessEqualQueueLength:$lessEqualQueueLength, greaterQueueLength:$greaterQueueLength');
      return 0;
    }
  }
}
