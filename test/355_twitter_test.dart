import 'package:leetcode/355_twitter.dart';
import 'package:test/test.dart';

void main() {
  test('#1', () async {
    var twitter = Twitter();
    twitter.postTweet(1, 5);
    expect(twitter.getNewsFeed(1), equals([5]));
    twitter.follow(1, 2);
    twitter.postTweet(2, 6);
    expect(twitter.getNewsFeed(1), equals([6, 5]));
    twitter.unfollow(1, 2);
    expect(twitter.getNewsFeed(1), equals([5]));
  });

  test('#2', () async {
    var twitter = Twitter();
    twitter.postTweet(1, 4);
    twitter.postTweet(2, 5);
    twitter.unfollow(1, 2);
    expect(twitter.getNewsFeed(1), equals([4]));
  });
}
