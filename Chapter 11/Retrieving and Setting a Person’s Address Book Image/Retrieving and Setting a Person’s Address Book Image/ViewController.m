//
//  ViewController.m
//  Retrieving and Setting a Person’s Address Book Image
//
//  Created by Vandad Nahavandipoor on 21/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

NSString *const kDenied = @"Access to address book is denied";
NSString *const kRestricted = @"Access to address book is restricted";

ABAddressBookRef addressBook;

@implementation  ViewController

- (void) displayMessage:(NSString *)paramMessage{
    [[[UIAlertView alloc] initWithTitle:nil
                                message:paramMessage
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

- (UIImage *) getPersonImage:(ABRecordRef)paramPerson{
    
    UIImage *result = nil;
    
    if (paramPerson == NULL){
        NSLog(@"The person is nil.");
        return NULL;
    }
    
    NSData *imageData = (__bridge_transfer NSData *)
    ABPersonCopyImageData(paramPerson);
    
    if (imageData != nil){
        UIImage *image = [UIImage imageWithData:imageData];
        result = image;
    }
    
    return result;
    
}

- (BOOL) setPersonImage:(ABRecordRef)paramPerson
          inAddressBook:(ABAddressBookRef)paramAddressBook
          withImageData:(NSData *)paramImageData{
    
    BOOL result = NO;
    
    if (paramAddressBook == NULL){
        NSLog(@"The address book is nil.");
        return NO;
    }
    
    if (paramPerson == NULL){
        NSLog(@"The person is nil.");
        return NO;
    }
    
    CFErrorRef couldSetPersonImageError = NULL;
    
    BOOL couldSetPersonImage =
    ABPersonSetImageData(paramPerson,
                         (__bridge CFDataRef)paramImageData,
                         &couldSetPersonImageError);
    
    if (couldSetPersonImage){
        NSLog(@"Successfully set the person's image. Saving...");
        if (ABAddressBookHasUnsavedChanges(paramAddressBook)){
            BOOL couldSaveAddressBook = NO;
            CFErrorRef couldSaveAddressBookError = NULL;
            
            couldSaveAddressBook =
            ABAddressBookSave(paramAddressBook,
                              &couldSaveAddressBookError);
            
            if (couldSaveAddressBook){
                NSLog(@"Successfully saved the address book.");
                result = YES;
            } else {
                NSLog(@"Failed to save the address book.");
            }
        } else {
            NSLog(@"There are no changes to be saved!");
        }
    } else {
        NSLog(@"Failed to set the person's image.");
    }
    
    return result;
    
}

- (ABRecordRef) newPersonWithFirstName:(NSString *)paramFirstName
                              lastName:(NSString *)paramLastName
                         inAddressBook:(ABAddressBookRef)paramAddressBook{
    
    ABRecordRef result = NULL;
    
    if (paramAddressBook == NULL){
        NSLog(@"The address book is NULL.");
        return NULL;
    }
    
    if ([paramFirstName length] == 0 &&
        [paramLastName length] == 0){
        NSLog(@"First name and last name are both empty.");
        return NULL;
    }
    
    result = ABPersonCreate();
    
    if (result == NULL){
        NSLog(@"Failed to create a new person.");
        return NULL;
    }
    
    BOOL couldSetFirstName = NO;
    BOOL couldSetLastName = NO;
    CFErrorRef setFirstNameError = NULL;
    CFErrorRef setLastNameError = NULL;
    
    couldSetFirstName = ABRecordSetValue(result,
                                         kABPersonFirstNameProperty,
                                         (__bridge CFTypeRef)paramFirstName,
                                         &setFirstNameError);
    
    couldSetLastName = ABRecordSetValue(result,
                                        kABPersonLastNameProperty,
                                        (__bridge CFTypeRef)paramLastName,
                                        &setLastNameError);
    
    CFErrorRef couldAddPersonError = NULL;
    BOOL couldAddPerson = ABAddressBookAddRecord(paramAddressBook,
                                                 result,
                                                 &couldAddPersonError);
    
    if (couldAddPerson){
        NSLog(@"Successfully added the person.");
    } else {
        NSLog(@"Failed to add the person.");
        CFRelease(result);
        result = NULL;
        return result;
    }
    
    if (ABAddressBookHasUnsavedChanges(paramAddressBook)){
        
        CFErrorRef couldSaveAddressBookError = NULL;
        BOOL couldSaveAddressBook = ABAddressBookSave(paramAddressBook,
                                                      &couldSaveAddressBookError);
        
        if (couldSaveAddressBook){
            NSLog(@"Successfully saved the address book.");
        } else {
            NSLog(@"Failed to save the address book.");
        }
    }
    
    if (couldSetFirstName &&
        couldSetLastName){
        NSLog(@"Successfully set the first name and the last name of the person.");
    } else {
        NSLog(@"Failed to set the first name and/or last name of the person.");
    }
    
    return result;
    
}

- (void) changeYPositionOfView:(UIView *)paramView
                            to:(CGFloat)paramY{
    
    CGRect viewFrame = paramView.frame;
    viewFrame.origin.y = paramY;
    paramView.frame = viewFrame;
    
}

- (void) createLabelAndImageViewForOldImage{
    
    self.labelOldImage = [[UILabel alloc] initWithFrame:CGRectZero];
    self.labelOldImage.text = @"Old Image";
    self.labelOldImage.font = [UIFont systemFontOfSize:16.0f];
    [self.labelOldImage sizeToFit];
    self.labelOldImage.center = self.view.center;
    [self.view addSubview:self.labelOldImage];
    [self changeYPositionOfView:self.labelOldImage
                             to:80.0f];
    
    self.imageViewOld = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
                                                                      0.0f,
                                                                      100.0f,
                                                                      100.0f)];
    self.imageViewOld.center = self.view.center;
    self.imageViewOld.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageViewOld];
    [self changeYPositionOfView:self.imageViewOld
                             to:105.0f];
    
}

