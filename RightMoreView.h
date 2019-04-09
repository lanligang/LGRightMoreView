//
//  RightMoreView.h
//
//  Created by ios2 on 2019/4/4.
//  Copyright © 2019 LenSky. All rights reserved.
//

#import <UIKit/UIKit.h>

static float right_more_w = 40.0f;

@interface RightMoreView : UIView {
	//当前的collectionView
	__weak UIScrollView *_currentScrollView;
	//滑动手势
	__weak UIPanGestureRecognizer * _pan;
	//关联SEL 的对象
	__weak id _target;
}
//关联的方法 SEL
@property(nonatomic,assign)SEL selecotor;


typedef NS_ENUM(NSInteger, LgRighMoreState) {
	LgNormalState = 1,
	LgWillLoardMoreState = 2,
	LgLoardMoreState = 3,
};

//默认状态下是否可以显示右侧部分 默认是不显示的
@property(nonatomic,assign)BOOL canShowRight;

	//默认是开启的      |- can show y/n - [ ] - (|
@property(nonatomic,assign)BOOL canLeftBounds;

//用于添加方法
-(void)addTargert:(id)target andSelect:(SEL)selecor;

//基类用于监听使用 用子类进行操作即可
-(void)boundsDidChange:(NSDictionary *)change;
-(void)contentOffsetDidChange:(NSDictionary *)change;
-(void)panStateDidChange:(NSDictionary *)change;

@end
