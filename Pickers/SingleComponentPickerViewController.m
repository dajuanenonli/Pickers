//
//  SingleComponentViewPickerController.m
//  Pickers
//
//  Created by Student on 7/21/15.
//  Copyright (c) 2015 Student_Ralph. All rights reserved.
//

#import "SingleComponentPickerViewController.h"

@interface SingleComponentPickerViewController ()

@property (nonatomic, strong) NSArray *characterNames;
@property (nonatomic, weak) IBOutlet UIPickerView *singlePicker;

@end

@implementation SingleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.characterNames = @[@"Han", @"Luke", @"Leia", @"Chewbacca", @"Obi-wan", @"Artoo", @"Threepio", @"Lando"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark Button Events
- (IBAction)buttonPress:(id)sender
{
    [self showAlert:self.characterNames[[self.singlePicker selectedRowInComponent:0]]];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    return [self.characterNames count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return self.characterNames[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self showAlert:self.characterNames[row]];
}

#pragma mark Private Methods
- (void)showAlert:(NSString *) charSelected{
    NSString *title = [[NSString alloc] initWithFormat:@"You selected %@!", charSelected];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:@"Thank you for choosing."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"You're welcome"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES
                     completion:nil];

}


@end
