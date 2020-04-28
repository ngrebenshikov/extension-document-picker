package extension.documentpicker;


import lime.system.CFFI;
import lime.system.JNI;


class DocumentPicker {
	
	
	public static function pick (types: Array<String>, callback: String -> Void) {
		
		#if android
		
		var resultJNI = extension_sample_method_jni(inputValue);
		var resultNative = extension_sample_method(inputValue);
		
		if (resultJNI != resultNative) {
			
			throw "Fuzzy math!";
			
		}
		
		return resultNative;

		#end
		
		#if ios
		
		native_pick(types, callback);
		
		#end
		
	}
	
	
	private static var native_pick= CFFI.load ("extension_document_picker", "extension_documt_picer_pick", 2);
	
	#if android
	private static var extension_sample_method_jni = JNI.createStaticMethod ("org.haxe.extension.Extension", "sampleMethod", "(I)I");
	#end
	
	
}