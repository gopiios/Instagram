//
//  ModelViewController.m
//  InstagramTask
//
//  Created by Shobhakar on 26/07/16.
//  Copyright © 2016 Gopi. All rights reserved.
//

#import "ModelViewController.h"

@implementation ModelViewController

//@property (strong,nonatomic) NSMutableArray * arrImagesUrl;

- (NSMutableArray*) arrImagesUrl
{
    if (!_arrImagesUrl){
        _arrImagesUrl = [[NSMutableArray alloc] initWithCapacity:2];
        
        NSLog(@"hota %@",_arrImagesUrl);
    }
    return _arrImagesUrl;
}


@end
