# Copy Project Notes
#
#   This Script will copy project blocks from the daily org files to the project files, if
#   the project file exists.
import re
import os
ORG_PATH = os.environ['ORG_NOTES']
today_file = ORG_PATH + "/Journal/TODAY.org"

# Read through file
def main():
    with open(today_file, "r") as f:
        # with open("out.txt", "w") as f1:
        for line in f:
            [ level, header ] = headingLevel(line)
            if level > 0:
                # f1.write(line) 
                print '{}: {}'.format(level, header)
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

if __name__ == "__main__":
    main()
