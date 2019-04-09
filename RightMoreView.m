//
//  RightMoreView.m
//
//  Created by ios2 on 2019/4/4.
//  Copyright © 2019 LenSky. All rights reserved.
//

#import "RightMoreView.h"

@implementation RightMoreView

-(void)willMoveToSuperview:(UIView *)newSuperview
{
	//移除旧的 添加新的
	[self removeKvo];
	if (newSuperview&& [newSuperview isKindOfClass:[UIScrollView class]]) {
		_currentScrollView = (UIScrollView *)newSuperview;
		[_currentScrollView setAlwaysBounceHorizontal:YES];
		UIEdgeInsets edg = _currentScrollView.contentInset;
		edg.right = (_canShowRight)?right_more_w:0;
		_currentScrollView.contentInset = edg;
		_pan = _currentScrollView.panGestureRecognizer;
		[self addKvo];
		self.bounds = (CGRect){0,0,right_more_w,_currentScrollView.frame.size.height};
	}else{
		if (newSuperview == nil) {
			UIEdgeInsets edg = _currentScrollView.contentInset;
			edg.right = 0;
			_currentScrollView.contentInset = edg;
		}
	}
}
-(void)removeKvo
{
	if (_currentScrollView&&_pan) {
		[_currentScrollView removeObserver:self forKeyPath:@"bounds" context:nil];
		[_currentScrollView removeObserver:self forKeyPath:@"contentOffset" context:nil];
		[_pan removeObserver:self forKeyPath:@"state" context:nil];
	}
}
-(void)addKvo
{
	if (_currentScrollView&&_pan) {
		[_currentScrollView addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
		[_currentScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
		[_pan addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
	}
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
	if ([keyPath isEqualToString:@"bounds"]) {
		[self boundsDidChange:change];
	}else if ([keyPath isEqualToString:@"contentOffset"]){
		[self contentOffsetDidChange:change];
	}else if ([keyPath isEqualToString:@"state"]) {
		[self panStateDidChange:change];
	}
}

-(void)addTargert:(id)target andSelect:(SEL)selecor
{
	_target = target;
	_selecotor = selecor;
}

//如果需要可以在子类中实现
-(void)boundsDidChange:(NSDictionary *)change{}
-(void)contentOffsetDidChange:(NSDictionary *)change{}
-(void)panStateDidChange:(NSDictionary *)change{}

//Setter 方法
-(void)setHidden:(BOOL)hidden
{
	[super setHidden:hidden];
	if (hidden) {
		UIEdgeInsets edg = _currentScrollView.contentInset;
		edg.right = 0;
		_currentScrollView.contentInset = edg;
	}else{
		UIEdgeInsets edg = _currentScrollView.contentInset;
		edg.right = (_canShowRight)?right_more_w:0;
		_currentScrollView.contentInset = edg;
	}
}

-(void)setCanShowRight:(BOOL)canShowRight
{
	_canShowRight = canShowRight;
	if (_currentScrollView) {
		UIEdgeInsets edg = _currentScrollView.contentInset;
		edg.right = (_canShowRight)?right_more_w:0;
		_currentScrollView.contentInset = edg;
	}
}




@end
