

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
}
else
{
}
})
}
else
{
}
}

/**
* Opens the merch referral page.
*/
public static function doMerchReferral():Void
{
}
}
