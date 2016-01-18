# Copy Project Notes
#
#   This Script will copy project blocks from the daily org files to the project files, if
#   the project file exists.
import re
import os
ORG_PATH = os.environ['ORG_NOTES']
today_file = ORG_PATH + "/Journal/TODAY.org"
project_path = ORG_PATH + "/Projects/"

# Read through file
def main():
    # using state as an enum
    state = "Start"
    block = []                          # the block we want to copy over
    with open(today_file, "r") as f:

        #pull the date from the first line
        [level, date] = headingLevel(f.readline())
        for line in f:
            [ level, header ] = headingLevel(line)
            # check if we are in today section
            if state is "Start":
                if re.search('^\s*Today\s*',header) and level == 2:
                    # we are in today section!!
                    state = "Today"
            # if we are in today section, look for project headers
            elif state is "Today":
                if level == 3:
                    block = []
                    state = header          # state will contain the current project title
            # if we are currently copying a block
            else:
                if level != 3:
                    block.append(line)
                else:
                    # if we've reached the end of the block, send to projectFile
                    projectFile(state,block,date)
                    # also assume we are on another project segment and start copying
                    block = []
                    state = header
            # assume the last block is also part of a project block ( may change later )
        projectFile(state,block,date)

    return

# function to check lvl heading
# headingLevel
#
#   input:
#       string - string to check for heading level of. If string is not
#                a header, returns 0.
#   output:
#       return a tuple containing header level, and title stripped of header
def headingLevel(string):
    try:
        match = re.search('(^\*+?) (.*)', string)
        header = match.group(1)
        heading_string = match.group(2)
        level = header.count('*')
        output = (level,heading_string)
    except AttributeError:
        output = (0,'NULL')
    return output

# function to write block over to project file
# 
#   input: 
#       title = The name of the project file
#       block   = The list of lines to copy over to the project block, starting right
#                 after the header of the project ( so level > 3 )
#       date = Current date
#
#   This function will write the project block over to the project file specified by
#   heading. It will follow these steps:
#       1. Try to open project file to write, if no file then no action taken
#       2. Iterate through project file to see if Today's date is present
#       3. If present, start overwriting, otherwise start writing at end of file
#       4. Add current date, then copy over the rest of the block
def projectFile(title, block, date):
    # try to open the project file, if it doesn't exist then exit
    try:
        proj_file = project_path + title.strip() + '.org'
        temp_file = project_path + title.strip() + '.tmp'
        loc = "Start"

        #open original file for reading
        with open(proj_file,"r") as orig:
            #open temp file for modifications and writing
            with open(temp_file,"w") as output:

                for line in orig:
                    [ level, header ] = headingLevel(line)
                    if loc is "Start":
                        output.write(line)
                        # look for start of Work Log
                        if re.search('^\s*Work Log\s*',header) and level == 2:
                            loc = "Searching"
                    # if we have reached Work Log section and searching for Today's date
                    elif loc is "Searching":
                        # if today's log already exists, overwrite
                        # if we've reached the point where we're writing, we can disregard
                        #   rest of the original file
                        output.write(line)
                        if level == 3 and header in date:
                            loc = "Writing"
                            break
                # if today's date is not found, write date
                if loc is not "Writing":
                    print "Starting new date entry!"
                    output.write('\n')
                    output.write('*** ' + date.strip())
                # write the block
                for line in block:
                    output.write(line)

        # replace original file with temp file
        os.rename(temp_file,proj_file)
    except IOError as e:
        print "Unable to open file!"



if __name__ == "__main__":
    main()
