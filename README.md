# icebreaker

Simple Docker-based build environment that can build verilog programs for the icebreaker FPGA development board and
upload them to the board. This is not meant to be a robust development environment; instead, it is a barebones build
that shows the minimum required steps to get the toolchain working. There is as little obfuscation and abstraction as
possible.

# Prerequisites

Docker must be installed, and the current user must be a member of the docker group.

# Usage

First, plug in the icebreaker board to a USB port. Next, simply run `./build` in the top-level directory of the
repository. This will build the Debian-based Docker container that contains all of the tools necessary to build and
upload the program to the board. Once the container is built it will be run with the `./src` directory of the repository
will be mounted to `/src` inside the container, and the `./build` script inside of the `./src` directory will be run to
build and upload the verilog program.
