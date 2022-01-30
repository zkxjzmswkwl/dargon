module nest;

import std.file;
import std.stdio;
import std.conv;
import std.json;
import std.file;
import egg;

class Nest
{
    private string name;
    // TODO: Key class with strict type enforcement for each key.
    private string[] keys;

    this(string name)
    {
        this.name = name;
        writeln("Nest created: " ~ this.name);
    }

    public Nest addKey(string keyName)
    {
        writeln("Add key: " ~ keyName);
        this.keys ~= keyName;
        return this;
    }

    public void writeKeyManifest(string manifestPath)
    {
        // Add dev mode switch, only assert if flip not switched.
        // assert(manifestPath.exists);
        if (!manifestPath.exists)
        {
            write!string(manifestPath, "");
        }
        // Construct the string that the manifesst file is comprised of.
        string builtManifest = this.name ~= " Dargon Nest Manifest 0.1\n";
        builtManifest ~= "BEGIN\n";
        foreach (string key; this.keys)
        {
            builtManifest ~= key ~ "\n";
        }
        builtManifest ~= "END\n";
        write!string(manifestPath, builtManifest);
    }
}

class User : Nest
{
    private Egg userEgg;

    this()
    {
        super("User");
        this.userEgg = new Egg("C:/Users/devbox/Desktop/dargon/user.dargon");
        this.userEgg.parseManifest();
    }

    public User insert(
        string username,
        string password,
        string discord,
        string email)
    {
        auto newUser = `
        {
            "username": "`   ~ username  ~ `",
            "password": "`   ~ password  ~ `",
            "discord": "`    ~ discord   ~ `",
            "email": "`      ~ email     ~ `"
        }`;

        write!string("C:/Users/devbox/Desktop/dargon/" ~ username ~ ".json", newUser);
        return this;
    }

    // TODO: Model..? I don't fucking know. This whole concept is just messy and unthought out...
    public JSONValue get(string retrievalKey)
    {
        return parseJSON(readText("C:/Users/devbox/Desktop/dargon/" ~ retrievalKey ~ ".json"));
    }
}