//
//  ViewController.h
//  InstagramTask
//
//  Created by Shobhakar on 26/07/16.
//  Copyright © 2016 Gopi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationBarDelegate,UINavigationControllerDelegate>

//@property (strong, nonatomic) IBOutlet UITextField *submitButton;
@property (strong, nonatomic) IBOutlet UITextField *handleTextField;

- (IBAction)submitButton:(id)sender;

@property (strong,nonatomic) NSMutableArray * arrImagesUrlIs;

@end