- (void) createLabelAndImageViewForNewImage{
    
    self.labelNewImage = [[UILabel alloc] initWithFrame:CGRectZero];
    self.labelNewImage.text = @"New Image";
    self.labelNewImage.font = [UIFont systemFontOfSize:16.0f];
    [self.labelNewImage sizeToFit];
    self.labelNewImage.center = self.view.center;
    [self.view addSubview:self.labelNewImage];
    [self changeYPositionOfView:self.labelNewImage
                             to:210.0f];
    
    self.imageViewNew = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f,
                                                                      0.0f,
                                                                      100.0f,
                                                                      100.0f)];
    self.imageViewNew.center = self.view.center;
    self.imageViewNew.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageViewNew];
    [self changeYPositionOfView:self.imageViewNew
                             to:235.0f];
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createLabelAndImageViewForOldImage];
    [self createLabelAndImageViewForNewImage];
    
}

- (ABRecordRef) getPersonWithFirstName:(NSString *)paramFirstName
                              lastName:(NSString *)paramLastName
                         inAddressBook:(ABRecordRef)paramAddressBook{
    
    ABRecordRef result = NULL;
    
    if (paramAddressBook == NULL){
        NSLog(@"The address book is null.");
        return NULL;
    }
    
    NSArray *allPeople = (__bridge_transfer NSArray *)
    ABAddressBookCopyArrayOfAllPeople(paramAddressBook);
    
    NSUInteger peopleCounter = 0;
    for (peopleCounter = 0;
         peopleCounter < [allPeople count];
         peopleCounter++){
        
        ABRecordRef person = (__bridge ABRecordRef)
        [allPeople objectAtIndex:peopleCounter];
        
        NSString *firstName = (__bridge_transfer NSString *)
        ABRecordCopyValue(person, kABPersonFirstNameProperty);
        
        NSString *lastName = (__bridge_transfer NSString *)
        ABRecordCopyValue(person, kABPersonLastNameProperty);
        
        BOOL firstNameIsEqual = NO;
        BOOL lastNameIsEqual = NO;
        
        if ([firstName length] == 0 &&
            [paramFirstName length] == 0){
            firstNameIsEqual = YES;
        }
        else if ([firstName isEqualToString:paramFirstName]){
            firstNameIsEqual = YES;
        }
        
        if ([lastName length] == 0 &&
            [paramLastName length] == 0){
            lastNameIsEqual = YES;
        }
        else if ([lastName isEqualToString:paramLastName]){
            lastNameIsEqual = YES;
        }
        
        if (firstNameIsEqual &&
            lastNameIsEqual){
            return person;
        }
        
    }
    
    return result;
    
}

- (void) updateImagesInAddressBook:(ABAddressBookRef)paramAddressBook{
    
    ABRecordRef anthonyRobbins = [self getPersonWithFirstName:@"Anthony"
                                                     lastName:@"Robbins"
                                                inAddressBook:paramAddressBook];
    
    if (anthonyRobbins == NULL){
        NSLog(@"Couldn't find record. Creating one...");
        anthonyRobbins = [self newPersonWithFirstName:@"Anthony"
                                             lastName:@"Robbins"
                                        inAddressBook:paramAddressBook];
        if (anthonyRobbins == NULL){
            NSLog(@"Failed to create a new record for this person.");
            return;
        }
    }
    
    self.imageViewOld.image = [self getPersonImage:anthonyRobbins];
    
    NSString *newImageFilePath =
    [[NSBundle mainBundle] pathForResource:@"Anthony Robbins"
                                    ofType:@"jpg"];
    
    UIImage *newImage = [[UIImage alloc]
                         initWithContentsOfFile:newImageFilePath];
    
    NSData *newImageData = UIImagePNGRepresentation(newImage);
    
    if ([self setPersonImage:anthonyRobbins
               inAddressBook:paramAddressBook
               withImageData:newImageData]){
        NSLog(@"Successfully set this person's new image.");
        self.imageViewNew.image = [self getPersonImage:anthonyRobbins];
    } else {
        NSLog(@"Failed to set this person's new image.");
    }
    
    CFRelease(anthonyRobbins);
    
}

- (void) viewDidAppear:(BOOL)paramAnimated{
    [super viewDidAppear:paramAnimated];
    
    CFErrorRef error = NULL;
    
    switch (ABAddressBookGetAuthorizationStatus()){
        case kABAuthorizationStatusAuthorized:{
            addressBook = ABAddressBookCreateWithOptions(NULL, &error);
            [self updateImagesInAddressBook:addressBook];
            if (addressBook != NULL){
                CFRelease(addressBook);
            }
            break;
        }
        case kABAuthorizationStatusDenied:{
            [self displayMessage:kDenied];
            break;
        }
        case kABAuthorizationStatusNotDetermined:{
            addressBook = ABAddressBookCreateWithOptions(NULL, &error);
            ABAddressBookRequestAccessWithCompletion
            (addressBook, ^(bool granted, CFErrorRef error) {
                if (granted){
                    [self updateImagesInAddressBook:addressBook];
                } else {
                    NSLog(@"Access was not granted");
                }
                if (addressBook != NULL){
                    CFRelease(addressBook);
                }
            });
            break;
        }
        case kABAuthorizationStatusRestricted:{
            [self displayMessage:kRestricted];
            break;
        }
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation
:(UIInterfaceOrientation)interfaceOrientation{
    return YES;
}

@end
