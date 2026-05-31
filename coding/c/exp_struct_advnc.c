#include <stdio.h>

typedef struct {
  char name[50];
  int age;
  float gpa;
} Student;

int main() {

  Student s1 = {"alice", 20, 3.49};
  Student *ptr = &s1;

  printf("\n--- student s1 ---\n");
  printf("Name: %s\n", ptr->name);
  printf("this year Age: %d\n", ptr->age);
  printf("GPA: %.2f\n", ptr->gpa);

  // this will print 21
  ptr->age++;
  printf("next year age: %d\n", ptr->age);

  // another way of increaseing
  // this will print 22
  printf("next year age: %d\n", ++ptr->age);

  return 0;
}
