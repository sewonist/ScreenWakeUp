//
//  ScreenWakeUp.m
//  ScreenWakeUp
//
//  Created by ahn sewon on 12. 7. 31..
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

// ContextInitializer()
//
// The context initializer is called when the runtime creates the extension context instance.
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


// ContextFinalizer()
//
// The context finalizer is called when the extension's ActionScript code
// calls the ExtensionContext instance's dispose() method.
// If the AIR runtime garbage collector disposes of the ExtensionContext instance, the runtime also calls
// ContextFinalizer().

void ContextFinalizer(FREContext ctx) {
	return;
}

// NativeDialogExtInitializer()
//
// The extension initializer is called the first time the ActionScript side of the extension
// calls ExtensionContext.createExtensionContext() for any context.
void ExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, 
                    FREContextFinalizer* ctxFinalizerToSet) {
    *extDataToSet = NULL;
    *ctxInitializerToSet = &ContextInitializer;
    *ctxFinalizerToSet = &ContextFinalizer;
}

// NativeDialogExtFinalizer()
//
// The extension finalizer is called when the runtime unloads the extension. However, it is not always called.
void ExtFinalizer(void* extData) {
    return;
}
