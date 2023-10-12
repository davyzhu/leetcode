import 'dart:collection';

class DinnerPlates {
  final List<List<int>> stacks = [];
  final int capacity;
  final emptySet = SplayTreeSet<int>();
  final partiallyOccupiedSet = SplayTreeSet<int>();
  final fullSet = SplayTreeSet<int>();

  DinnerPlates(this.capacity);

  bool get isTotallyEmpty {
    return partiallyOccupiedSet.isEmpty && fullSet.isEmpty;
  }

  bool _isEmpty(final int index) {
    return stacks[index].isEmpty;
  }

  bool _isFull(final int index) {
    return stacks[index].length == capacity;
  }

  bool _isPartiallyOccupied(final int index) {
    final l = stacks[index].length;
    return (0 < l && l < capacity);
  }

  /// Pushes the given integer val into the leftmost stack with a size less than capacity.
  void push(int val) {
    if (emptySet.isNotEmpty && partiallyOccupiedSet.isEmpty) {
      _pushToEmptyStack(val);
    } else if (emptySet.isEmpty && partiallyOccupiedSet.isNotEmpty) {
      _pushToPartiallyOccupiedStack(val);
    } else if (emptySet.isEmpty && partiallyOccupiedSet.isEmpty) {
      _pushToNewStack(val);
    } else {
      if (emptySet.first < partiallyOccupiedSet.first) {
        _pushToEmptyStack(val);
      } else if (emptySet.first > partiallyOccupiedSet.first) {
        _pushToPartiallyOccupiedStack(val);
      } else {
        assert(false, 'error: same index cannot appear in two sets');
      }
    }
  }

  void _pushToEmptyStack(int val) {
    final f = emptySet.first;
    stacks[f].add(val);
    assert(emptySet.remove(f));
    if (_isFull(f)) {
      assert(fullSet.add(f));
    } else {
      assert(partiallyOccupiedSet.add(f));
    }
  }

  void _pushToPartiallyOccupiedStack(int val) {
    final f = partiallyOccupiedSet.first;
    stacks[f].add(val);
    if (_isFull(f)) {
      assert(partiallyOccupiedSet.remove(f));
      assert(fullSet.add(f));
    }
  }

  void _pushToNewStack(int val) {
    stacks.add([]);
    final lastIndex = stacks.length - 1;
    stacks[lastIndex].add(val);
    if (_isFull(lastIndex)) {
      assert(fullSet.add(lastIndex));
    } else {
      assert(partiallyOccupiedSet.add(lastIndex));
    }
  }

  /// Returns the value at the top of the rightmost non-empty stack and removes it from that stack,
  /// and returns -1 if all the stacks are empty.
  int pop() {
    if (partiallyOccupiedSet.isEmpty && fullSet.isNotEmpty) {
      return popAtStack(fullSet.last);
    } else if (partiallyOccupiedSet.isNotEmpty && fullSet.isEmpty) {
      return popAtStack(partiallyOccupiedSet.last);
    } else if (partiallyOccupiedSet.isEmpty && fullSet.isEmpty) {
      return -1;
    } else {
      if (partiallyOccupiedSet.last > fullSet.last) {
        return popAtStack(partiallyOccupiedSet.last);
      } else if (partiallyOccupiedSet.last < fullSet.last) {
        return popAtStack(fullSet.last);
      } else {
        assert(false, "error: same index cannot appear in two sets");
      }
    }
    assert(false, "error: can't happen");
    return 0;

  }

  /// Returns the value at the top of the stack with the given index index and removes it from that stack
  /// or returns -1 if the stack with that given index is empty.
  int popAtStack(int index) {
    if (_isFull(index)) {
      return _popFromFullStack(index);
    } else if (_isPartiallyOccupied(index)) {
      return _popFromPartialOccupiedStack(index);
    } else {
      assert(_isEmpty(index));
      return -1;
    }
  }

  int _popFromFullStack(int index) {
    int result = stacks[index].removeLast();
    assert(fullSet.remove(index));
    if (_isEmpty(index)) {
      assert(emptySet.add(index));
    } else if (_isPartiallyOccupied(index)) {
      assert(partiallyOccupiedSet.add(index));
    } else {
      assert(false, "Error: After pop, stack cannot be full");
    }
    return result;
  }

  int _popFromPartialOccupiedStack(int index) {
    int result = stacks[index].removeLast();
    if (_isEmpty(index)) {
      assert(partiallyOccupiedSet.remove(index));
      assert(emptySet.add(index));
    }
    return result;
  }
}
