Build a very basic Debian image with my local preferences.

    sudo /bin/true # save your session
    make image

You are expected to provide the following files in `./local`:

    sources.list
    resolv.conf

This is (slightly) adapted from the scripts in `docker/contrib/mkimage` and is therefor under
the Apache Licence (v2.0).
