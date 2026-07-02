

/**
* Provides utility functions for working with in-app reviews.
* @see https://developer.android.com/guide/playcore/in-app-review
*/
class InAppReviewUtil
{
/**
* Chance for exiting the Results screen to display a prompt to review the game, as a percent.
*/

/**
* Initializes callbacks tied to the In-App Review functionality.
*/
public static function init():Void
{

IAR.onLog.add(function(message:String):Void
{
IAR.onReviewCompleted.add(function(success:Bool):Void
{
IAR.onReviewError.add(function(message:String):Void
{
}

/**
* When called, displays a card which prompts the user to provide a review of the game,
* which will be posted to the respective app store.
*
* Google Play will throttle this for us t
*/
public static function requestReview():Void
{

}
}
