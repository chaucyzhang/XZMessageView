//
//  XZMessageView.h
//  Pods
//
//  Created by Xi Zhang on 7/14/16.
//
//

#import <UIKit/UIKit.h>

@interface XZMessageView : UIView

@property(strong,nonatomic)UIFont *font;
@property(strong,nonatomic)UIColor *fontColor;
@property(strong,nonatomic)UIColor *bgColor;
@property(assign,nonatomic)NSTimeInterval animationDuration;
@property(assign,nonatomic)NSTimeInterval autoHideDelay;

#pragma mark - init method
-(id)initWithSize:(CGSize)size;

#pragma mark - control methods
-(void)displayErrorMsgViewWithText:(NSString *)str;
-(void)hideErrorMsgView;

@end
