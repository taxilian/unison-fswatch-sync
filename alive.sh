#!/bin/bash
ps -A -o pid,comm|grep unison | grep -v grep
exit $?