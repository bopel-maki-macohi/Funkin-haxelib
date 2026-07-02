package;

import sys.io.File;
import haxe.io.Path;
import sys.FileSystem;

using StringTools;

class RemoveImports {
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

	static function main() {
		var source = readDirectoryRecursive('funkin');
        trace('${source.length} files');

        for (file in source)
        {
            var fileContent = File.getContent(file);
            var lines = fileContent.split('\n');

            for (line in lines)
            {
                if (line.startsWith('import '))
                    lines.remove(line);
            }

            fileContent = lines.join('\n');
            File.saveContent(file, fileContent);
        }
	}
}
