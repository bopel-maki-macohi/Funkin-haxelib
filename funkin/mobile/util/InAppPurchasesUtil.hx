package funkin.mobile.util;


/**
* Provides utility functions for working with in-app purchases.
*/
class InAppPurchasesUtil
{
/**
* The product ID used for the "No Ads" in-app purchase upgrade.
*/
public static final UPGRADE_PRODUCT_ID:String = 'no_ads';


/**
* A static variable that holds an array of currently loaded product details for in-app purchases.
*/

/**
* A static variable that holds an array of currently purchased for in-app purchases.
*/

/**
* Initializes the in-app purchases utility.
*/
public static function init():Void
{
IAPAndroid.onLog.add(function(message:String):Void
{
});

IAPAndroid.onBillingSetupFinished.add(function(result:IAPResult):Void
{
{
}

IAPAndroid.queryPurchases();

IAPAndroid.queryProductDetails([UPGRADE_PRODUCT_ID]);
});

IAPAndroid.onBillingServiceDisconnected.add(function():Void
{
});

IAPAndroid.onProductDetailsResponse.add(function(result:IAPResult, productDetails:Array<IAPProductDetails>):Void
{
{
hasInitialized = true;
currentProductDetails = productDetails;
}
else
{
hasInitialized = false;
}
});

IAPAndroid.onQueryPurchasesResponse.add(function(result:IAPResult, purchases:Array<IAPPurchase>):Void
{
else
{
}
});

IAPAndroid.onPurchasesUpdated.add(function(result:IAPResult, purchases:Array<IAPPurchase>):Void
{
else
{
}
});

IAPAndroid.onAcknowledgePurchaseResponse.add(function(result:IAPResult):Void
{
else
{
}
});

IAPAndroid.init();

IAPAndroid.startConnection();
IAPIOS.onProductDetailsReceived.add(function(productDetails:Array<IAPProductDetails>):Void
{
{
currentProductDetails = productDetails;
}
});

IAPIOS.onProductDetailsFailed.add(function(error:IAPError):Void
{
hasInitialized = false;
});

IAPIOS.onPurchasesUpdated.add(function(purchases:Array<IAPPurchase>):Void
{
handlePurchases(purchases);
hasInitialized = true;
});

IAPIOS.init();

IAPIOS.restorePurchases();

IAPIOS.requestProducts([UPGRADE_PRODUCT_ID]);
}

/**
* Restores previously made in-app purchases for the current user.
*/
public static function restorePurchases():Void
{
IAPAndroid.queryPurchases();
IAPIOS.restorePurchases();
}

/**
* Initiates the purchase process for the specified item.
*
* @param id The identifier of the item to be purchased.
* @param onPurchased The function to be called when the the product is purchased.
*/
public static function purchase(id:String, onPurchased:Void->Void):Void
{
for (product in currentProductDetails)
{
{
function purchasesUpdatedEvent(result:IAPResult, purchases:Array<IAPPurchase>):Void
{
{
for (purchase in purchases)
{
{
{

IAPAndroid.onPurchasesUpdated.remove(purchasesUpdatedEvent);
}
}
}
}
else
{
IAPAndroid.onPurchasesUpdated.remove(purchasesUpdatedEvent);
}


{
Toast.makeText(debugMessage, Toast.LENGTH_SHORT);
}
}

{
IAPAndroid.onPurchasesUpdated.add(purchasesUpdatedEvent);
}

IAPAndroid.launchPurchaseFlow(product);
}
{
function purchasesUpdatedEvent(purchases:Array<IAPPurchase>):Void
{
for (purchase in purchases)
{
{
switch (purchase.getTransactionState())
{
case IAPPurchaseState.PURCHASED:

IAPIOS.onPurchasesUpdated.remove(purchasesUpdatedEvent);
case IAPPurchaseState.FAILED:
IAPIOS.onPurchasesUpdated.remove(purchasesUpdatedEvent);
default:
}
}
}
}

{
IAPIOS.onPurchasesUpdated.add(purchasesUpdatedEvent);
}

IAPIOS.purchaseProduct(product);
}
}

}

/**
* Checks if the specified product ID is already purchased.
*
* @param id The product ID to check.
*
* @return `true` if the product is already purchased and acknowledged, false otherwise.
*/
public static function isPurchased(id:String):Bool
{
for (purchase in currentPurchased)
{
{
}
{
}
}

}

private static function handlePurchases(purchases:Array<IAPPurchase>):Void
{
for (purchase in purchases)
{
{
{
IAPAndroid.acknowledgePurchase(purchase.getPurchaseToken());
}


for (existing in currentPurchased)
{
{
alreadyTracked = true;
break;
}
}

{
currentPurchased.push(purchase);
}
else
{
}
}
else
{
}


for (existing in currentPurchased)
{
{
alreadyTracked = true;
break;
}
}

switch (purchase.getTransactionState())
{
case IAPPurchaseState.PURCHASING:
case IAPPurchaseState.DEFERRED:
case IAPPurchaseState.FAILED:
case IAPPurchaseState.PURCHASED | IAPPurchaseState.RESTORED:

{
currentPurchased.push(purchase);


IAPIOS.finishPurchase(purchase);
}
else
{
}
}
}
}
}
