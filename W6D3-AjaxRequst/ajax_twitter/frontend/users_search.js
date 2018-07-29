const APIUtil = require('./api_util.js');

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.input = this.$el.find("input");
    this.ul = this.$el.find("ul");
    // debugger;
    this.handleInput($(el));
  }

  handleInput(el) {
    el.on("input", (e) => {
      let $inputVal = this.input.val();
      console.log($inputVal);
      let that = this;
      APIUtil.searchUsers($inputVal).then((result) => this.renderResults(result));
    });
  }

   renderResults(users){
     console.log(users);
     this.ul.empty();
     for (let i = 0; i < users.length; i++) {
       const li = $("<li></li>");
       const a = $('<a></a>');
       a.text(users[i].username);
       li.append(a);
       this.ul.append(li);
     }
   }
}



module.exports = UsersSearch;
