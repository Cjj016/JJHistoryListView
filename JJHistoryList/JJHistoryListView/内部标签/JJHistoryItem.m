//
//  JJHistoryItem.m
//  JJHistoryList
//
//  Created by Joey Chan on 2019/1/24.
//  Copyright © 2019年 Joey Chan. All rights reserved.
//

#import "JJHistoryItem.h"
@interface JJHistoryItem ()

@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UIButton *delectButton;
@property (nonatomic , strong) UIButton *btn;

@end

@implementation JJHistoryItem

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        [self setupTitleLabel];
        [self setupDelectButton];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showDelectButton:) name:@"showDelectButton" object:nil];
        
    }
    return self;
}

- (void)setupTitleLabel {
    UILabel *titleLabel = [[UILabel alloc] init];
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    ///点击事件
    UIButton *btn = [[UIButton alloc] init];
    [self addSubview:btn];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    self.btn = btn;
}

- (void)setupDelectButton {
    UIButton *delectButton = [[UIButton alloc] init];
    [self addSubview:delectButton];
    delectButton.alpha = 0.0;
    [delectButton addTarget:self action:@selector(delectButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.delectButton = delectButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.btn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.delectButton.frame = CGRectMake(self.frame.size.width - self.model.delectImageSize.width/2, - self.model.delectImageSize.height/2, self.model.delectImageSize.width, self.model.delectImageSize.height);
    [self.delectButton setImage:self.model.delectImage forState:UIControlStateNormal];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];//初始化一个长按手势
    [longPress setMinimumPressDuration:self.model.longPressResponseTime];//设置按多久之后触发事件
    [self addGestureRecognizer:longPress];
}

- (void)showDelectButton:(NSNotification *)nf {
    NSDictionary *userInfo = nf.userInfo;
    JJHistoryItem *obj = userInfo[@"obj"];
    NSLog(@"obj.model.title == %@",obj.model.title);
    if (![self isEqual:obj]) {
        
        [UIView animateWithDuration:0.3 animations:^{
            self.delectButton.alpha = 0.0;
        }];
    } else {
        
        [UIView animateWithDuration:0.3 animations:^{
            self.delectButton.alpha = 1.0;
        }];
    }
}



-(void)longPressAction:(UILongPressGestureRecognizer*)sender{
    //    UIGestureRecognizerStatePossible,按钮state的各种枚举值
    //    UIGestureRecognizerStateBegan,
    //    UIGestureRecognizerStateChanged,
    //    UIGestureRecognizerStateEnded,
    //    UIGestureRecognizerStateCancelled,
    //    UIGestureRecognizerStateFailed,
    //    UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded
    if (sender.state == UIGestureRecognizerStateBegan) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"showDelectButton" object:self userInfo:@{@"obj":self}];
    }
 }

- (void)btnAction {
    NSLog(@"self.delegate == %@",self.delegate);
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectItemAtIndexPath:)]) {
        [self.delegate selectItemAtIndexPath:self.model.itemIndexPath];
    }
}


- (void)delectButtonAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectItemDelectBtnAtIndexPath:)]) {
        [self.delegate selectItemDelectBtnAtIndexPath:self.model.itemIndexPath];
    }
}

- (void)setModel:(JJHistoryListKeyItemModel *)model {
    _model = model;
    self.titleLabel.layer.masksToBounds = YES;
    self.titleLabel.layer.cornerRadius = model.radius;
    self.titleLabel.backgroundColor = model.itemBackgrandColor;
    self.titleLabel.text = model.title;
    self.titleLabel.font = model.itemFont;
    self.titleLabel.textColor = model.itemTitleColer;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    UIView *hitView = self;
//    BOOL pointInRound = [self touchPointInsideCircle:self.delectButton.center radius:0 targetPoint:point];
    if (CGRectContainsPoint(self.delectButton.frame, point)) {
//        hitView = self.delectButton;
        return self.delectButton;
    }
    return [super hitTest:point withEvent:event];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
