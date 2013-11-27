#include <stdio.h>
#define FOO 1
#define IS_ZERO(n) (n == 0)

int main(){
  printf("FOO is %i\n", FOO);
  if(IS_ZERO(0)) {
    printf("This code is very useful.\n");
  }
}
