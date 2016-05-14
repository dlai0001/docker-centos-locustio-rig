#!/usr/bin/env python


import argparse
parser = argparse.ArgumentParser()
parser.add_argument("mode", help="master or slave")
parser.add_argument("address", help="address of master")

args = parser.parse_args()

if args.mode.lower() == 'master':
    print "Starting as Locust Master"
else:
    print "Starting as Locust Slave"

