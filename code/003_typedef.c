// Declaring a point in space type
typedef struct {
  float x;
  float y;
} APointInSpace;

int main(){
  APointInSpace point;
  point.x = 20.0;
  point.y = 410.0;

  // C99 style struct instantiation
  APointInSpace point2 = { .x= 21.0, .y= 32.0 };
  return 0;
}
