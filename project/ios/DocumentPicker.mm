#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <hx/CFFI.h>

#include "DocumentPickerDelegate.h"

namespace extension_document_picker {
    void pick(value haxeAllowedUTIs, value callback) {
        int n = 0;
        if (haxeAllowedUTIs != NULL) {
            n = val_array_size(haxeAllowedUTIs);
        }

        NSMutableArray<NSString *> * allowedUTIs = [[NSMutableArray alloc] init];

        for (int i=0;i<n;++i) {
            [allowedUTIs addObject:[NSString stringWithUTF8String:val_string(val_array_i(haxeAllowedUTIs, i))]];
        }

        UIDocumentPickerViewController *picker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:allowedUTIs inMode:UIDocumentPickerModeImport];
        DocumentPickerDelegate * pickerDelegate = [[DocumentPickerDelegate alloc] initWithCallback: callback];

        picker.delegate = pickerDelegate;
        picker.modalPresentationStyle = UIModalPresentationFormSheet;

        [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:picker animated:YES completion:nil];

    }
}