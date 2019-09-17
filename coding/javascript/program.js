document.writeln('Hello, world!');
document.writeln(typeof 'hello');
var numb = 20;
document.writeln(numb.hasOwnProperty('number'));
if (typeof numb == 'number') {
   document.writeln('number' + ':' + numb);
};

var add = function (a, b) {
  return a + b;
};

var adding = add.function();

document.writeln(adding(4,7));
