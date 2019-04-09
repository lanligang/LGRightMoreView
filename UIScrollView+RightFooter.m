//
//  UIScrollView+RightFooter.m
//  ScrollPage
//
//  Created by ios2 on 2019/4/9.
//  Copyright © 2019 LenSky. All rights reserved.
//

#import "UIScrollView+RightFooter.h"
#import <objc/runtime.h>
static const char moreCharKey = '\0';
@implementation UIScrollView (RightFooter)
-(void)setRightFooter:(RightMoreView *)rightFooter
{
	if (rightFooter != self.rightFooter) {
		[self willChangeValueForKey:@"rightFooter"];
		[self.rightFooter removeFromSuperview];
		[self insertSubview:rightFooter atIndex:0];
			//存储新值
		objc_setAssociatedObject(self, &moreCharKey, rightFooter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
		[self didChangeValueForKey:@"rightFooter"];
	}
}
-(RightMoreView *)rightFooter
{
	return  objc_getAssociatedObject(self, &moreCharKey);
}
@end
