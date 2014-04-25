package admob;

import flash.Lib;

class AD {
	public static var LEFT : Int = 0;
	public static var RIGHT : Int = 1;
	public static var CENTER : Int = 2;
	public static var TOP : Int = 0;
	public static var BOTTOM : Int = 1;
	
	public static var BANNER_PORTRAIT : Int = 0;
	public static var BANNER_LANDSCAPE : Int = 1;
	
	private static var admobID : String;
	private static var originX : Int = 0;
	private static var originY : Int = 0;
	private static var bannerSize : Int = 0;
	private static var testMode : Bool = false;

	private static var admobInterstitialID:String;
	private static var testModeInterstitial:Bool;

#if android
	private static var _initAd_func : Dynamic;
	private static var _hideAd_func : Dynamic;
	private static var _showAd_func : Dynamic;
	private static var _initInterstitial_func : Dynamic;
	private static var _showInterstitial_func : Dynamic;

	
	public static function init(id : String, x : Int = 0, y : Int = 0, size : Int = 0, test : Bool = false) {
		admobID = id;
		originX = x;
		originY = y;
		bannerSize = size;
		testMode = test;
		
		// call API
		if (_initAd_func == null) {
			_initAd_func = openfl.utils.JNI.createStaticMethod("org.haxe.lime.GameActivity", "initAd",
				"(Ljava/lang/String;IIZ)V", true);
		}

		var args = new Array<Dynamic>();
		args.push(admobID);
		args.push(originX);
		args.push(originY);
		args.push(testMode);
		_initAd_func(args);
	}

	public static function show() : Void {
		if (_showAd_func == null) {
			_showAd_func = openfl.utils.JNI.createStaticMethod("org.haxe.lime.GameActivity", "showAd", "()V", true);
		}
		
		_showAd_func(new Array<Dynamic>());
	}
	
	public static function hide() : Void {
		if (_hideAd_func == null) {
			_hideAd_func = openfl.utils.JNI.createStaticMethod("org.haxe.lime.GameActivity", "hideAd", "()V", true);
		}
		
		_hideAd_func(new Array<Dynamic>());
	}

	public static function refresh() : Void {
	}

	public static function initInterstitial(id : String, test : Bool = false) {
		admobInterstitialID = id;
		testModeInterstitial = test;

		// call API
		if (_initInterstitial_func == null) {
			_initInterstitial_func = openfl.utils.JNI.createStaticMethod(
				"org.haxe.lime.GameActivity", "initInterstitial", "(Ljava/lang/String;Z)V", true
			);
		}

		var args = new Array<Dynamic>();
		args.push(admobInterstitialID);
		args.push(testModeInterstitial);
		_initInterstitial_func(args);
	}

	public static function showInterstitial() : Void {
		if (_showInterstitial_func == null) {
			_showInterstitial_func = openfl.utils.JNI.createStaticMethod(
				"org.haxe.lime.GameActivity", "showInterstitial", "()V", true
			);
		}

		_showInterstitial_func(new Array<Dynamic>());
	}
	
#elseif ios
	public static function init(id : String, x : Int = 0, y : Int = 0, size : Int = 0, test : Bool = false) {
		admobID = id;
		originX = x;
		originY = y;
		bannerSize = size;
		testMode = test;
		
		admob_ad_init(admobID, originX, originY, bannerSize, testMode);
	}
	
	public static function show() : Void {
		admob_ad_show();
	}
	
	public static function hide() : Void {
		admob_ad_hide();
	}
	
	public static function refresh() : Void {
		admob_ad_refresh();
	}

	public static function initInterstitial(id : String, test : Bool = false) {
		admobInterstitialID = id;
		testModeInterstitial = test;

		admob_ad_init_interstitial(admobInterstitialID, testModeInterstitial);
	}

	public static function showInterstitial() : Void {
		admob_ad_show_interstitial();
	}

	private static var admob_ad_init = flash.Lib.load("admob", "admob_ad_init", 5);
	private static var admob_ad_show = flash.Lib.load("admob", "admob_ad_show", 0);
	private static var admob_ad_hide = flash.Lib.load("admob", "admob_ad_hide", 0);
	private static var admob_ad_refresh = flash.Lib.load("admob", "admob_ad_refresh", 0);
	private static var admob_ad_init_interstitial = flash.Lib.load("admob", "admob_ad_init_interstitial", 2);
	private static var admob_ad_show_interstitial = flash.Lib.load("admob", "admob_ad_show_interstitial", 0);

#else
	public static function init(id : String, x : Int = 0, y : Int = 0, size : Int = 0, test : Bool = false) {
	}
	public static function show() : Void {
	}
	public static function hide() : Void {
	}
	public static function refresh() : Void {
	}
	public static function initInterstitial(id : String, test : Bool = false) {
	}
	public static function showInterstitial() : Void {
	}
#end
}
