package funkin.api.newgrounds;


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
NG.create(API_NG_APP_ID, getSessionId(), #if FEATURE_NEWGROUNDS_DEBUG true #else false #end, onLoginResolved);

NG.core.setupEncryption(API_NG_ENC_KEY);
}
}

public function init()
{


NG.core.verbose = true;

NG.core.onLogin.add(onLoginSuccessful);

{
}
else
{
this.autoLogin();
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
NG.core.logVerbose('Loading passport from WebView: ${passportUrl}');

WebViewUtil.openURL(passportUrl, function():Void
{
NG.core.cancelLoginRequest();
});

NG.core.onPassportUrlOpen();
}
else
NG.core.logError("Cannot open passport");
NG.core.openPassportUrl();
};

{
NG.core.requestLogin(onLoginResolvedWithCallbacks.bind(_, onSuccess, onError), passportHandler);
}
else
{
NG.core.requestLogin(onLoginResolved, passportHandler);
}
}

public function autoLogin(?onSuccess:Void->Void, ?onError:Void->Void):Void
{
{
}

{
NG.core.cancelLoginRequest();
};

{
NG.core.requestLogin(onLoginResolvedWithCallbacks.bind(_, onSuccess, onError), dummyPassport);
}
else
{
NG.core.requestLogin(onLoginResolved, dummyPassport);
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
NG.core.logOut(onLogoutResolvedWithCallbacks.bind(_, onSuccess, onError));
}
else
{
NG.core.logOut(onLogoutResolved);
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
|| (API_NG_ENC_KEY != null && API_NG_ENC_KEY.contains(" ")));
}

function onLoginResolved(outcome:LoginOutcome):Void
{
WebViewUtil.close();

switch (outcome)
{
case SUCCESS:
onLoginSuccessful();
case FAIL(result):
onLoginFailed(result);
}
}

function onLoginResolvedWithCallbacks(outcome:LoginOutcome, onSuccess:Void->Void, onError:Void->Void):Void
{
onLoginResolved(outcome);

switch (outcome)
{
case SUCCESS:
onSuccess();
case FAIL(result):
onError();
}
}

function onLogoutResolved(outcome:Outcome<CallError>):Void
{
switch (outcome)
{
case SUCCESS:
onLogoutSuccessful();
case FAIL(result):
onLogoutFailed(result);
}
}

function onLogoutResolvedWithCallbacks(outcome:Outcome<CallError>, onSuccess:Void->Void, onError:Void->Void):Void
{
onLogoutResolved(outcome);

switch (outcome)
{
case SUCCESS:
onSuccess();
case FAIL(result):
onError();
}
}

function onLoginSuccessful():Void
{


Save.instance.ngSessionId.value = NG.core.sessionId;


NG.core.requestMedals(onFetchedMedals);

NG.core.scoreBoards.loadList(onFetchedLeaderboards);
NG.core.saveSlots.loadList(onFetchedSaveSlots);
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
