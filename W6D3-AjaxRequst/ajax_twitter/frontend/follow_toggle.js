const APIUtil = require("./api_util.js");

class FollowToggle {
  constructor(el) {
    const $el = $(el);

    this.userId = $el.data('user-id');
    this.followState = $el.data('follow-state');
    this.render($el);
    this.handleClick($el);
  }

  render(el) {
    // console.log(this.followState);
    if (this.followState === 'unfollowed') {
       el.text("Follow!");
    }else{
       el.text("Unfollow!");
    }
  }

  handleClick(button) {

    button.on("click", (e) => {
      button.prop("disabled", true);
      e.preventDefault();
      if (this.followState === 'unfollowed') {

        let that = this;
        APIUtil.followUser(that.userId)
        .then(() => {
          // console.log(data);
          that.followState = "followed";
          button.prop("disabled", false);
          that.render(button);

        });
      } else {
        let that = this;
        APIUtil.unfollowUser(that.userId)
          .then(() => {
            that.followState = "unfollowed";
            button.prop("disabled", false);
            that.render(button);
        });
      }
    });
  }
}

module.exports = FollowToggle;
