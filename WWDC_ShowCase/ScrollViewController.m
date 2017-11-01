
#import "ScrollViewController.h"

@implementation ScrollViewController {
    
    __weak IBOutlet UILabel *detailTextLabel;
    __weak IBOutlet UIScrollView *scrollView;
    BOOL shouldDetailLabelBeHidden;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    shouldDetailLabelBeHidden = NO; self.navigationController.navigationBar.prefersLargeTitles = NO;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    
    //Now you can set contentInset, adjustedContentInset is not represented in iOS 11.
    scrollView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    
    //This piece of code, creates left inset for the scrollView, which is a language directional behaviour + right-left pseudo + trailing to -10.
   //scrollView.contentInset = UIEdgeInsetsMake(50, 50, 0, 0);
    [self setupDetailTextLabel];
    
}

- (void)setupDetailTextLabel
{
    [detailTextLabel setHidden:shouldDetailLabelBeHidden];
    detailTextLabel.text = @"Once Upon a Time is an American fantasy drama television series that premiered on October 23, 2011, on ABC. The show follows residents who are characters from various fairy tales transported to the read world and robbed of their original memories by a powerful curse. The first six seasons were set in the fictitious seaside town of Storybrooke, Maine, while the seventh takes place in a Seattle, Washington neighborhood called Hyperion Heights.It borrows elements and characters from the Disney franchise and popular Western literature, folklore, and fairy tales. Once Upon a Time was created by Lost and Tron: Legacy writers Edward Kitsis and Adam Horowitz.[2].For the first six seasons, the series aired on Sundays at 8:00 pm ET/7:00 pm CT.[3] On May 11, 2017, ABC renewed the series for a 22-episode seventh season, moving to Friday 8:00 pm ET/7:00 pm CT, which premiered on October 6, 2017.[4][5][6].A spin-off series, Once Upon a Time in Wonderland, consisting of 13 episodes, premiered on October 10, 2013, and concluded on April 3, 2014 Kitsis and Adam Horowitz.[2].For the first six seasons, the series aired on Sundays at 8:00 pm ET/7:00 pm CT.[3] On May 11, 2017, ABC renewed the series for a 22-episode seventh season, moving to Friday 8:00 pm ET/7:00 pm CT, which premiered on October 6, 2017.[4][5][6].A spin-off series, Once Upon a Time in Wonderland, consisting of 13 episodes, premiered on October 10, 2013, and concluded on April 3, 2014";
}

- (IBAction)doneButtonTapped:(id)sender
{
    shouldDetailLabelBeHidden = !shouldDetailLabelBeHidden;
    [detailTextLabel setHidden:shouldDetailLabelBeHidden];
}

@end
