#include <hx/CFFI.h>

#include "AD.h"

using namespace admobIOS;


extern "C" void admob_main() {
}
DEFINE_ENTRY_POINT(admob_main);

extern "C" int admob_register_prims() {
	return 0;
}


value admob_ad_init(value id, value x, value y, value size, value testMode) {
	initAd(val_string(id), val_int(x), val_int(y), val_int(size), val_bool(testMode));
	return alloc_null();
}
DEFINE_PRIM(admob_ad_init, 5);

value admob_ad_show() {
	showAd();
	return alloc_null();
}
DEFINE_PRIM(admob_ad_show, 0);

value admob_ad_hide() {
	hideAd();
	return alloc_null();
}
DEFINE_PRIM(admob_ad_hide,0);

value admob_ad_refresh() {
	refreshAd();
	return alloc_null();
}
DEFINE_PRIM(admob_ad_refresh,0);

value admob_ad_init_interstitial(value id, value testMode) {
	initInterstitial(val_string(id), val_bool(testMode));
	return alloc_null();
}
DEFINE_PRIM(admob_ad_init_interstitial, 2);

value admob_ad_show_interstitial() {
	showInterstitial();
	return alloc_null();
}
DEFINE_PRIM(admob_ad_show_interstitial, 0);
