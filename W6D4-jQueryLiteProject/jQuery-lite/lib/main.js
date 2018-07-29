const DOMNodeCollection = require("./dom_node_collection.js");

const $l = function($el) {
  if (typeof $el === "string") {
    let nodeList = document.querySelectorAll($el);
    return new DOMNodeCollection(Array.from(nodeList));
  }else if ($el instanceof HTMLElement) {
    return new DOMNodeCollection([$el]);
  }
};

window.$l = $l;
