package funkin.api.newgrounds;


/**
* Handles referrals to links retrieved from the Newgrounds API.
*/
class Referral
{
/**
* Opens the referral page with the given name.
* @param referralName The name of the referral.
* @param fallbackUrl The URL to open if the referral fails or is not available.
*/
static function doReferral(referralName:String, fallbackUrl:String):Void
{
{
NG.core?.calls.loader.loadReferral(false)
.addComponentParameter("referral_name", referralName)
.addResponseHandler(response ->
{
{
WindowUtil.openURL(response.result.data.url);
}
else
{
WindowUtil.openURL(fallbackUrl);
}
})
.send();
}
else
{
WindowUtil.openURL(fallbackUrl);
}
WindowUtil.openURL(fallbackUrl);
}

/**
* Opens the merch referral page.
*/
public static function doMerchReferral():Void
{
doReferral("merch_link", Constants.URL_MERCH_FALLBACK);
}
}
