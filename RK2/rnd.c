/* rnd.c */
#include<stdio.h>
#include<time.h>
void setrnd(){
  srand(time(NULL));
}

unsigned long get_random(){
  return rand();
}