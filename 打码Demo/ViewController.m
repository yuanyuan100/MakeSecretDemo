//
//  ViewController.m
//  打码Demo
//
//  Created by Snake on 16/7/14.
//  Copyright © 2016年 IAsk. All rights reserved.
//

#import "ViewController.h"
#import "PYMakeTextSecretTextView.h"

@interface ViewController () <UITextViewDelegate>
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic) NSRange leapRange;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PYMakeTextSecretTextView *textView = [[PYMakeTextSecretTextView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 400.0f)];
    [self.view addSubview:textView];
    textView.editable = NO;
    textView.text = @"打开房间看电视机房空间撒快递劫匪看电视剧公开的价格可发货的管控好地方科技贷款是否就肯定是减肥快圣诞节疯狂了三季度看房间爱思考肯德基分手快乐的减肥了开始叫对方空间上打开房间时口袋里积分卡拉斯加对方可垃圾是东方科技萨克的附件大姐夫萨拉京东方拉伸件地方了会计师的路口附近开始的缴费卡拉斯加对方考虑接收到开房间看电视房间看电视机房";
    textView.delegate = self;
    self.textView = textView;
    
    self.imageView = ({
        UIImageView *imageV = [[UIImageView alloc] init];
        [self.view addSubview:imageV];
        imageV.backgroundColor = [UIColor blackColor];
        imageV.alpha = 0.7f;
        imageV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap:)];
        [imageV addGestureRecognizer:tap];
        imageV.hidden = YES;
        imageV;
    });
}

//
- (void)pressTap:(UITapGestureRecognizer *)tap {
    self.imageView.hidden = YES;
    // !< 需要存储呢nsrange 及本来的内容
    NSMutableString *str = [[NSMutableString alloc] init];
    for (int i = 0; i < self.leapRange.length; i++) {
        [str appendString:@"*"];
    }
    self.textView.text = [self.textView.text stringByReplacingCharactersInRange:self.leapRange withString:str];
}


- (void)textViewDidChangeSelection:(UITextView *)textView {
    NSLog(@"1 --  %@", NSStringFromRange(textView.selectedRange));
    NSLog(@"2 --  %@", textView.selectedTextRange);
    CGRect rect = [textView firstRectForRange:textView.selectedTextRange];
    NSLog(@"rect %@", NSStringFromCGRect(rect));
    
    self.imageView.frame = CGRectMake(rect.origin.x, rect.origin.y + 100 - 40.0f - 10.0f, 40, 40);
    self.leapRange =  textView.selectedRange;
    self.imageView.hidden = NO;
    
    if (!textView.selectedTextRange) {
        self.imageView.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
