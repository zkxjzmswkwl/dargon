module storage;

import std.file;
import std.stdio;
import nest;

class Storage
{
    private string basePath;

    this(string basePath)
    {
        this.basePath = basePath;
        // If the basePath does not exist, create it.
        if (!this.basePath.exists)
        {
            writeln("[Warning] " ~ this.basePath ~ " is not present, creating now.");
            mkdirRecurse(this.basePath);
        }
        // If basePath exists on the machine, make sure it's a directory. If not, panic.
        if (!this.basePath.isDir)
        {
            writeln("[Error] " ~ this.basePath ~ " is present on the system, but is not a directory.");
            // TODO: panic(); // ha.
        }

        User userNest = new User();
        // userNest 
        //     .addKey("username")
        //     .addKey("password")
        //     .addKey("discord")
        //     .addKey("email")
        //     .writeKeyManifest(this.basePath ~ "user.dargon");

        userNest.insert("Carter", "test123", "Carter#6669", "carter@tupac.gay");
        writeln(userNest.get("Carter")["discord"].str);
    }

    /// Params:
    ///     span = SpanMode enum value (e.g SpanMode.depth, SpanMode.breadth, etc)
    /// Returns: DirIterator for assigned storage path.
    public DirIterator listRoot(SpanMode span = SpanMode.depth)
    {
        return dirEntries(this.basePath, SpanMode.depth);
    }
}