#import <Foundation/Foundation.h>


// INTERFACE DECLARATION
// Typically this would go in a file named MyNewClass.h

@interface MyNewClass : NSObject {
  int privateVariable1;
  NSString * privateVariable2;
}

+(int) someClassMethod;
-(void) doSomething;
-(NSString *) giveMeAStringOfLength:(int)length
                  randomizeContents:(BOOL)randomize;
@end

// IMPLEMENTATION
// Typically this would go in a file named MyNewClass.m

@implementation MyNewClass

-(id) init {
  self = [super init];
  if(self){
    privateVariable1 = 20;
    privateVariable2 = [[NSString alloc] initWithString:@"Test"];
  }
  return self;
}

+(int) someClassMethod {
  return 0;
}

-(void) doSomething {
  NSLog(@"Something");
}

-(NSString *) giveMeAStringOfLength:(int)length
                  randomizeContents:(BOOL)randomize {
  return @"TODO: Make work";
}

@end

// Test it!

int main(){
  MyNewClass * instance = [[MyNewClass alloc] init];
  [instance doSomething];
  NSLog(@"Some class method: %i", [MyNewClass someClassMethod]);
  NSLog(@"My random string: %@", [instance giveMeAStringOfLength:10 randomizeContents:YES]);
}
