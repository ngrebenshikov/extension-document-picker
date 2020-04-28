#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <hx/CFFI.h>

@implementation CallbacksDelegate

AutoGCRoot* callback = 0;

- (id) initWithCallback(value cb) {
    callback = new AutoGCRoot(cb);
}

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls {
}

- (void)documentPickerWasCancelled:(UIDocumentPickerViewController *)controller {
}

@end