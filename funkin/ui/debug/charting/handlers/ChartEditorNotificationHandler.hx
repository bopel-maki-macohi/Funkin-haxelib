package funkin.ui.debug.charting.handlers;


class ChartEditorNotificationHandler
{
public static function setupNotifications(state:ChartEditorState):Void
{
NotificationManager.GUTTER_SIZE = 45;

NotificationManager.instance.animationFn = AnimateFromBottom;
}

public static function AnimateFromBottom(notifications:Array<Notification>):Array<AnimationBuilder>
{


for (notification in notifications)
{
builder.setPosition(0, "top", Std.int(notification.top), true);
builder.setPosition(100, "top", Std.int(baselineY - notification.height), true);
{
builder.setPosition(0, "opacity", 0, true);
builder.setPosition(100, "opacity", 1, true);
}
builders.push(builder);
baselineY -= (notification.height + @:privateAccess NotificationManager.SPACING);
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
});

{
actionsContainer.walkComponents(function(component)
{
{
{
button.onClick = function(_)
{
action.callback(action);
};
}
}
});
}

}
}

typedef NotificationAction =
{
text:String,
callback:Void->Void
}
