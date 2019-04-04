# LGRightMoreView
UICollectionView 右侧滑动可以push 到下一个控制器组件
> 使用方法
```
StateFooterMore *rightVFooter = [[StateFooterMore alloc]init];
[rightVFooter addTargert:self andSelect:@selector(loardMoreAction)];
myCollectionView.rightFooter = rightVFooter;


```
```
属性说明:

circleColor 设置右侧弧形颜色

canShowRight 正常状态下是否展示右侧部分

添加 响应的SEL方法
-(void)addTargert:(id)target andSelect:(SEL)selecor;

```
