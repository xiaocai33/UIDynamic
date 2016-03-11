//
//  XCActionViewController.m
//  UIDynamic
//
//  Created by 小蔡 on 16/3/11.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "XCActionViewController.h"
@interface XCActionViewController()

@property (nonatomic, strong) UIDynamicAnimator *anim;
@property (nonatomic, strong) UIView *childView;

@end


@implementation XCActionViewController
- (UIDynamicAnimator *)anim{
    if (_anim == nil) {
        //（1）创建一个物理仿真器（顺便设置仿真范围）
        _anim = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _anim;
}
- (UIView *)childView{
    if (_childView ==nil ) {
        _childView = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 100, 100)];
        _childView.backgroundColor = [UIColor redColor];
    }
    return _childView;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.childView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    switch (self.viewAction) {
        case kViewActionGravity:
            [self gravity];
            break;
        case kViewActionCollisionGravity:
            [self collisionGravity];
            break;
        case kViewActionSnap:{
            //获取当前触摸的手指
            UITouch *touch = [touches anyObject];
            //根据手指取出位置
            CGPoint point = [touch locationInView:touch.view];
            
            [self snapWithPoint:point];
            break;
        }
            
        default:
            break;
    }

}

/**
 *  吸附行为模拟
 */
- (void)snapWithPoint:(CGPoint)point{
    //（2）创建物理仿真行为（添加物理仿真元素）
    UISnapBehavior *snapB = [[UISnapBehavior alloc] initWithItem:self.childView snapToPoint:point];
    //可以设置吸附行为的“减震”
    snapB.damping = 0.8;
    //清除上一次的效果
    [self.anim removeAllBehaviors];
     //（3）将物理仿真行为添加到物理仿真器中
    [self.anim addBehavior:snapB];
    
}
/**
 *  碰撞行为模拟
 */
- (void)collisionGravity{
    //（2）创建物理仿真行为（添加物理仿真元素）
    UIGravityBehavior *gravityB = [[UIGravityBehavior alloc] initWithItems:@[self.childView]];
    UICollisionBehavior *collisionB = [[UICollisionBehavior alloc] initWithItems:@[self.childView]];
    //指定碰撞边界
//    collisionB.translatesReferenceBoundsIntoBoundary = YES;
    //画边界
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.view.bounds];
    [collisionB addBoundaryWithIdentifier:@"cell" forPath:path];
    //直线边界
//    [collisionB addBoundaryWithIdentifier:@"line" fromPoint:CGPointMake(50, 300) toPoint:CGPointMake(300, 300)];
    //（3）将物理仿真行为添加到物理仿真器中
    [self.anim addBehavior:gravityB];
    [self.anim addBehavior:collisionB];
    
}

/**
 *  重力行为模拟
 */
- (void)gravity{
    //（2）创建物理仿真行为（添加物理仿真元素）
    UIGravityBehavior *gravityB = [[UIGravityBehavior alloc] initWithItems:@[self.childView]];
    //设置重力方向(0,1)下 (1,0)左 (0,-1)上 (-1,0)右
    gravityB.gravityDirection = CGVectorMake(0, 1);//向下
    //重力加速度
    gravityB.magnitude = 0.6;
    //（3）将物理仿真行为添加到物理仿真器中
    [self.anim addBehavior:gravityB];

}

@end
