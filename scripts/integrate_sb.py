# script to integrate sandbox

import subprocess
import re
import os

def main():
    # prompt for needed variables
    global defect = raw_input('Please enter the defect number: ')
    global releases = raw_input('Please enter the release, and any common releases (separated by space): ')
    releases = releases.split()

    print('Defect: ' + defect + '\nReleases: ' + releases[0] + ', ' + releases[1] )

    # find base folder
    proc = subprocess.Popen(['sbinfo'], stdout=subprocess.PIPE)
    info = proc.stdout.read()
    info = info.split()
    baseString = info[-1]
    global baseAddr = re.search('/.+$',baseString)
    baseAddr = baseAddr.group()
    #check for any new files we have to add



def integrateFiles():
    # iterate through files
    proc = subprocess.Popen(['sbstatus','-files'], stdout=subprocess.PIPE)
    output = proc.stdout.read()
    status = output.split()
    tracked_files = [];

    print output

    for i in range(0,len(status)):
        # check if this file is tracked
        if status[i] is 'Y':
            if status[i+1] is 'N':       # file is tracked but not checked out
                tracked_files.append(status[+2])
                i = i + 2
        elif status[i] is 'NA':
            print status[i+1]

def createFiles( file ):
    # change to base dir
    os.chdir( baseAddr );
    File -create CxPhysFunction.C -def 981447 -comp PF.afwp -origin 30


if __name__ == "__main__":
    main()
