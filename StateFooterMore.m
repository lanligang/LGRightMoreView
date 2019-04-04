//
//  StateFooterMore.m
//
//  Created by ios2 on 2019/4/4.
//  Copyright © 2019 LenSky. All rights reserved.
//

#import "StateFooterMore.h"

@implementation StateFooterMore

-(instancetype)init
{
	self =  [super init];
	if (self) {
		self.state = LgNormalState;
		self.backgroundColor = [UIColor clearColor];
		_stateLable = [UILabel new];
		_stateLable.numberOfLines = 0;
		_stateLable.textColor = [UIColor whiteColor];
		_stateLable.text = @"滑动查看更多";
		 CGSize size = [_stateLable sizeThatFits:CGSizeMake(20, CGFLOAT_MAX)];
		_stateLable.bounds = (CGRect){0,0,size};
		[self addSubview:_stateLable];
	}
	return self;
}

-(void)boundsDidChange:(NSDictionary *)change{
	[super boundsDidChange:change];
	[self changeFrame];
}
-(void)contentOffsetDidChange:(NSDictionary *)change
{
	[super contentOffsetDidChange:change];
	[self changeFrame];
}

-(void)panStateDidChange:(NSDictionary *)change
{
	[super panStateDidChange:change];
	if (_pan.state == UIGestureRecognizerStateEnded) {
		if (self.frame.size.width > 100) {
			if (self.state == LgWillLoardMoreState) {
				self.state = LgLoardMoreState;
			}
		}
	}
}

-(void)changeFrame
{
	CGRect f = self.frame;
	CGFloat containt_w = (_currentCollectionView.contentSize.width >= _currentCollectionView.bounds.size.width)?_currentCollectionView.contentSize.width:_currentCollectionView.bounds.size.width;

	f.size.width = _currentCollectionView.bounds.origin.x - containt_w + _currentCollectionView.bounds.size.width;
	if (f.size.width <= right_more_w) {
		f.size.width = right_more_w;
		self.state = LgNormalState;
	}
	f.size.height = _currentCollectionView.bounds.size.height;
	f.origin.y = 0;
	f.origin.x = containt_w;
	self.frame = f;
	[self setNeedsDisplay];
	//修改了位置再去修改 文字状态
	[self scrollToChangeState];
}
//滚动的时候去设置 状态
-(void)scrollToChangeState
{
	if (_pan.state == UIGestureRecognizerStateChanged) {
		if (self.frame.size.width > 100) {
			if (self.state == LgNormalState) {
				self.state = LgWillLoardMoreState;
			}
		}else if (self.frame.size.width <=100){
			if (self.state == LgLoardMoreState|| self.state == LgWillLoardMoreState) {
				self.state = LgNormalState;
			}
		}
	}
}
-(void)setState:(LgRighMoreState)state
{
	_state = state;
	if (_state == LgLoardMoreState) {
		_stateLable.text = @"查看更多……";
		if (_target && self.selecotor) {
			//如果是被隐藏状态不调用绑定的方法
			if (self.hidden) return;
			//使用宏定义忽略警告⚠️
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
			[_target performSelector:self.selecotor];
#pragma clang diagnostic pop
		}
	}else if (_state == LgWillLoardMoreState){
		_stateLable.text = @"松手查看更多";
	}else if (_state == LgNormalState){
		_stateLable.text = @"滑动查看更多";
	}
}
- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	UIBezierPath *path = [UIBezierPath bezierPath];
	CGFloat w = CGRectGetWidth(self.bounds);
	CGFloat h = CGRectGetHeight(self.bounds);
	[path moveToPoint:CGPointMake(w, 0)];
	[path addLineToPoint:CGPointMake(w, h)];
	if (w > right_more_w + 20) {
		[path addLineToPoint:CGPointMake(w - right_more_w -20, h)];
		[path addQuadCurveToPoint:CGPointMake(w - right_more_w -20, 0) controlPoint:CGPointMake(-(w - right_more_w -20)*0.8, h/2.0)];
		[path addLineToPoint:CGPointMake(w, 0)];
	}else{
		[path addLineToPoint:CGPointMake(0, h)];
		[path addLineToPoint:CGPointZero];
		[path addLineToPoint:CGPointMake(w, 0)];
	}
	if (self.circleColor) {
		[self.circleColor setFill];
	}else{
		[[UIColor lightGrayColor]setFill];
	}
	[path fill];
}

-(void)layoutSubviews
{
	[super layoutSubviews];
	CGFloat w = CGRectGetWidth(self.bounds);
	CGFloat h = CGRectGetHeight(self.bounds);
	CGSize size = [_stateLable sizeThatFits:CGSizeMake(20, CGFLOAT_MAX)];
	if (size.height > h ) {
		size.height = h;
	}
	_stateLable.frame = (CGRect){w - 30,0,size};
	_stateLable.center = CGPointMake(_stateLable.center.x, h/2.0);
}

-(void)setCircleColor:(UIColor *)circleColor
{
	_circleColor = circleColor;
	[self setNeedsDisplay];
}



@end
