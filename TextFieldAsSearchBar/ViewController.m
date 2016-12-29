//
//  ViewController.m
//  TextFieldAsSearchBar
//
//  Created by Kumar on 12/05/16.
//  Copyright © 2016 Kumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    NSMutableArray *arrOfColor;
    NSMutableArray *searchArray;
    NSString *searchTextString;
    BOOL isFilter;
}
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UITableView *colorTableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    arrOfColor=[NSMutableArray arrayWithObjects:@"Red",@"Green",@"Blue",@"Gray",@"Black",@"White",@"Yellow",@"Brown",@"Pink",nil];
    
    [self.searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isFilter)
    {
        return [searchArray count];
    }
    else
        return  [arrOfColor count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if(isFilter)
    {
        cell.textLabel.text=[searchArray objectAtIndex:indexPath.row];
    }
    else
    {
          cell.textLabel.text=[arrOfColor objectAtIndex:indexPath.row];
    }
  
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(isFilter)
    {
        _searchTextField.text=[searchArray objectAtIndex:indexPath.row];
    }
    else
    {
        _searchTextField.text=[arrOfColor objectAtIndex:indexPath.row];
    }
   
}

-(void)textFieldDidChange:(UITextField *)textField
{
    searchTextString=textField.text;
    [self updateSearchArray:searchTextString];
}
-(void)updateSearchArray:(NSString *)searchText
{
    if(searchText.length==0)
    {
        isFilter=NO;
    }
    else{
        
        isFilter=YES;
        searchArray=[[NSMutableArray alloc]init];
        for(NSString *string in arrOfColor){
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                [searchArray addObject:string];
            }
        }
         [self.colorTableview reloadData];}
    }
   
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
