import 'dart:collection';

class TextEditor {
  final leftQueue = Queue<StringBuffer>();
  final rightQueue = Queue<StringBuffer>();

  TextEditor();

  /// Appends text to where the cursor is.
  /// cursor ends to the right of text.
  void addText(String text) {
    leftQueue.addAll(text.split('').map((e) => StringBuffer(e)));
  }

  /// Deletes k characters to the left of the cursor.
  /// Returns the number of characters actually deleted.
  int deleteText(int k) {
    int removeCount = 0;
    while (leftQueue.isNotEmpty) {
      leftQueue.removeLast();
      removeCount++;
      if (removeCount == k) {
        break;
      }
    }
    return removeCount;
  }

  /// Moves the cursor to the left k times.
  /// Returns the last min(10, len) characters to the left of the cursor,
  /// where len is the number of characters to the left of the cursor.
  String cursorLeft(int k) {
    int moveCount = 0;
    while (leftQueue.isNotEmpty) {
      var e = leftQueue.removeLast();
      rightQueue.addFirst(e);
      moveCount++;
      if (moveCount == k) {
        break;
      }
    }
    if (leftQueue.length <= 10) {
      return leftQueue.join();
    } else {
      return leftQueue.skip(leftQueue.length - 10).join();
    }
  }

  /// Moves the cursor to the right k times.
  /// Returns the last min(10, len) characters to the left of the cursor,
  /// where len is the number of characters to the left of the cursor.
  String cursorRight(int k) {
    int moveCount = 0;
    while (rightQueue.isNotEmpty) {
      var e = rightQueue.removeFirst();
      leftQueue.addLast(e);
      moveCount++;
      if (moveCount == k) {
        break;
      }
    }
    if (leftQueue.length <= 10) {
      return leftQueue.join();
    } else {
      return leftQueue.skip(leftQueue.length - 10).join();
    }
  }
}
