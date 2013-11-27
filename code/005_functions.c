float aSimpleAdditionMethod(float a, float b){
  return a + b;
}

float aSimpleSubtractionMethod(float a, float b){
  return a - b;
}

int aFloatAdditionThatReturnsAnInt(float a, float b){
  return (int) (a + b);
}

int main(){
  float (*anFnPtr)(float, float) = aSimpleAdditionMethod;
  anFnPtr(1, 1); // returns 2
  anFnPtr = aSimpleSubtractionMethod;
  anFnPtr(1, 1); // returns 0
}
