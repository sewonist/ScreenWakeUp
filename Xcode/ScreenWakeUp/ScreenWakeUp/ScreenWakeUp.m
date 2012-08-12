//
//  ScreenWakeUp.m
//  ScreenWakeUp
//
//  Created by sewonist on 12. 7. 31..
//  Copyright (c) 2012 it point lab All rights reserved.
//

#import "ScreenWakeUp.h"

@implementation ScreenWakeUp

@end

FREObject isSupported(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[] ){
    FREObject retVal;
    if(FRENewObjectFromBool(YES, &retVal) == FRE_OK){
        return retVal;
    }else{
        return nil;
    }
}

FREObject lock(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[] ){
    //Temporary values to hold our actionscript code.
    uint32_t boolean;
    
    //Turn our actionscrpt code into native code.
    FREGetObjectAsBool(argv[0], &boolean);
    
    if(boolean){
        [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    } else {
        [[UIApplication sharedApplication] setIdleTimerDisabled:NO];
    }
    return nil;
}

void ContextInitializer(void* extData, const uint8_t * ctxType, FREContext ctx, 
                        uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) 
{
    int count=2;
    
    *numFunctionsToTest = count;
    
	FRENamedFunction* func = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * count);
    
    func[0].name = (const uint8_t *) "isSupported";
    func[0].functionData = NULL;
    func[0].function = &isSupported;
    
    func[1].name = (const uint8_t *) "lock";
    func[1].functionData = NULL;
    func[1].function = &lock;
    
    *functionsToSet = func;
}

void ContextFinalizer(FREContext ctx) {
	return;
}

void ExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, 
                    FREContextFinalizer* ctxFinalizerToSet) {
    *extDataToSet = NULL;
    *ctxInitializerToSet = &ContextInitializer;
    *ctxFinalizerToSet = &ContextFinalizer;
}

void ExtFinalizer(void* extData) {
    return;
}
