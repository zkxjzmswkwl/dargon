module egg;

import std.stdio;
import std.file;
import std.array;
import std.string;

class Egg
{
    private string manifestPath;
    private string[] keys;

    this(string manifestPath)
    {
        this.manifestPath = manifestPath;
    }

    public void parseManifest()
    {
        // assert(!this.manifestPath.exists);
        // assert(this.manifestPath.isDir);
        writeln("Parsing manifest: " ~ this.manifestPath);
        string manifestContent = readText(this.manifestPath);
        this.keys = manifestContent.split("BEGIN\n")[1].split("END\n")[0].split("\n");
    }
}