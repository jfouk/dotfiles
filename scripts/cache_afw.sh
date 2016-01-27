#!/bin/bash

# Script to cache afw backing build files
# allows quicker fuzzy searching 
for version in afw780 afw820 afw830 afw840 afw850 afw860; do
    find /afs/rchland.ibm.com/usr5/phypbld/afw/$version/builds/LATEST/src -iname *.c -printf '%P\n' -or -iname *.h -printf '%P\n' > ~/.vim/.projectcache/${version}_LATEST
done

function updateCache()
{
    if [$1]; then
        find /afs/rchland.ibm.com/usr5/phypbld/afw/$1/builds/LATEST/src -iname *.c -printf '%P\n' -or -iname *.h -printf '%P\n' > ~/.vim/.projectcache/${1}_LATEST
    else
        echo "Please enter in afw version"
    fi
}
