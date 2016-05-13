//
//  BoxesViewController.m
//  ColorBoxes
//
//  Created by Brusnikin on 13.05.16.
//  Copyright © 2016 Brusnikinapps. All rights reserved.
//

#import "BoxesViewController.h"
#import "UIColor+random.h"
#import "CDManager.h"
#import "Box.h"

@interface BoxesViewController ()

{
    NSArray * _boxes;
}

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@end

@implementation BoxesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (_boxes.count > 0)
    {
        for (NSInteger i = 0; i < _boxes.count; i++)
        {
            Box *box = _boxes[i];
            UIColor *color = (UIColor *)[NSKeyedUnarchiver unarchiveObjectWithData:box.color];
            UIButton *button = _buttons[i];
            button.backgroundColor = color;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private API


- (IBAction)turnback:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)colorChanged:(UIButton *)sender
{
    NSInteger index = [_buttons indexOfObject:sender];
    Box *box = _boxes[index];
    
    UIColor *color = [UIColor randomColor];
    NSData *dataColor = [NSKeyedArchiver archivedDataWithRootObject:color];
    [Box addBox:box withDataColor:dataColor];
    sender.backgroundColor = color;
}

- (void)setButtons:(NSArray *)buttons
{
    _boxes = [Box boxes];
    if (!_boxes.count)
    {
        for (UIButton *button in buttons)
        {
            UIColor *color = [UIColor randomColor];
            NSData *dataColor = [NSKeyedArchiver archivedDataWithRootObject:color];
            
            [Box boxWithDataColor:dataColor];
            button.backgroundColor = color;
        }
    }
    
    _buttons = buttons;
}



@end
