![Build status](https://travis-ci.org/breun/ActivityBar.svg?branch=master)

# ActivityBar

ActivityBar is an OS X status bar application to monitor CPU and RAM usage.

On OS 10.10 (and before) I was happily using [MenuMeters](http://www.ragingmenace.com/software/menumeters/) to monitor CPU and RAM usage in the status bar, but the MenuMeters developer has stated that it is not clear that MenuMeters in its present form can ever be made compatible with OS X 10.11.

Please note that this application is still UNDER CONSTRUCTION.

* Used CPU% is currently shown in the status bar, but no graph yet.
* All processing is currently still done on the main thread, which results in a lot of beachball spinning. This should be fixed soon.
* Support for memory measurements has also been added already, but that's not visible in the user interface yet.

Building this project requires OS X 10.11 with Xcode 7 (currently both still in beta).
