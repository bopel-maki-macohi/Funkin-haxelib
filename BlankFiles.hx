package;

import haxe.PosInfos;
import haxe.Log;
import haxe.Timer;
import haxe.Constraints.Function;
import sys.io.File;
import haxe.io.Path;
import sys.FileSystem;

using StringTools;

class BlankFiles {
	public static function pathExists(path:String):Bool {
		return FileSystem.exists(path);
	}

	public static function readDirectoryRecursive(directory:String):Array<String> {
		if (!pathExists(directory))
			return [];

		var f = [];

		for (file in readDirectory(directory)) {
			if (FileSystem.isDirectory(file))
				for (sf in readDirectoryRecursive(file))
					f.push(sf);
			else
				f.push(file);
		}

		return f;

		return readDirectory(directory);
	}

	public static function readDirectory(directory:String):Array<String> {
		if (!pathExists(directory))
			return [];

		return [
			for (file in FileSystem.readDirectory(Path.removeTrailingSlashes(directory)))
				'${Path.removeTrailingSlashes(directory)}/$file'
		];
	}

	static var logs = [];

	static var source:Array<String> = [];

	static function main() {
		#if !debug
		Log.trace = (v, ?infos) -> {}
		#end

		source = readDirectoryRecursive('funkin').filter(p -> return Path.extension(p) == 'hx');
		// source = ['funkin/api/discord/DiscordClient.hx'];
		Sys.println('${source.length} files');

		cleanse();

		Sys.println('done');
		File.saveContent('lines', logs.join('\n'));

		// for (file in source) {
		// 	var parser = new hscript.Parser();
		// 	var program = parser.parseString(File.getContent(file), file);

		// 	var interp = new hscript.Interp();

		// 	// export some useful classes
		// 	interp.variables.set("Array", Array);
		// 	interp.variables.set("DateTools", DateTools);
		// 	interp.variables.set("Math", Math);
		// 	interp.variables.set("StringTools", StringTools);
		// 	interp.variables.set("Sys", Sys);
		// 	interp.variables.set("Xml", Xml);
		// 	interp.variables.set("sys", {
		// 		"FileSystem": sys.FileSystem,
		// 		"io": {
		// 			"File": sys.io.File
		// 		},
		// 		"net": {
		// 			"Host": sys.net.Host
		// 		}
		// 	});
		// 	interp.variables.set("haxe", {
		// 		"Json": haxe.Json,
		// 		"Http": haxe.Http,
		// 		"Serializer": haxe.Serializer,
		// 		"Unserializer": haxe.Unserializer
		// 	});

		// 	trace('$file : ' + interp.execute(program));
		// }
	}

	static var removedKeywordLines = [];

