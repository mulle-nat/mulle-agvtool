# mulle-agvtool

mulle-agvtool updates your [CocoaPods](http://http://cocoapods.org/) <tt>podspec</tt> version in synchronicity with your Xcode project.

It also allows to have a <tt>CURRENT_PROJECT_VERSION</tt> setting like this

<pre>CURRENT_PROJECT_VERSION="$(MULLE_APP_VERSION).1848"</pre>

### History

This is an extended version of the Apple Xcode <b>agvtool</b> script. Technically it's just creating a patched copy of the original script.


### Installation

just clone the repository and then say make to create your mulle-agvtool. You need to have Xcode installed. 

### Demo Xcode Project

there is a demo Xcode project that shows how to use mulle-agvtool. With the autodownloading mechanism it is convenient enough to use in open source projects, where you usually dont want people to download yet another dependency on their own. 

### Authors

See the source...

