
#import "SafeAreaViewController.h"

@interface SafeAreaViewController ()

@end

@implementation SafeAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.prefersLargeTitles = NO;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    //self.additionalSafeAreaInsets = UIEdgeInsetsMake(100, 0, 0, 0);
}

- (void)viewSafeAreaInsetsDidChange
{
    //method called when safe area insets has been changed.
    [super viewSafeAreaInsetsDidChange];
}

@end
