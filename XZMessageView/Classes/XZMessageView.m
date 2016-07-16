//
//  XZMessageView.m
//  Pods
//
//  Created by Xi Zhang on 7/14/16.
//
//

#import "XZMessageView.h"

#define kDefaultAutoHideDelay 3.0
#define kDefaultAnimationDuration 0.4
#define kDefaultRedColor [UIColor colorWithRed:180.0/255.0 green:62.0/255.0 blue:64.0/255.0 alpha:1.0]

@interface XZMessageView()
{
    UILabel *_errorMsgLabel;
}

@end

@implementation XZMessageView

/* init methods */
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupComponets];
    }
    return self;
}

-(id)initWithSize:(CGSize)size
{
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGRect frame = CGRectMake(CGRectGetMidX(screenBounds) - size.width/2.0, -size.height, size.width, size.height);
    self = [self initWithFrame:frame];
    if (self) {
        [self setupComponets];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setupComponets];
}

/* UI setup methods  */
-(void)setupComponets
{
    _animationDuration = kDefaultAnimationDuration;
    _autoHideDelay = kDefaultAutoHideDelay;
    
    [self setBackgroundColor:kDefaultRedColor];
    [self setupErrorLabel];
    [self setupGestures];
}

-(void)setupGestures
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide:)];
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hide:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:tapGesture];
    [self addGestureRecognizer:swipeGesture];
}

-(void)setupErrorLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectInset(self.bounds, 5.0, 5.0)];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:[UIColor whiteColor]];
    [label setNumberOfLines:1];
    [label setLineBreakMode:NSLineBreakByTruncatingTail];
    [label setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:17.0]];
    [self addSubview:label];
    [label setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin];
    _errorMsgLabel = label;
}

/* public UI control methods */
-(void)displayErrorMsgViewWithText:(NSString *)str
{
    if(![str length])
        return;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideErrorMsgView) object:nil];
    
    UIWindow *frontWindow = [UIApplication sharedApplication].delegate.window;
    [frontWindow.rootViewController.view addSubview:self];
    [frontWindow.rootViewController.view bringSubviewToFront:self];
    
    [self resetErrorMsg:str];
    [self show:nil callBack:^{
        [self performSelector:@selector(hideErrorMsgView) withObject:nil afterDelay:_autoHideDelay];
    }];
}

-(void)hideErrorMsgView
{
    [self hide:nil callBack:^{
        
    }];
}

/* private UI control methods */
-(void)hide:(UIGestureRecognizer *)gesture
{
    [self.superview bringSubviewToFront:self];
    CGRect rect = self.frame;
    rect.origin.y = -rect.size.height;
    [UIView animateWithDuration:_animationDuration animations:^{
        [self setFrame:rect];
    } completion:^(BOOL finished) {
    }];
}

-(void)hide:(UIGestureRecognizer *)gesture callBack:(void(^)(void))callback
{
    [self.superview bringSubviewToFront:self];
    CGRect rect = self.frame;
    rect.origin.y = -rect.size.height;
    [UIView animateWithDuration:_animationDuration animations:^{
        [self setFrame:rect];
    } completion:^(BOOL finished) {
        if (callback) {
            callback();
        }
    }];
}

-(void)show:(UIGestureRecognizer*)gesture callBack:(void(^)(void))callback
{
    [self.superview bringSubviewToFront:self];
    CGRect rect = self.frame;
    rect.origin.y = [[UIApplication sharedApplication] statusBarFrame].size.height;
    [UIView animateWithDuration:_animationDuration animations:^{
        [self setFrame:rect];
    } completion:^(BOOL finished) {
        if (callback) {
            callback();
        }
    }];
}

-(void)resetErrorMsg:(NSString *)errorMsg
{
    [_errorMsgLabel setText:errorMsg];
}

/*setters*/
-(void)setBgColor:(UIColor *)bgColor
{
    _bgColor = bgColor;
    [self setBackgroundColor:_bgColor];
}

-(void)setFont:(UIFont *)font
{
    _font = font;
    [_errorMsgLabel setFont:_font];
}

-(void)setFontColor:(UIColor *)fontColor
{
    _fontColor = fontColor;
    [_errorMsgLabel setTextColor:_fontColor];
}



@end
