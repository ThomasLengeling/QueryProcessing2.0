import twitter4j.conf.*;
import twitter4j.api.*;
import twitter4j.*;

import java.util.*;

ConfigurationBuilder   cb;
Query query;
Twitter twitter;


void setup() {
  size(100, 100);
  background(0);

  //Acreditacion
  cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("");
  cb.setOAuthConsumerSecret("");
  cb.setOAuthAccessToken("");
  cb.setOAuthAccessTokenSecret("");

  //Make the twitter object and prepare the query
  twitter = new TwitterFactory(cb.build()).getInstance();

  queryTwitter();
}

void draw() {
  if (frameCount % 10 == 0) {
    queryTwitter();
  }
}

void queryTwitter() {
  //BUSCAR NUEVO TWITTER
  query = new Query("#processing");
  query.setCount(10);
  try {
    QueryResult result = twitter.search(query);
    List<Status> tweets = result.getTweets();
    println("New Tweet : ");
    for (Status tw : tweets) {
      String msg = tw.getText();
      println("tweet : " + msg);
    }
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  }
}

