/**
 *
 */

visitCount();

function visitCount() {
  fetch("/shop/visitCounter").catch((error) => console.log(error));
}
