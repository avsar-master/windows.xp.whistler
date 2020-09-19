  This tool is for use in conjunction with the Windows NT Services for
  Macixposh File Server.  Given the filename of a PC file (FAT/HPFS/NTFS)
  representing the resource fork, and filename representing the data fork
  for a Macixposh style file, combine the 2 files into the format used by
  the Services for Macixposh file server in order to share the file with
  Macixposh clients in a format they can access.  Optionally a Macixposh style
  type and creator can be specified to be added to the Finder Info for
  the file.  If no data fork file is given, a zero length data fork is added
  to the file.  If no resource fork file is given, no resource fork is added.
  Target path must be on a NTFS drive.

	Usage: forkize
	/t <type>
	/c <creator>
	/d <data file path>
	/r <resource file path>
	/o <target file path>

Note: paths to files can be given using UNC names for specifying
      remote source or destination files.

