import 'package:test/test.dart';
import 'package:leetcode/2526_data_stream.dart';

void main() {
  test('2526 #1', () async {
    var value = 4, k = 3 ;
    var dataStream = DataStream(value, k);
    expect(dataStream.consec(4), false);
    expect(dataStream.consec(4), false);
    expect(dataStream.consec(4), true);
    expect(dataStream.consec(3), false);
  });
}