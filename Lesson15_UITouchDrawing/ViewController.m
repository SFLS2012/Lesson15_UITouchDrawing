//
//  ViewController.m
//  Lesson15_UITouchDrawing
//
//  Created by 朱 皓斌 on 13-4-8.
//  Copyright (c) 2013年 朱 皓斌. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    drawingImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:drawingImageView];
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint point=[[touches anyObject]locationInView:self.view];
    NSLog(@"当前触摸点x坐标为：%f;当前y坐标为:%f",point.x,point.y);
    
    
    UIImage *brushImage=[UIImage imageNamed:@"brush2.png"];
    
    UIGraphicsBeginImageContext(CGSizeMake(drawingImageView.frame.size.width, drawingImageView.frame.size.height));
    
    
    [drawingImageView.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [brushImage drawInRect:CGRectMake(point.x-5, point.y-25, brushImage.size.width, brushImage.size.height)];
    drawingImageView.image=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint point=[[touches anyObject]locationInView:self.view];

    UIImage *brushImage=[UIImage imageNamed:@"brush1.png"];
    
    UIGraphicsBeginImageContext(CGSizeMake(drawingImageView.frame.size.width, drawingImageView.frame.size.height));
      [drawingImageView.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [brushImage drawInRect:CGRectMake(point.x-5, point.y-25, brushImage.size.width, brushImage.size.height)];
    drawingImageView.image=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UITouch *touch=[touches anyObject];
    if ([touch tapCount]==2) {
        drawingImageView.image=nil;
    }
        
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint point=[[touches anyObject]locationInView:self.view];
    
    UIImage *brushImage=[UIImage imageNamed:@"brushinside.png"];
    
    UIGraphicsBeginImageContext(CGSizeMake(drawingImageView.frame.size.width, drawingImageView.frame.size.height));
    [drawingImageView.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [brushImage drawInRect:CGRectMake(point.x-5, point.y-25, brushImage.size.width, brushImage.size.height)];
    drawingImageView.image=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    
    
}
@end













