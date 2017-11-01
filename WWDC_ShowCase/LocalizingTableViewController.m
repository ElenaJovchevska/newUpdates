
#import "LocalizingTableViewController.h"

@implementation LocalizingTableViewController {
    
    __weak IBOutlet UILabel *firstLabel;
    __weak IBOutlet UILabel *secondLabel;
    __weak IBOutlet UILabel *thirdLabel;
    __weak IBOutlet UILabel *dateLabel;
    
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
    
    [self setDateLabel];
}

- (IBAction)clickMeButtonTapped:(id)sender
{
    labelsState = !labelsState;
    if (labelsState) {
        firstLabel.text = [NSString localizedStringWithFormat:NSLocalizedString(@"%d textLabels", ""), 1];
        secondLabel.text = [NSString localizedStringWithFormat:NSLocalizedString(@"%d textLabels", ""), 2];
        thirdLabel.text = [NSString localizedStringWithFormat:NSLocalizedString(@"%d textLabels", ""), 3];
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

- (void)setDateLabel
{
    NSString *dateString = @"3/4/2018";
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateIntervalFormatterShortStyle;
    NSDate *date = [dateFormatter dateFromString:dateString];
    dateLabel.text = [NSString stringWithFormat:@"%@", date];
}

@end
