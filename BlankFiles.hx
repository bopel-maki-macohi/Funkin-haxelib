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
		'var',
		'final',
		'// ',
		'return',
		'trace',
		'trace',
		'#',
		'handlers',
		'Discord',
		'createDaemon',
		'daemon',
		'while',
		'Sys',
		'presence',
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

	static function cleanse(j:Int) {
		logs = [];
		for (file in source) {
			var fileContent = File.getContent(file);
			var lines = fileContent.split('\n');
			var newLines = [];

			var inFunction:Int = 0;

			var funcStartIDS:Map<Int, Int> = [];

			var cleared = [];

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

				for (keywords in keywords_startsWith) {
					if (!lineCleared && line.startsWith(keywords)) {
						// trace(keywords);
						clearLine(line);
						lineCleared = true;
					} else
						continue;
				}

				for (keyword in keywords_contains) {
					if (!lineCleared && lineSplit.contains(keyword)) {
						// trace(keyword);
						clearLine(line);
						lineCleared = true;
					} else
						continue;
				}

				if (!lineCleared) {
					logs.push('$file : $line');
					newLines.push(line);
				}

				i++;
			}

			fileContent = newLines.join('\n');
			trace('$j : ' + file + ' : ${cleared.length}');
			File.saveContent(file, fileContent);
		}
	}
}
