#include <stdio.h>

/* explanation:
This code creates a custom, reusable data container named Arg that can
hold either a whole number, a positive whole number, a decimal number,
or a memory address—but only one of them at any given time.Think of
it like a single storage locker that is exactly the right size to
hold a bicycle, a surfboard, or a set of golf clubs.
You can put any one of those items inside, but you cannot fit all of
them in there at the same time.
*/

/* difference between struct vs union
In a struct: Every member gets its own separate room. If you have four
items, the struct is large enough to hold all four items simultaneously.

In a union: All members share the same room. The union is only as large
as its single largest item. Writing data to one variable overwrites
whatever was stored in the others.
*/

/* example
union: This keyword tells C that all the variables listed inside the
curly braces {} will share the exact same memory location.

Arg: This is the new name (alias) given to this union, thanks to the
typedef keyword. Instead of typing union Arg every time you want to
use it, you can just type Arg.
*/

typedef union {
  int i;           // Can store a standard integer (e.g., -5 or 42)
  unsigned int ui; // Can store a positive-only integer (e.g., 0 or 3000)
  float f;         // Can store a decimal number (e.g., 3.14)
  const void *v;   // Can store a memory address pointing to any type of data
} Arg;

#include <stdio.h>

int main() {
  Arg my_argument; // Create a variable named my_argument

  // 1. Store an integer
  my_argument.i = -10;
  printf("Integer: %d\n", my_argument.i); // Works perfectly!

  // 2. Store a float (This completely wipes out the integer -10)
  my_argument.f = 5.75;
  printf("Float: %f\n", my_argument.f); // Works perfectly!

  // CRITICAL WARNING:
  // If you try to read 'i' now, you will get complete gibberish!
  // The computer is trying to read the decimal or float 5.75 as a whole number.
  printf("Corrupted Integer: %d\n", my_argument.i);

  return 0;
}

/* output was
Integer: -10
Float: 5.750000
Corrupted Integer: 1085800448
*/
