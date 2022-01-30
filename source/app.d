import std.stdio;
import std.file;
import storage;

void main()
{
	Storage s = new Storage("C:/Users/devbox/Desktop/dargon/");

	foreach (DirEntry st; s.listRoot())
	{
		writeln(st.name, "\t", st.size);
	}
}
