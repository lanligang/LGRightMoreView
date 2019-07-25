//
//  StateFooterMore.h
//
//  Created by ios2 on 2019/4/4.
//  Copyright © 2019 LenSky. All rights reserved.
//

#import "RightMoreView.h"

@interface StateFooterMore : RightMoreView

@property(nonatomic,assign)LgRighMoreState state;
//状态标签
@property (nonatomic,strong)UILabel *stateLable;

//圆弧图层的颜色 默认高亮灰
@property (nonatomic,strong)UIColor *circleColor;

@end
