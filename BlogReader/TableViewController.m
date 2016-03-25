//
//  TableViewController.m
//  BlogReader
//
//  Created by Larissa Boatwright on 3/22/16.
//  Copyright © 2016 Jordin Marshall. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id) initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if(self){
        //custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
 
    NSURL *blogURL = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/dyntfataenic90z/codebeautify.json?dl=0"];
    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];
    NSError *error=nil;
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    //NSLog(@"%@",dataDictionary);
    
    self.blogPosts = [NSMutableArray array];
    self.blogName = [NSMutableArray array];
    
    NSArray *blogPostsArray =[dataDictionary valueForKeyPath:@"entry"];
    
    for (NSDictionary *bpDictionary in blogPostsArray){
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[bpDictionary valueForKeyPath:@"title.__cdata"]];
        blogPost.name = [bpDictionary valueForKeyPath:@"author.name"];
        blogPost.date = [bpDictionary valueForKeyPath:@"published"];
        blogPost.url = [NSURL URLWithString:[bpDictionary valueForKey:@"id"]];
        [self.blogPosts addObject:blogPost];
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.blogPosts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"chelsea.jpg"];
    
    // Configure the cell...
    cell.textLabel.text = blogPost.__cdata;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Author: %@, Published: %@",blogPost.name, blogPost.date];
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"preparing for seque: %@", segue.identifier);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   //NSLog(@"Row selected: %ld", (long)indexPath.row);
    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
    UIApplication *application = [UIApplication sharedApplication];
    
    [application openURL:blogPost.url];
   
   
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
