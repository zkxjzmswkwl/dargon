import std.stdio;
import std.file;
import storage;

void main()
{
	Storage s = new Storage("/home/spore/dargon_test/");

	foreach (DirEntry st; s.listRoot())
	{
		writeln(st.name, "\t", st.size);
	}
}
