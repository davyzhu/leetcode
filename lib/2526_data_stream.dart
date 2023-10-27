class DataStream {
  int count = 0;
  int last = -1;
  final int value;
  final int k;
  DataStream(this.value, this.k);

  bool consec(int num) {
    count++;
    if (num != value) {
      last = count;
    }
    if (count < k) {
      return false;
    } else {
      if (count - last > k - 1) {
        return true;
      } else {
        return false;
      }
    }
  }
}

/**
 * Your DataStream object will be instantiated and called as such:
 * DataStream obj = DataStream(value, k);
 * bool param1 = obj.consec(num);
 */