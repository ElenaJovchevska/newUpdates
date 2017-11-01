
#import "CustomNavigationBar.h"

@implementation CustomNavigationBar

-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    if (rectStatus.size.height==44.f) {
        
    }else{
        if (@available(iOS 11.0, *)) {
            for ( UIView*aView in self.subviews) {
                if ([NSStringFromClass(aView.classForCoder) isEqualToString:@"_UINavigationBarContentView"]) {
                    //aView.backgroundColor = [UIColor yellowColor];
                    //aView.frame = CGRectMake( 0,0,aView.frame.size.width,44);
                }
                else if ([NSStringFromClass(aView.classForCoder) isEqualToString:@"_UIBarBackground"]) {
                    //aView.backgroundColor = [UIColor yellowColor];
                    //aView.frame = CGRectMake(0,0,aView.frame.size.width, 64);
                }
            }
        }
    }
}

@end
