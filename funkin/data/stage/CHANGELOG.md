
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

- Added the `color` attribute on stage props to tint them.
- Added the `blend` attribute on stage props to apply blend modes.
- Added the `angle` attribute on stage props to apply a rotation to them.

- Added the ability to specify `flipX` and `flipY` on stage props to horizontally or vertically flip, respectively.

- Added the ability to specify a hexadecimal color in the `assetPath` field instead of a texture key.
- In this case, the `scale` property will be used to determine the size of the rectangle in pixels.

Initial release.
