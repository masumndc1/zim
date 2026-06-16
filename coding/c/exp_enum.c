#include <stdio.h>

/* description:
In C, an enum (short for enumeration) is a user-defined data
type used to assign human-readable names to integer constants.
Instead of using vague numbers throughout your code, you use
descriptive names, making your code significantly easier to
read, maintain, and debug.
*/

// 1. Define the enum type
enum Level {
  LOW,    // Assigned 0 automatically
  MEDIUM, // Assigned 1 automatically
  HIGH    // Assigned 2 automatically
};

enum Points {
  A = 10,
  B, // Automatically becomes 11 (10 + 1)
  C = 50,
  D // Automatically becomes 51 (50 + 1)
};

// using typedef
// Status is now a shortcut name
// no need to put enum infront of the var
typedef enum { SUCCESS, FAILURE, PENDING } Status;

int main() {
  // 2. Declare an enum variable
  enum Level myVar = MEDIUM;
  enum Points mypoint = A;

  // no need to put enum before the variable name
  // as we have defined it as typedef
  Status success = SUCCESS;

  // 3. Use it in your code
  if (myVar == MEDIUM) {
    printf("The level is medium.\n");
  }

  // Printing an enum displays its underlying integer value
  printf("Integer value: %d\n", myVar);   // Outputs 1
  printf("mypoint: %d\n", mypoint);       // Outputs 10
  printf("success value: %d\n", success); // Outputs 0

  return 0;
}

/* a practical example
#include <stdio.h>

    typedef enum {
      STATE_IDLE,
      STATE_PROCESSING,
      STATE_COMPLETED
    } AsmState;

void checkSystemState(AsmState current) {
  switch (current) {
  case STATE_IDLE:
    printf("System is waiting.\n");
    break;
  case STATE_PROCESSING:
    printf("System is working.\n");
    break;
  case STATE_COMPLETED:
    printf("System finished!\n");
    break;
  }
}
*/
