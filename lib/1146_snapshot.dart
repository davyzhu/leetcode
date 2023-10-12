import 'dart:collection';

class SnapshotArray {
  final stack = [HashMap<int, int>()];
  var snapCount = 0;
  final int length;

  /// initializes an array-like data structure with the given length.
  /// Initially, each element equals 0.
  SnapshotArray(this.length);

  void set(int index, int val) {
    stack.last[index] = val;
  }

  /// takes a snapshot of the array
  /// and returns the snap_id: the total number of times we called snap() minus 1
  int snap() {
    stack.add(HashMap());
    return snapCount++;
  }

  /// returns the value at the given index,
  /// at the time we took the snapshot with the given snap_id
  int get(int index, int snap_id) {
    for (var i = snap_id; i >= 0; i--) {
      if (stack[i].containsKey(index)) {
        return stack[i][index]!;
      }
    }
    return 0;
  }
}
