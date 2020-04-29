package extension.documentpicker;


import lime.system.CFFI;
import lime.system.JNI;


class DocumentPicker {
	
	
	public static function pick (types: Array<String>, callback: String -> Void) {

		#if ios
		native_pick(types, callback);
		#end

		#if android
		native_pick(types, { callback: callback });
		#end
	}
	
	#if ios
	private static var native_pick= CFFI.load ("extension_document_picker", "extension_document_picker_pick", 2);
	#end
	
	#if android
	private static var native_pick = JNI.createStaticMethod ("org.haxe.extension.DocumentPickerExtension", "pick", "([Ljava/lang/String;Lorg/haxe/lime/HaxeObject;)V");
	#end
	
	
}