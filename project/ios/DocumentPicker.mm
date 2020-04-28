#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <hx/CFFI.h>


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

        UIDocumentPicerViewController *controller = [[UIDocumentPicerViewController alloc] initWithDocumentTypes:allowedUTIs inMode:UIDocumentPickerModeImport];
        DocumentPickerDelegate * delegate = [[DocumentPickerDelegate alloc] initWithCallback: callback];

        [controller delegate:delegate];

    }
}