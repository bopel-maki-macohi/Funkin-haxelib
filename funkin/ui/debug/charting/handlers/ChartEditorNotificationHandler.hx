

class ChartEditorNotificationHandler
{
public static function setupNotifications(state:ChartEditorState):Void
{

NotificationManager.instance.animationFn = AnimateFromBottom;
}

public static function AnimateFromBottom(notifications:Array<Notification>):Array<AnimationBuilder>
{


for (notification in notifications)
{
{
}
}

}

/**
* Send a notification with a checkmark indicating success.
* @param state The current state of the chart editor.
*/
public static function success(state:ChartEditorState, title:String, body:String):Notification
{
}

/**
* Send a notification with a warning icon.
* @param state The current state of the chart editor.
*/
public static function warning(state:ChartEditorState, title:String, body:String):Notification
{
}

/**
* Send a notification with a warning icon.
* @param state The current state of the chart editor.
*/
public static inline function warn(state:ChartEditorState, title:String, body:String):Notification
{
}

/**
* Send a notification with a cross indicating an error.
* @param state The current state of the chart editor.
*/
public static function error(state:ChartEditorState, title:String, body:String):Notification
{
}

/**
* Send a notification with a cross indicating failure.
* @param state The current state of the chart editor.
*/
public static inline function failure(state:ChartEditorState, title:String, body:String):Notification
{
}

/**
* Send a notification with an info icon.
* @param state The current state of the chart editor.
*/
public static function info(state:ChartEditorState, title:String, body:String):Notification
{
}

/**
* Send a notification with an info icon and one or more actions.
* @param state The current state of the chart editor.
* @param title The title of the notification.
* @param body The body of the notification.
* @param actions The actions to add to the notification.
* @return The notification that was sent.
*/
public static function infoWithActions(state:ChartEditorState, title:String, body:String, actions:Array<NotificationActionData>):Notification
{
}

/**
* Clear all active notifications.
* @param state The current state of the chart editor.
*/
public static function clearNotifications(state:ChartEditorState):Void
{
NotificationManager.instance.clearNotifications();
}

/**
* Clear a specific notification.
* @param state The current state of the chart editor.
* @param notif The notification to clear.
*/
public static function clearNotification(state:ChartEditorState, notif:Notification):Void
{
NotificationManager.instance.removeNotification(notif);
}

static function sendNotification(state:ChartEditorState, title:String, body:String, ?type:NotificationType,
?actions:Array<NotificationActionData>):Notification
{

title: title,
body: body,
type: type ?? NotificationType.Default,
expiryMs: Constants.NOTIFICATION_DISMISS_TIME,
actions: actions

{
actionsContainer.walkComponents(function(component)
{
{
{
button.onClick = function(_)
{
}
}
}

}
}

typedef NotificationAction =
{
text:String,
callback:Void->Void
}
