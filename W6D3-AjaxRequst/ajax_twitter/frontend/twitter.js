const FollowToggle = require("./follow_toggle.js");
const UsersSearch = require("./users_search.js");

$(() => {

  let $buttons = $("button.follow-toggle");
  $buttons.each((idx, button) => {
    new FollowToggle(button);
  });

  let $navs = $("nav.users-search");
  $navs.each((idx, nav) => {
    new UsersSearch(nav);
  });
});
