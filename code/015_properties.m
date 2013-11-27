#import <Foundation/Foundation.h>

@interface MyObject : NSObject {

}
@property(strong) NSString * instanceVariable;
@property float numericVariable;
@end

@implementation MyObject

@end

int main(){
  MyObject * mo = [[MyObject alloc] init];

  // Bracket Syntax
  [mo setInstanceVariable:@"Test"];
  [mo setNumericVariable:20.0f];
  NSLog(@"The values I set were %@ and %f",
          [mo instanceVariable],
          [mo numericVariable]);

  // Dot Syntax
  mo.instanceVariable = @"Test 2";
  mo.numericVariable = 25.0f;
  NSLog(@"The values I set were %@ and %f",
          mo.instanceVariable,
          mo.numericVariable);
  return 0;
}
