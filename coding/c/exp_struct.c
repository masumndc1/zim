#include <stdio.h>
#include <string.h>

// 1. Defining the struct blueprint
struct Student {
  char name[50];
  int age;
  float gpa;
};

struct tnode {
  int count;
  struct tnode *left;
  struct tnode *right;
};

/*
int count;
This holds the actual data or metadata for this specific node
(e.g., how many times a certain word or number has been seen).
struct tnode *left;
This is a pointer storing the memory address of the left child node.
struct tnode *right;
This is a pointer storing the memory address of the right child node.
*/

int main() {
  // 2. Declaring a struct variable
  struct Student s1;

  // 3. Assigning values to members
  strcpy(s1.name, "Alice"); // Using strcpy for string arrays
  s1.age = 20;
  s1.gpa = 3.85;

  // 4. Accessing values using the dot (.) operator

  printf("\n--- student s1 --- \n");
  printf("Name: %s\n", s1.name);
  printf("Age: %d\n", s1.age);
  printf("GPA: %.2f\n", s1.gpa);

  // another way of initizing
  struct Student s2 = {"Bob", 21, 3.5};

  printf("\n--- student s2 --- \n");
  printf("Name: %s\n", s2.name);
  printf("Age: %d\n", s2.age);
  printf("GPA: %.2f\n", s2.gpa);

  // c99 way of initizing
  struct Student s3 = {.gpa = 3.9, .name = "Charlie", .age = 22};

  printf("\n--- student s3 --- \n");
  printf("Name: %s\n", s3.name);
  printf("Age: %d\n", s3.age);
  printf("GPA: %.2f\n", s3.gpa);

  // couple of way of creating instace of tnode
  // regular variable (accessed with a dot: root.count)
  // struct tnode root;

  // because this is a tree structure,
  // you will almost always create a pointer to a node instead:
  // a pointer to the top of your tree
  struct tnode *root = NULL;

  // update the count of the left child using the root pointer
  root->left->count = 5;
  printf("%d", root->left->count);

  return 0;
}
