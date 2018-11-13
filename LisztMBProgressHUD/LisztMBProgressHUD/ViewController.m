//
//  ViewController.m
//  LisztMBProgressHUD
//
//  Created by LaoDie on 2018/11/12.
//  Copyright © 2018 LisztMBProgressHUD. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LisztMBProgressHUD.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *datas;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    datas = @[@"showMessage",@"showIndeterminateWithMessage",@"showSuccessWithMessage",@"showErrorWithMessage"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = datas[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:18.f];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.row==0){
        [self.view showMessage:@"登录成功" canTouch:YES duration:5 complection:^{
            NSLog(@"回调了");
        }];
    }
    else if(indexPath.row==1){
        [self.view showIndeterminateWithMessage:@"登录中..." canTouch:YES];
    }
    else if(indexPath.row==2){
        [self.view showSuccessWithMessage:@"上传图片成功" canTouch:YES duration:2 complection:^{
            NSLog(@"成功回调了");
        }];
    }
    else if(indexPath.row==3){
        [self.view showErrorWithMessage:@"上传图片失败" canTouch:NO duration:2 complection:^{
            NSLog(@"错误回调了");
        }];
    }
}

@end
