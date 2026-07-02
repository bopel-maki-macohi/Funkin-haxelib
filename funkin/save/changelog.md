
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

This version introduces changes to save data loading in order to improve compatibility with older versions.
- `optionsStageEditor.theme` converted from an Enum to a String to fix save data compatibility issues.
- In the future, Enum values should not be used in order to prevent incompatibilities caused by introducing new types to the save data that older versions cannot parse.
- `optionsChartEditor.theme` converted from an Enum to a String to fix save data compatibility issues.
- `optionsChartEditor.chartEditorLiveInputStyle` converted from an Enum to a String to fix save data compatibility issues.

- `optionsStageEditor` to `Save` for storing user preferences for the stage editor.

- Resolved an issue where HTML5 wouldn't store the semantic version properly, causing the game to fail to load the save.

- `unlocks.charactersSeen:Array<String>` to `Save`
- `unlocks.oldChar:Bool` to `Save`
- `favoriteSongs:Array<String>` to `Save`

- `inputOffset:Float` to `SongDataOptions`
- `audioVisualOffset:Float` to `SongDataOptions`
