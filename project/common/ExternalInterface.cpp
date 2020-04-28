#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>
#include "DocumentPicker.h"

static value extension_document_picker_pick (value allowedUTIs, value callback) {
	extension_document_picker::pick(allowedUTIs, callback);
	return alloc_null();
}
DEFINE_PRIM (extension_document_picker_pick, 2);



extern "C" void extension_document_picker_main () {
	
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (extension_document_picker_main);



extern "C" int extension_register_prims () { return 0; }