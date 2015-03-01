//
//  ContactTransferViewController.m
//  DoctorFei_iOS
//
//  Created by hxx on 1/27/15.
//
//

#import "ContactTransferViewController.h"
#import "DoctorAPI.h"

@interface ContactTransferViewController ()
@property (weak, nonatomic) IBOutlet UITextView *referralMessage;
@property (weak, nonatomic) IBOutlet UIImageView *doctorAvatar;
@property (weak, nonatomic) IBOutlet UIImageView *receiverAvatar;

@end

@implementation ContactTransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self transferAction];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)transferAction{
    NSDictionary *params=@{
                           @"doctorid": [[NSUserDefaults standardUserDefaults] objectForKey:@"UserId"],
                           @"userid":@(17),
                           @"todoctorid":@(129)
                           };
    [DoctorAPI initiateReferralWithParameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSLog(@"%@",[[responseObject firstObject] objectForKey:@"msg"]);
        self.referralMessage.text = [[responseObject firstObject] objectForKey:@"msg"];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error){
        self.referralMessage.text = @"转诊失败";
    }];
}
- (IBAction)backButtonClicked:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (IBAction)terminalReferral:(id)sender {
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