#include <AD.h>
#import <UIKit/UIKit.h>
#import <GADBannerView.h>
#import <GADInterstitial.h>

namespace admobIOS {

    static GADBannerView *bannerView_;
	static UIViewController *rootView;
    static bool testAds;
    
    static GADInterstitial *interstitial_;
    static bool testInterstitial;
	
	void initAd(const char *ID, int x, int y, int size, bool testMode) {
		testAds = testMode;
		rootView = [[[UIApplication sharedApplication] keyWindow] rootViewController];
		
		NSString *GADID = [[NSString alloc] initWithUTF8String: ID];

		if (size == 0) {
			bannerView_ = [[GADBannerView alloc] initWithAdSize : kGADAdSizeSmartBannerPortrait];
		}
		else if (size == 1) {
			bannerView_ = [[GADBannerView alloc] initWithAdSize : kGADAdSizeSmartBannerLandscape];
		}
		
		int xPos = 0;
		int yPos = 0;
		
		if (x == 1) {
			xPos = rootView.view.frame.size.width - bannerView_.bounds.size.width;
		}
		else if (x == 2) {
			xPos = (rootView.view.frame.size.width - bannerView_.bounds.size.width) / 2;
		}
		
		if (y == 1) {
			yPos = rootView.view.frame.size.height - bannerView_.bounds.size.height;
		}
		else if (y == 2) {
			yPos = (rootView.view.frame.size.height - bannerView_.bounds.size.height) / 2;
		}
		
		[bannerView_ setFrame: CGRectMake(
			xPos,
			yPos,
			bannerView_.bounds.size.width,
			bannerView_.bounds.size.height
		)];
			
		bannerView_.adUnitID = GADID;
		bannerView_.rootViewController = rootView;

		refreshAd();
	}
    
    void showAd() {
		[rootView.view addSubview: bannerView_];
    }
    
    void hideAd() {
		[bannerView_ removeFromSuperview];
    }
    
	void refreshAd() {
		GADRequest *request = [[GADRequest alloc] init];
		if (testAds) { 
			request.testing = YES;
			request.testDevices = [NSArray arrayWithObjects: 
						GAD_SIMULATOR_ID,
						nil];
		}
        
		[bannerView_ loadRequest:request];
	}
    
	void initInterstitial(const char *ID, bool testMode) {
		testInterstitial = testMode;
		
		NSString *GADID = [[NSString alloc] initWithUTF8String: ID];
        
        interstitial_ = [[GADInterstitial alloc] init];
        interstitial_.adUnitID = GADID;
		//interstitial_.rootViewController = rootView;
        
		GADRequest *request = [[GADRequest alloc] init];
		if (testInterstitial) {
			request.testing = YES;
			request.testDevices = [NSArray arrayWithObjects:
                                   GAD_SIMULATOR_ID,
                                   nil];
		}
        
        [interstitial_ loadRequest:[GADRequest request]];
	}
    
    void showInterstitial() {
		//[rootView.view addSubview: interstitial_];
		rootView = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        [interstitial_ presentFromRootViewController:rootView];
    }
    
}
