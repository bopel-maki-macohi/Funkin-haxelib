package;

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

	static var keywords_contains:Array<String> = [';'];
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
		'// ',
		'return',
		'trace',
	];

	static var logs = [];

	static var source:Array<String> = [];

	static function main() {
		source = readDirectoryRecursive('funkin');
		trace('${source.length} files');

		var i = 0;

		while (i < 1) {
			i++;
			cleanse(i);
		}

		trace('${removedKeywordLines.length} removed keyword lines after $i iterations');
		File.saveContent('lines', logs.join('\n'));
	}

	static var removedKeywordLines = [];

	static function cleanse(i) {
		logs = [];

		for (file in source) {
			var fileContent = File.getContent(file);
			var lines = fileContent.split('\n');

			var inFunction:Int = 0;

			var funcStartIDS:Map<Int, Int> = [];

			function clearLine(line) {
				lines.remove(line);
				removedKeywordLines.push(line);
			}

			var i = 0;
			for (line in lines) {
				line = line.trim();

				var lineSplit = line.split(' ');

				for (keyword in keywords_contains) {
					if (lineSplit.contains(keyword)) {
						clearLine(line);
						continue;
					}
				}
				var publicID = lineSplit.indexOf('public');
				var staticID = lineSplit.indexOf('static');

				if (lineSplit.contains('var')) {
					var varID = lineSplit.indexOf('var');

					if (varID < staticID || varID < publicID) {
						clearLine(line);
						continue;
					}
				}

				if (lineSplit.contains('final')) {
					var finalID = lineSplit.indexOf('final');

					if (finalID < staticID || finalID < publicID) {
						clearLine(line);
						continue;
					}
				}

				for (keywords in keywords_startsWith) {
					if (line.startsWith(keywords)) {
						clearLine(line);
						continue;
					}
				}

				// if (line.contains('function')) {
				// 	funcStartIDS.set(inFunction, i + 2);
				// 	inFunction++;
				// }

				// if (line == '}' && inFunction > 0) {
				// 	var starting = funcStartIDS.get(inFunction);

				// 	funcStartIDS.remove(inFunction);

				// 	inFunction--;
				// }

				if (inFunction < 1)
					logs.push('$file : $line');

				i++;
			}

			fileContent = lines.join('\n');
			File.saveContent(file, fileContent);
		}
	}
}
