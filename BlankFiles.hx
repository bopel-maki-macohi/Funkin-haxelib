package;

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

	static var keep_keywords_contains:Array<String> = ['instance'];

	static var keywords_contains:Array<String> = [];
	static var keywords_endsWith:Array<String> = [';'];
	static var keywords_startsWith:Array<String> = [
		'import',
		'if',
		'lime',
		'trace',
		'FlxG',
		'@',
		'static final',
		'static var',
		'public static var',
		'public var',
		'private static var',
		'private var',
		'var',
		'final',
		'// ',
		'return',
		'trace',
		// '{',
		'while',
		'#',
	];

	static var logs = [];

	static var source:Array<String> = [];

	static function main() {
		source = readDirectoryRecursive('funkin');
		trace('${source.length} files');

		var i = 0;

		while (i < 10) {
			i++;
			Timer.measure(() -> cleanse(i));
		}

		trace('${removedKeywordLines.length} removed keyword lines after $i iterations');
		File.saveContent('lines', logs.join('\n'));

		for (file in source) {
			var parser = new hscript.Parser();
			var program = parser.parseString(File.getContent(file), file);

			var interp = new hscript.Interp();

			// export some useful classes
			interp.variables.set("Array", Array);
			interp.variables.set("DateTools", DateTools);
			interp.variables.set("Math", Math);
			interp.variables.set("StringTools", StringTools);
			interp.variables.set("Sys", Sys);
			interp.variables.set("Xml", Xml);
			interp.variables.set("sys", {
				"FileSystem": sys.FileSystem,
				"io": {
					"File": sys.io.File
				},
				"net": {
					"Host": sys.net.Host
				}
			});
			interp.variables.set("haxe", {
				"Json": haxe.Json,
				"Http": haxe.Http,
				"Serializer": haxe.Serializer,
				"Unserializer": haxe.Unserializer
			});

			trace('$file : ' + interp.execute(program));
		}
	}

	static var removedKeywordLines = [];

	static function cleanse(j:Int) {
		logs = [];
		for (file in source) {
			var fileContent = File.getContent(file);
			var lines = fileContent.split('\n');
			var newLines = [];

			var inFunction:Int = -1;

			var funcStartIDS:Array<Int> = [];

			var cleared = [];

			var clsLine:Int = -1;

			function clearLine(line) {
				lines.remove(line);
				removedKeywordLines.push(line);
				cleared.push(line);
			}

			var i = 0;
			for (line in lines) {
				line = line.trim();

				var lineSplit = line.split(' ');

				var lineCleared = false;
				var forceKeep = false;

				for (keyword in keep_keywords_contains) {
					for (piece in lineSplit) {
						if (!forceKeep && piece.contains(keyword)) {
							forceKeep = true;
							break;
						}
					}
				}

				if (!forceKeep) {
					for (keywords in keywords_startsWith) {
						if (!lineCleared && line.startsWith(keywords)) {
							// trace(keywords);
							clearLine(line);
							lineCleared = true;
						} else
							continue;
					}

					for (keyword in keywords_contains) {
						for (piece in lineSplit) {
							if (!lineCleared && piece.contains(keyword)) {
								// trace(keyword);
								clearLine(line);
								lineCleared = true;
								break;
							}
						}
					}

					for (keyword in keywords_endsWith) {
						if (!lineCleared && line.endsWith(keyword)) {
							// trace(keyword);
							clearLine(line);
							lineCleared = true;
						}
					}

					if (!lineCleared) {
						if (line.contains('function')) {
							inFunction++;

							funcStartIDS.push(i);

							var splitFuncLine = line.split('():');

							if (splitFuncLine.length > 1)
								line = splitFuncLine[0] + '()';

							if (!line.contains('{}'))
								line = splitFuncLine[0] + ' {}';

							lines.remove(lines[i + 1]);
						}

						if (line == '}' && inFunction >= 0) {
							funcStartIDS.remove(funcStartIDS[inFunction]);
							inFunction--;

							// if (inFunction < 0) {
							// 	newLines.insert(newLines.length - 1, '${newLines[newLines.length - 1]} {}');
							// }
						}

						lineCleared = inFunction < 0;
					}
				}

				if (!lineCleared || forceKeep) {
					logs.push('$file : $line');
					newLines.push(line);
				}

				i++;
			}

			fileContent = newLines.join('\n');
			// trace('$j : ' + file + ' : ${cleared.length}');
			File.saveContent(file, fileContent);
		}
	}
}
