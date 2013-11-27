#import <Foundation/Foundation.h>

@interface MyObject : NSObject {
  float mMyNumeric;
}

@property(readonly) NSString * instanceVariable;
@property(nonatomic, setter=setScaledByTen:) float numericVariable;
@end

@implementation MyObject

@synthesize numericVariable = mMyNumeric;

-(void) setScaledByTen:(float) n {
  mMyNumeric = n * 10;
}

-(NSString * ) instanceVariable {
  return @"This is a readonly NSString";
}

@end

int main(){
  MyObject * mo = [[MyObject alloc] init];

  // Bracket Syntax
  [mo setScaledByTen:20.0f];
  NSLog(@"The values I set were %@ and %f",
          [mo instanceVariable],
          [mo numericVariable]);

  // Dot Syntax
  mo.numericVariable = 25.0f;
  NSLog(@"The values I set were %@ and %f",
          mo.instanceVariable,
          mo.numericVariable);
  return 0;
}
