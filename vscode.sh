#! /bin/bash

exec code --wait $@ || exec micro $@ || exec vim $@
