const APIUtil = require('./api_util.js')
class TweetCompose {
  constructor(el) {
    this.$el = $(el);
    this.submit(this.$el);
  }

  submit($el) {
    $el.on("submit", (e) => {
      const data = $el.serializeJSON();
      APIUtil.createTweet(data);
    });
  }
}