	static function cleanse() {
		logs = [];
		for (file in source) {
			if (file.contains('macro/'))
				continue;
			if (file.contains('Macro'))
				continue;
			if (file.contains('ui/debug/'))
				continue;
			if (file.contains('ui/haxeui/'))
				continue;

			var fileContent = File.getContent(file);
			var lines = fileContent.split('\n');
			var newLines = [];

			var methodID = -1;
			var methods = [];
			var funcStartIDS:Array<Int> = [];

			var inClass = false;
			var conditionalElse = false;
			var declaredPackage = false;

			var tabsIn = '';

			function addTab()
				tabsIn += '\t';
			function removeTab() {
				var tabs = tabsIn.split('\t');
				tabs.remove(tabs[tabs.length - 1]);
				tabsIn = tabs.join('\t');
			}

			function addCurLineShit(i:Int) {
				#if debug
				newLines.push('$tabsIn// $file:${i + 1}');
				#end
			}

			function log(v:Dynamic, i:Int, ?pos:PosInfos) {
				// if (file.contains('FunkinSound'))
				Sys.println('BlankFiles.hx:${pos.lineNumber}, $file:$i : $v');
			}

			for (i => line in lines) {
				line = line.trim();
				var splitLine = line.split(' ');

				var prevLine = (lines[i - 1] ?? '').trim();
				var prevSplitLine = prevLine.split(' ');

				if (line.startsWith('#')) {
					if (line.startsWith('#else'))
						conditionalElse = true;
					if (line.startsWith('#end') && conditionalElse)
						conditionalElse = false;

					continue;
				}

				if (conditionalElse)
					continue;

				if (line.startsWith('/*') ||line.startsWith('*') || line.startsWith('//'))
					continue;

				var aSpiralKeyword = (line.contains('@:') || prevLine.contains('@:'));
				var ifKeyword = (line.contains('if') || prevLine.contains('if'));
				// var varFunctionKeyword = (line.contains('(function') || prevLine.contains('(function')) || (line.contains('function(') || prevLine.contains('(function('));
				var functionKeyword = (line.contains('function') || prevLine.contains('function'));
				var finalKeyword = (line.contains('final') || prevLine.contains('final'));
				var varKeyword = (line.contains('var') || prevLine.contains('var'));

				var publicKeyword = (splitLine.contains('public') || prevSplitLine.contains('public')) ? 'public ' : '';
				var privateKeyword = (splitLine.contains('private') || prevSplitLine.contains('private')) ? 'private ' : '';
				var staticKeyword = (splitLine.contains('static') || prevSplitLine.contains('static')) ? 'static ' : '';
				var inlineKeyword = (splitLine.contains('inline') || prevSplitLine.contains('inline')) ? 'inline ' : '';

				var getKeyword = (line.contains('get_') || line.contains('(get'))
					|| (prevLine.contains('get_') || prevLine.contains('(get'));
				var setKeyword = (line.contains('set_') || line.contains('set)'))
					|| (prevLine.contains('set_') || prevLine.contains('set)'));

				var macroKeyword = line.contains('macro');

				if (line.contains('package') && !declaredPackage) {
					addCurLineShit(i);
					newLines.push('$tabsIn$line');
					declaredPackage = true;
				}

				if (!declaredPackage)
					continue;

				if (line.contains('class') && !inClass) {
					inClass = true;

					addCurLineShit(i);
					newLines.push('${tabsIn}class ${line.split(' ')[1]}');
					newLines.push('{');
				}

				if (!inClass)
					continue;

				if (methodID < 0 && (varKeyword || finalKeyword)) {
					line = line.replace('(get,', '');
					line = line.replace('(default,', '');
					line = line.replace('(null,', '');
					line = line.replace('(never,', '');

					line = line.replace('set)', '');
					line = line.replace('default)', '');
					line = line.replace('null)', '');
					line = line.replace('never)', '');

					if (line.contains('URL_REGEX')) continue;

					addCurLineShit(i - 1);
					newLines.push('$tabsIn${line}');
					continue;
				}

				if (line.contains('{')) {
					if (ifKeyword || aSpiralKeyword) {
						methodID++;
						// log('$methodID', i);
					} else if (functionKeyword) {
						var funcName = null;

						if (funcName == null)
							for (piece in prevSplitLine) {
								if (piece.contains('(') && piece.split('(',).length < 3) {
									funcName = piece.split('(',)[0];

									// log(piece, i);
									// log(piece.split('('), i);
								}
							}

						methodID++;
						// log('$methodID', i);

						if (funcName?.toLowerCase() == ' function' || getKeyword || setKeyword) {
							// log('get: $getKeyword', i);
							// log('set: $setKeyword', i);
							funcName = null;
						}

						if (funcName != null && !macroKeyword) {
							addCurLineShit(i - 1);
							methods.push('$funcName');
							newLines.push('$tabsIn${publicKeyword}${privateKeyword}${inlineKeyword}${staticKeyword}function $funcName() {}');
						}
					}
				}

				if (line.contains('}')) {
					if (methodID >= 0) {
						methodID--;
						// log('$methodID', i);
					} else if (inClass) {
						addCurLineShit(i);
						newLines.push('}');
						inClass = false;
					}
				}

				// if (macroKeyword)
				// 	continue;
			}

			// var addedLines:Array<String> = [];
			for (line in newLines) {
				// if (line.length > 1 && addedLines.contains(line))
				// 	continue;

				logs.push(line);
				// addedLines.push(line);
			}

			fileContent = newLines.join('\n');
			// trace('$j : ' + file + ' : ${cleared.length}');
			// File.saveContent(file, fileContent);
		}
	}
}
