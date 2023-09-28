import 'dart:collection';

class Tweet {
  final int userId;
  final int tweetId;

  Tweet(this.userId, this.tweetId);
}

class Twitter {
  final tweets = List<Tweet>.empty(growable: true);
  final followers = HashMap<int, Set<int>>();
  Twitter();

  void postTweet(int userId, int tweetId) {
    tweets.add(Tweet(userId, tweetId));
  }

  List<int> getNewsFeed(int userId) {
    var result = List<int>.empty(growable: true);
    for (var i = tweets.length - 1; i >= 0; i--) {
      if (userId == tweets[i].userId ||
          (followers.containsKey(userId) &&
              followers[userId]!.contains(tweets[i].userId))) {
        result.add(tweets[i].tweetId);
      }
      if (result.length == 10) {
        return result;
      }
    }
    return result;
  }

  void follow(int followerId, int followeeId) {
    if (followers.containsKey(followerId)) {
      followers[followerId]!.add(followeeId);
    } else {
      followers[followerId] = Set.of(<int>{followeeId});
    }
  }

  void unfollow(int followerId, int followeeId) {
    if (followers.containsKey(followerId)) {
      followers[followerId]!.remove(followeeId);
    }
  }
}

/**
 * Your Twitter object will be instantiated and called as such:
 * Twitter obj = Twitter();
 * obj.postTweet(userId,tweetId);
 * List<int> param2 = obj.getNewsFeed(userId);
 * obj.follow(followerId,followeeId);
 * obj.unfollow(followerId,followeeId);
 */