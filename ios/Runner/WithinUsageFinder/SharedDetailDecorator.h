#import "ActionStatusStack.h"
#import "TensorProviderFactory.h"

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SharedDetailDecorator : NSObject


- (void) continueUnaryOutsideRecursion;

- (void) onOperationException;

@end

NS_ASSUME_NONNULL_END
        