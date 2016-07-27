//
//  ViewController.m
//  InstagramTask
//
//  Created by Shobhakar on 26/07/16.
//  Copyright © 2016 Gopi. All rights reserved.
//

#import "ViewController.h"
#import "ModelViewController.h"

#import "AppDelegate.h"
#define URL   = @"https://www.instagram.com/"




#define APPDELEGATE   ((AppDelegate*)[UIApplication sharedApplication].delegate)


@interface ViewController ()
{
    ModelViewController * arrModel ;
    
    
}
@end

@implementation ViewController
@synthesize handleTextField;
@synthesize arrImagesUrlIs;

- (void)viewDidLoad

{
    [super viewDidLoad];
 
   arrImagesUrlIs= [[NSMutableArray alloc]init];
    self.navigationController.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning


{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButton:(id)sender

{
//AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString * url = @"https://www.instagram.com/";
    NSString * handle = handleTextField.text;
    NSString * media = @"/media/" ;
    
    NSString * newUrl = [NSString stringWithFormat:@"%@ %@ %@",url,handle,media];
    
    NSString * removeChar = [newUrl stringByReplacingOccurrencesOfString:@" " withString:@""] ;
    NSLog(@"new url is %@",removeChar);
    
    NSURL * CompleteUrl = [NSURL URLWithString:removeChar];
    
    NSData * data = [NSData dataWithContentsOfURL:CompleteUrl];
    
    NSJSONSerialization * jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSLog(@"data is %@",jsonData);
    
    
    NSDictionary * dataInHandle  = [jsonData valueForKey:@"items"];
    
    
    for (NSDictionary *object in dataInHandle)
    {
        
        NSDictionary * imageUrlKey = [object objectForKey:@"images"];
        
        NSDictionary * urlForImage = [imageUrlKey objectForKey:@"low_resolution"];
        
        NSDictionary * imagesShow = [urlForImage objectForKey:@"url"];
        
        [arrImagesUrlIs addObject:imagesShow];
        
        
        
    }
    
    APPDELEGATE.arrToStoreData = arrImagesUrlIs;
    NSLog(@"data in appdelegate array is %@",APPDELEGATE.arrToStoreData);
    
    [self performSegueWithIdentifier:@"m" sender:nil];
}

@end
