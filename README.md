# mulle-agvtool

This is a bugfix version of the Apple Xcode <b>agvtool</b> script. It allows to have a CURRENT_PROJECT_VERSION setting like this

<pre>CURRENT_PROJECT_VERSION="$(MULLE_APP_VERSION).1848"</pre>

### Installation

just clone the repository and then say make to create your mulle-agvtool. You need to have Xcode installed. 

### Demo Xcode Project

there is a demo Xcode project that shows how to use mulle-agvtool. With the autodownloading mechanism it
is convenient enough to use in open source projects, where you usually dont want people to download
yet another dependency on their own. 

