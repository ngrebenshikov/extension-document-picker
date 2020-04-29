@class DocumentPickerDelegate;

@interface DocumentPickerDelegate : NSObject<UIDocumentPickerDelegate>
- (id) initWithCallback:(value) cb;
@end