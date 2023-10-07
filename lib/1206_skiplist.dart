import 'dart:math';

// refer to <Data Structure The Fun Way> Chapter 14

const maxLevel = 5; // max allowed level

class SkipNode {
  final int height; // start from 1
  int count = 1; // duplicate count
  final int? value;
  final List<SkipNode?> next;
  SkipNode(this.height, this.value) : next = List.filled(height, null);
}

class Skiplist {
  var topLevel = 0; // current top level
  final rand = Random();
  final SkipNode front = SkipNode(maxLevel + 1, null);
  Skiplist();

  /// Returns true if the integer target exists in the Skiplist or false otherwise.
  bool search(int target) {
    final last = _getNodesLessThan(target);
    var node = last[0].next[0];
    if (node != null && node.value == target) {
      return true;
    }
    return false;
  }

  int get _randHeight {
    int height = 1;
    while (rand.nextBool() && height < (maxLevel + 1)) {
      height++;
    }
    return height;
  }

  List<SkipNode> _getNodesLessThan(final int value) {
    final result = List<SkipNode>.filled(maxLevel + 1, front);
    var node = front;
    for (var level = maxLevel; level >= 0; level--) {
      while (node.next[level] != null && node.next[level]!.value! < value) {
        node = node.next[level]!;
      }
      result[level] = node;
    }
    return result;
  }

  /// You can add duplicate num.
  void add(int num) {
    var last = _getNodesLessThan(num);
    var next0 = last[0].next[0];
    if (next0 != null && next0.value == num) {
      next0.count++;
      return;
    }
    var newNode = SkipNode(_randHeight, num);
    for (var level = 0; level < newNode.height; level++) {
      newNode.next[level] = last[level].next[level]; // TODO: level is 6, range is [0..5]
      last[level].next[level] = newNode;
    }
  }

  /// Removes the value num from the Skiplist and returns true.
  /// If num does not exist in the Skiplist, do nothing and return false.
  /// If there exist multiple num values, removing any one of them is fine.
  bool erase(int num) {
    var last = _getNodesLessThan(num);
    var next0 = last[0].next[0];
    if (next0 != null && next0.value == num) {
      if (next0.count >= 2) {
        next0.count--;
      } else if (next0.count == 1) {
        // remove node
        for (var level = 0; level < next0.height; level++) {
          last[level].next[level] = next0.next[level];
        }
      } else {
        assert(false, "SkipNode.count should larger than 0");
      }
      return true;
    }

    return false;
  }
}
