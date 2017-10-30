
#import "LocalizingTableViewController.h"

@implementation LocalizingTableViewController {
    
    __weak IBOutlet UILabel *firstLabel;
    __weak IBOutlet UILabel *secondLabel;
    __weak IBOutlet UILabel *thirdLabel;
    BOOL labelsState;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLabelsInitialText];
    labelsState = false;
    self.navigationController.navigationBar.prefersLargeTitles = NO;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    self.navigationItem.title = [NSLocalizedString(@"Localizing with Xcode9",
                                                   @"title of the UIView Controller")
                                 variantFittingPresentationWidth:20];
    
}

- (IBAction)clickMeButtonTapped:(id)sender
{
    labelsState = !labelsState;
    if (labelsState) {
        NSString *string = NSLocalizedString(@"%d label", "");
        firstLabel.text = [NSString localizedStringWithFormat:string, 1];
        secondLabel.text = [NSString localizedStringWithFormat:string, 2];
        thirdLabel.text = [NSString localizedStringWithFormat:string, 3];
    } else {
        [self setLabelsInitialText];
    }
}

- (void)setLabelsInitialText
{
    firstLabel.text = NSLocalizedString(@"left positioned", "");
    secondLabel.text = NSLocalizedString(@"middle positioned", "");
    thirdLabel.text = NSLocalizedString(@"right positioned", "");
}

@end
