# harstorage cookbook
[![Build Status](https://travis-ci.org/CBitLabs/harstorage-cookbook.svg)](https://travis-ci.org/CBitLabs/harstorage-cookbook)

This is a simple cookbook for installing harstorage.
It includes a *very* simple recipe for installing mongo-db, which should
be called separately.

At time of writing the mongo-db cookbook was not stable. 


# Requirements

This cookbook includes a simple recipe to install mongodb, as 
at the time of writing that cookbook was in a big push to get
to 2.0 - you can either use your prefferred method for installing
mongodb or include `harstorage::mongo`.

# Attributes

In order to install browsermob proxy you must provide your own
package to install browsermob, and set  
`default['harstorage']['browsermob']['source']`

# Usage

Either include your run-list, or run with the following run-list:

`harstorage[mongo],harstorage[install]`

If you intend to install browsermob as well, you can simply set your
run list to:

`harstorage[default]`


# Recipes

harstorage[default] - Does not actually do anything.

harstorage[mongo] - Recipe for installing mongodb. 

harstorage[install] - Installs harstorage. 


# References

Installation steps for mongo-db were taken from:
http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

Installation steps for harstorage:
https://code.google.com/p/harstorage/wiki/Installation


# Author

Author:: BitSight Technologies (<operations@bitsighttech.com>)
