import 'dart:collection';

final class EntryItem extends LinkedListEntry<EntryItem> {
  final int key;
  int value;
  int use = 1;
  EntryItem(this.key, this.value);

  @override
  String toString() {
    return '$key : $value';
  }
}

class LFUCache {
  final int capacity;
  int length = 0; // total number of entries
  final useList =
      List<LinkedList<EntryItem>>.empty(growable: true); // indexed by use count
  final hashMap = HashMap<int, EntryItem>();
  LFUCache(this.capacity) {
    useList.add(LinkedList<EntryItem>());
    useList.add(LinkedList<EntryItem>());
  }

  void debug() {
    print(hashMap[4]);
  }

  int get(int key) {
    if (hashMap.containsKey(key)) {
      var entry = hashMap[key];

      //update use counter
      var use = entry!.use + 1;
      assert(use <= useList.length);
      if (use == useList.length) {
        useList.add(LinkedList<EntryItem>());
      }
      entry.use = use;
      entry.unlink();
      useList[use].add(entry);
      return entry.value;
    } else {
      return -1;
    }
  }

  void put(int key, int value) {
    if (hashMap.containsKey(key)) {
      var entry = hashMap[key];
      //change value
      entry!.value = value;
      //update use counter
      var use = entry.use + 1;
      assert(use <= useList.length);
      if (use == useList.length) {
        useList.add(LinkedList<EntryItem>());
      }
      entry.use = use;
      entry.unlink();
      useList[use].add(entry);
    } else {
      if (length == capacity) {
        // cache is full
        for (var i = 0; i < useList.length; i++) {
          if (useList[i].isNotEmpty) {
            var minUseEntry = useList[i].first;
            minUseEntry.unlink();
            hashMap.remove(minUseEntry.key);
            length--;
            break;
          }
        }
      }
      var entry = EntryItem(key, value);
      useList[1].add(entry);
      hashMap[key] = entry;
      length++;
    }
  }
}
