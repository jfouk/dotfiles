# Copy Project Notes
#
#   This Script will copy project blocks from the daily org files to the project files, if
#   the project file exists.
#


with open("in.txt") as f:
    with open("out.txt", "w") as f1:
        for line in f:
            if "ROW" in line:
                f1.write(line) 
