//
//  XCActionViewController.h
//  UIDynamic
//
//  Created by 小蔡 on 16/3/11.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    /** 重力行为 */
    kViewActionGravity = 0,
    /** 碰撞行为 */
    kViewActionCollisionGravity,
    /** 吸附行为 */
    kViewActionSnap
//    /** 推动行为 */
//    kViewActionPush,
//    /** 刚性附加行为 */
//    kViewActionAttachment,
//    /** 弹性附加行为 */
//    kViewActionSpring,
//    /** 碰撞检测 */
//    kViewActionCollision
    
    
} kViewAction;

@interface XCActionViewController : UIViewController
// 要演练的仿真行为类型
@property (nonatomic, assign) kViewAction viewAction;
@end
