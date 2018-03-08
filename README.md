# Docker Image for Salesforce Workbench

This is a work in progress.

* [Workbench Homepage](https://developer.salesforce.com/page/Workbench)
* [Workbench Source](https://github.com/ryanbrainard/forceworkbench)


## Usage

Build:

    docker build -t mrabbitt/forceworkbench .

Run on port 8080 using embedded copy of Workbench:

    docker run --rm -d --name workbench -p 8080:80 mrabbitt/forceworkbench

Run on port 8080 using local copy of Workbench source (at `/path/to/forceworkbench`):

    docker run --rm -d --name workbench -p 8080:80  \
           -v /path/to/forceworkbench/workbench/:/workbench:ro  \
           mrabbitt/forceworkbench


## Known Issues

* PhpRedis is not installed, so [Distributed Session Support](https://github.com/ryanbrainard/forceworkbench/wiki#distributed-session-support) is not available.
