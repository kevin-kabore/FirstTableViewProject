//
//  ViewController.m
//  FirstTableViewProject
//
//  Created by Kevin Kabore on 3/22/16.
//  Copyright © 2016 Kevin Kabore. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSDictionary *courseDetails;
    NSArray *courseNames;
    
    NSDictionary *webCourseDetails;
    NSArray *webCourseNames;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return @"iOS courses";
    } else {
        return @"Web Courses";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    if (section ==0){
    
        return courseDetails.count;
    
    } else {
      
        return webCourseDetails.count;
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UITableViewCell * cell =  [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"] ;

    //Create cell
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    UIImage *myImage = [UIImage imageNamed:@"DemoCellImage"];
    [cell.imageView setImage:myImage];
    
    if (indexPath.section == 0){
        cell.textLabel.text = courseNames[indexPath.row];
        cell.detailTextLabel.text = courseDetails[courseNames[indexPath.row]];
    } else{
        cell.textLabel.text = webCourseNames[indexPath.row];
        cell.detailTextLabel.text = webCourseDetails[webCourseNames[indexPath.row]];
    }
    
    
    //fill cell
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"courses" withExtension:@"plist"];
    
    //Load the plist into a dictionary
    courseDetails = [NSDictionary dictionaryWithContentsOfURL:url];
    
    //fill an array with just the keys
    courseNames = courseDetails.allKeys;
    
    NSURL *webUrl = [[NSBundle mainBundle]URLForResource:@"courses_web" withExtension:@"plist"];
    
//    Load the plist into the dictionary
    webCourseDetails = [NSDictionary dictionaryWithContentsOfURL:webUrl];
    
//    fill the arry with just the keys
    webCourseNames = webCourseDetails.allKeys;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
