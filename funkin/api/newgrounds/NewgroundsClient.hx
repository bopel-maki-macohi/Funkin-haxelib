

class NewgroundsClient
{




static function get_instance():NewgroundsClient
{
}


private function new()
{


{
}

{

}
}

public function init()
{




{
}
else
{
}
}

/**
* Attempt to log into Newgrounds and create a session ID.
* @param onSuccess An optional callback for when the login is successful.
* @param onError An optional callback for when the login fails.
*/
public function login(?onSuccess:Void->Void, ?onError:Void->Void):Void
{
{
}
{
}

{
{

WebViewUtil.openURL(passportUrl, function():Void
{

}
else

{
}
else
{
}
}

public function autoLogin(?onSuccess:Void->Void, ?onError:Void->Void):Void
{
{
}

{

{
}
else
{
}
}

/**
* Log out of Newgrounds and invalidate the current session.
* @param onSuccess An optional callback for when the logout is successful.
*/
public function logout(?onSuccess:Void->Void, ?onError:Void->Void):Void
{
{
{
}
else
{
}
}

Save.instance.ngSessionId.value = null;
}

/**
* @return `true` if the user is logged in to Newgrounds.
*/
public function isLoggedIn():Bool
{
}

/**
* @returns `false` if either the app ID or the encryption key is invalid.
*/
static function hasValidCredentials():Bool
{
|| API_NG_APP_ID == ""
|| (API_NG_APP_ID != null && API_NG_APP_ID.contains(" "))
|| API_NG_ENC_KEY == null
|| API_NG_ENC_KEY == ""
}

function onLoginResolved(outcome:LoginOutcome):Void
{

switch (outcome)
{
case SUCCESS:
case FAIL(result):
}
}

function onLoginResolvedWithCallbacks(outcome:LoginOutcome, onSuccess:Void->Void, onError:Void->Void):Void
{

switch (outcome)
{
case SUCCESS:
case FAIL(result):
}
}

function onLogoutResolved(outcome:Outcome<CallError>):Void
{
switch (outcome)
{
case SUCCESS:
case FAIL(result):
}
}

function onLogoutResolvedWithCallbacks(outcome:Outcome<CallError>, onSuccess:Void->Void, onError:Void->Void):Void
{

switch (outcome)
{
case SUCCESS:
case FAIL(result):
}
}

function onLoginSuccessful():Void
{


Save.instance.ngSessionId.value = NG.core.sessionId;



}

function onLoginFailed(result:LoginFail):Void
{
switch (result)
{
case CANCELLED(type):
switch (type)
{
case PASSPORT:
case MANUAL:
default:
}
case ERROR(error):
switch (error)
{
case HTTP(error):
case RESPONSE(error):
case RESULT(error):
default:
}
default:
}
}

function onLogoutSuccessful():Void
{
}

function onLogoutFailed(result:CallError):Void
{
switch (result)
{
case HTTP(error):
case RESPONSE(error):
case RESULT(error):
default:
}
}

function onFetchedMedals(outcome:Outcome<CallError>):Void
{
}

function onFetchedLeaderboards(outcome:Outcome<CallError>):Void
{

}

function onFetchedSaveSlots(outcome:Outcome<CallError>):Void
{

NGSaveSlot.instance.checkSlot();
}

function get_user():Null<User>
{
}

function get_medals():Null<MedalList>
{
}

function get_leaderboards():Null<ScoreBoardList>
{
}

function get_saveSlots():Null<SaveSlotList>
{
}

static function getSessionId():Null<String>
{

}
}

/**
* Wrapper for `NewgroundsClient` that prevents submitting cheated data.
*/
class NewgroundsClientSandboxed
{

static function get_user()
{
}

public static function isLoggedIn()
{
}
}
