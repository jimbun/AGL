//
//  ViewController.m
//  AGL
//
//  Created by Jim Bun on 1/2/18.
//  Copyright © 2018 Jim Bun. All rights reserved.
//

#import "ViewController.h"


@implementation MyTableCell : UITableViewCell
@end


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray* rows;

@end

NSString *const PetTypeCat = @"Cat";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getListPeople];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getListPeople{
    NSURLSessionTask __unused *task = [HttpPeople listPeopleWithBlock:^(ListPerson* listPerson, NSError *error) {
        [self prepareTableRowsData:listPerson];
    }];
}

- (void)prepareTableRowsData:(ListPerson*) listPerson {
    
    NSArray* selectedList = [listPerson filterListWithPetType:PetTypeCat];
    
    for (Person* person in selectedList){
        [person.listPets sortByNameOrderedAcending:YES];
    }
    
    _rows = selectedList;
    
    //_rows = listPerson.list; //uncomment this to see the original list
    [_tableView reloadData];
}

#pragma mark - UITableView Delegate & DataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *) table {
    return _rows.count;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((Person*)[_rows objectAtIndex:section]).listPets.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath   {
    
    MyTableCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil ) {
        cell = [[MyTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    Pet* pet = (Pet*)[((Person*)[_rows objectAtIndex:indexPath.section]).listPets.list objectAtIndex:indexPath.row];
    //cell.name.text = [NSString stringWithFormat:@"%@ - %@", pet.name, pet.type];
    cell.name.text = pet.name;
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0f;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001f;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:FALSE];
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, 50.0f)];
    headerView.backgroundColor = [UIColor lightGrayColor];
    UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(10, 14, _tableView.frame.size.width - 20, 22)];
    title.text = ((Person*)[_rows objectAtIndex:section]).gender;
    [headerView addSubview:title];
    return headerView;
}

@end
