#include <stdio.h>
#include <stdlib.h>

/* a way
typedef struct tnode tnode;

struct tnode {
  int count;
  tnode *left;  // Valid shorthand
  tnode *right; // Valid shorthand
};
Clean finish. No variable name here.
*/

// this is another way
// i liked this way
typedef struct tnode {
  int count;
  struct tnode *left;
  struct tnode *right;
} tnode;
// Here, 'tnode' defines the TYPE alias, not a variable.

int main() {
  // 2. Create the root node pointer using our clean 'tnode' type alias
  tnode *root = (tnode *)malloc(sizeof(tnode));
  if (root == NULL)
    return 1; // Safety check in case memory is full

  root->count = 10;
  root->right = NULL; // No right child yet

  // 3. Create the left child node pointer
  root->left = (tnode *)malloc(sizeof(tnode));
  if (root->left == NULL)
    return 1;

  // 4. Assign a value to the left child's count
  root->left->count = 5;
  root->left->left = NULL;
  root->left->right = NULL;

  // 5. Print the values to verify it works!
  printf("Root count: %d\n", root->count);
  printf("Left child count (root->left->count): %d\n", root->left->count);

  // 6. Free allocated memory in reverse order
  free(root->left);
  free(root);

  return 0;
}
