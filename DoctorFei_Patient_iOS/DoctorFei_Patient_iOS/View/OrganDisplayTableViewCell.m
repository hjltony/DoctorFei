//
//  OrganDisplayTableViewCell.m
//  DoctorFei_Patient_iOS
//
//  Created by GuJunjia on 15/2/27.
//
//

#import "OrganDisplayTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "NSString+Crypt.h"
@interface OrganDisplayTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *hospitalName;
@property (weak, nonatomic) IBOutlet UILabel *officeOrg;
@property (weak, nonatomic) IBOutlet UIImageView *hospitalImage;
@property (weak, nonatomic) IBOutlet UILabel *rate;

@end
@implementation OrganDisplayTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setCellData:(NSDictionary *)data withType:(OrganType)type{
    if (type == OrganTypeShow)
    {
        self.hospitalName.text = [data objectForKey:@"name"];
        self.officeOrg.text = [data objectForKey:@"officeorg"];
        [self.hospitalImage sd_setImageWithURL:[NSURL URLWithString:[[data objectForKey:@"picture"] urlAutoCompelete]]placeholderImage:[UIImage imageNamed:@"hospital_pic.png"]];
        self.rate.text = @"";
    }
    if (type == OrganTypeOutstanding){
        self.hospitalName.text = [data objectForKey:@"name"];
        self.officeOrg.text = [data objectForKey:@"info"];
        [self.hospitalImage sd_setImageWithURL:[NSURL URLWithString:[[data objectForKey:@"picture"] urlAutoCompelete]]placeholderImage:[UIImage imageNamed:@"hospital_pic.png"]];
        self.rate.text = @"";
    }
    if (type == OrganTypeNursing){
        self.hospitalName.text = [data objectForKey:@"name"];
        self.officeOrg.text = [data objectForKey:@"info"];
        if ([[data objectForKey:@"sex"] isEqualToString:@"0"])
            self.rate.text = @"女";
        else
            self.rate.text = @"男";
        [self.hospitalImage sd_setImageWithURL:[NSURL URLWithString:[[data objectForKey:@"icon"] urlAutoCompelete]] placeholderImage:[UIImage imageNamed:@"hospital_pic.png"]];
    }
}
@end
