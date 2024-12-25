#!/bin/bash

pushd gnuplot_stuff

export -n SESSION_MANAGER
gnuplot -persist compare_speeds.gp

popd

