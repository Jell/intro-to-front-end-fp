"hello";

a = "hello";

a;

if (true) {
  "hello";
} else {
  "goodbye";
}

function inc(x) { return x + 1; }
inc = function (x) { return x + 1; };
inc = (x) => {return x + 1;};
inc = (x) => x + 1;

inc(5);
inc(6);
inc;


1 + 1;

var add = (x, y) => x + y;

add(4, 5);



var applyOneOne = (f) => f(1,1);

applyOneOne(add);


var apply = (f, x, y) => f(x, y);

apply(add, 2, 3);


var makeIncrementer = (n) => (m) => m + n;

var add6 = makeIncrementer(6);

add6(4);


var partial = (f, ...args) => (...more) => f(...args, ...more);

var add1 = partial(add, 1);
add1(2);

var useless = partial(add, 1, 2);
useless();

var addbis = partial(add);

addbis(1,2);



[1,2,3].map(inc);

var map = (fn, things) => {
  var mapped = [];
  things.forEach((element) => mapped.push(fn(element)));
  return mapped;
};

map(inc, [1,2,3]);

[1,2,3].map(inc);

Array.prototype.map.call([1,2,3], inc);

var isEven = (n) => (n % 2) == 0;
var isOdd = (n) => !isEven(n);

var filter = (predicate, things) => {
  var filtered = [];
  things.forEach((element) => {
    if (predicate(element)) {
      filtered.push(element);
    }});
  return filtered;
};

filter(isEven, [1,2,3,4]);

var reduce = (fn, start, things) => {
  var result = start;
  things.forEach((element) => {
    result = fn(result, element);
  });
  return result;
};

reduce(add, 0, [1, 2, 3]);

var addElement = (things, element) =>
    Array.prototype.concat.call(things, element);

var mapBis = (fn, things) =>
    reduce(
      (result, element) => addElement(result, fn(element)),
      [],
      things
    );

mapBis(inc, [1,2,3]);





// Ad-hoc polymorphism
function Cow (spotted) { this.spotted = spotted; };
Cow.prototype.type = Cow;

function Duck (daffy) { this.daffy = daffy; };
Duck.prototype.type = Duck;

var talk = (x) => talk[x.type](x);

talk[Cow] = (cow) => "Muuu";
talk[Duck] = (duck) => duck.daffy ? "What's up?" : "Quack Quack";

// subtyping
class Animal {
  constructor () {}
  alive () { return true; }
  canFly () { return false; }
}

class Bird extends Animal {
  canFly () { return true; }
}

class Ostrich extends Bird {
  canFly () { return false; }
}

class Duck extends Bird {
  constructor (daffy) { super().daffy = daffy; }
  canFly () { return !this.daffy;}
}
