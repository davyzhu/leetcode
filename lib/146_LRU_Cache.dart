import 'dart:collection';

final class EntryItem extends LinkedListEntry<EntryItem> {
  final int key;
  int value;
  EntryItem(this.key, this.value);

  @override
  String toString() {
    return '$key : $value';
  }
}

class LRUCache {
  final int capacity;
  final linkedList = LinkedList<EntryItem>();
  final hashMap = HashMap<int, EntryItem>();
  LRUCache(this.capacity);

  int get(int key) {
    if (hashMap.containsKey(key)) {
      var entry = hashMap[key];
      entry!.unlink();
      linkedList.add(entry);
    }
    return hashMap[key]?.value ?? -1;
  }

  void put(int key, int value) {
    if (hashMap.containsKey(key)) {
      var entry = hashMap[key];
      entry!.value = value;
      entry.unlink();
      linkedList.add(entry);
    } else {
      if (linkedList.length == capacity) {
        var first = linkedList.first;
        first.unlink();
        hashMap.remove(first.key);
      }
      var entry = EntryItem(key, value);
      hashMap[key] = entry;
      linkedList.add(entry);
    }
  }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache obj = LRUCache(capacity);
 * int param1 = obj.get(key);
 * obj.put(key,value);
 */