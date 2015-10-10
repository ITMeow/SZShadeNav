//
//  ViewController.m
//  变化的导航栏
//
//  Created by meow on 15/10/10.
//  Copyright © 2015年 ITMeow. All rights reserved.
//

#import "ViewController.h"

#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic)UIView *Hideview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc]init];

//    self.navigationController.navigationBarHidden = YES;
    self.Hideview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 64)];
    self.Hideview.backgroundColor = [UIColor colorWithRed:226/255.0f green:67/255.0f  blue:70/255.0f  alpha:0.0];
    
    [self.view addSubview:self.Hideview];
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 25;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 200;
    }
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Controller Cell %ld", (long)indexPath.row];
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView==self.tableView) {
        
        NSLog(@"%f",scrollView.contentOffset.y);
        CGFloat offsetY = scrollView.contentOffset.y;
        if (scrollView.contentOffset.y>=-20 && scrollView.contentOffset.y<50) {
            self.navigationController.navigationBarHidden = NO;
            self.Hideview.backgroundColor=[UIColor colorWithRed:226/255.0f green:67/255.0f  blue:70/255.0f  alpha:offsetY*2/100];
            
            //NSLog(@"变色");
        }else if (scrollView.contentOffset.y<-20){
            
            self.navigationController.navigationBarHidden = YES;
            self.Hideview.backgroundColor=[UIColor colorWithRed:226/255.0f green:67/255.0f  blue:70/255.0f  alpha:0.0];
        }else{
            
            self.navigationController.navigationBarHidden = NO;
            self.Hideview.backgroundColor=[UIColor colorWithRed:226/255.0f green:67/255.0f  blue:70/255.0f  alpha:0.9];
        }
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
