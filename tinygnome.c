/*
Tinygnome

This is code for Gnomesort, to sort an array of integers in-place.

The body of the sort is only 67 characters long. It assumes that integer
addition is commutative even with overflow (which it may not be in C).

This file also contains earlier versions, as well as a commented version
of this sort and an example.
 */

#include <stdio.h>

void sort(int* a, int len);

int main(void) {
  #define LEN 10
  int a[LEN] = {1, 2, 5, 2, 9, 4, 3, 9, 8, 4};

  sort(a, LEN);

  for (int i = 0; i < LEN; i++) {
    printf("%d ", a[i]);
  }

  puts("");
  #undef LEN
}

// `a` is the array to sort
// `l` is its length
void sort (int* a, int l) {
for(int i=0,x=0;i<l;x=a[i]-a[i-1])i+=i&&x<0?a[i]-=x,a[i-1]+=x,-1:1;
}

void sort_commented (int* a, int l) {
for(int
      i = 0, // `i` is the current index.
      x = 0; // `x` is the difference between a[i] and a[i-1]. It is negative iff
             // they are in the wrong order and need to be swapped.

    i < l; // Stop when we get to the end of the array

    x = a[i] - a[i-1] // Maintain `x`'s invariant
    )

  i +=  // Move `i` in the proper direction
           i     // `i` does not equal 0, so we stay in the array bounds.
        && x < 0 // `x` is negative iff a[i] and a[i-1] are in the wrong order.

       ? // If we need to swap:
         a[i]   -= x,  // This line and the next swap a[i] and a[i-1]
         a[i-1] += x,  // This assumes addition is commutative, even with overflow
         -1            // Move `i` down

       : 1 // Otherwise, move `i` up
    ;
}

/**
   ----------------
   EARLIER VERSIONS
   ----------------
 */

/*
Based on the following Pseudocode from Wikipedia:

procedure gnomeSort(a[]):
    pos := 0
    while pos < length(a):
        if (pos == 0 or a[pos] >= a[pos-1]):
            pos := pos + 1
        else:
            swap a[pos] and a[pos-1]
            pos := pos - 1
*/
void sort2(int* a, int len) {
  for (int i = 0; i < len; i++) {
    if (i != 0 && a[i] < a[i-1]) {
      int tmp = a[i];
      a[i] = a[i-1];
      a[i-1] = tmp;
      i -= 2;
    }
  }
}

void sort3(int* a, int len) {
  for (int i=0,s=0,x=0,y=0; i < len; x=a[i],y=a[i-1],s = i != 0 && x < y)
    i += s ? a[i] = y, a[i-1] = x, -1 : 1;
}

void sort4(int* a, int l) {
for(int i=0,x=0;i<l;x=a[i]-a[i-1])i+=i!=0&&x<0?a[i]-=x,a[i-1]+=x,-1:1;
}
