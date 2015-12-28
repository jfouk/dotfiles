#For testing on the mac
ctags -f - --sort=no --fields=nKs --excmd=number simple_alarm_clock.py | perl -ne 'unless (/^\!/) { s/^(.*?)\t(.*?)\t/\x1b[33m\1\x1b[m\t\x1b[34m\2\x1b[m\t/; print }'
ctags -f - --sort=no --fields=nKs --excmd=number simple_alarm_clock.py | perl -ne 'unless (/^\!/) { s/^(.*?)\t(.*?)\t(.*?)\t/\x1b[33m\1\x1b[m\t\x1b[34m\2\x1b[m\t\x1b[35m\3\x1b[m\t/; s/(function)\t/\x1b[32m\1\x1b[m\t/; print }'

#For testing on Linux
ctags -f - --sort=no --fields=nKs --excmd=number src/hadepf.pgm/Driver/Pf/PfVendorAdapterMgr.C | perl -ne 'unless (/^\!/) { s/^(.*?)\t(.*?)\t(.*?)\t/\x1b[33m\1\x1b[m\t\x1b[34m\2\x1b[m\t\x1b[35m\3\x1b[m\t/; s/\t(function)\t/\t\x1b[32m\1\x1b[m\t/; print }'
#search and replace string for function <-- this works proceed like this
s/(function|member|macro)\t/\x1b[32m\1\x1b[m\t/;
switch($_) {
    case m/\tfunction\t/ {s/\tfunction\t/\t\x1b[32m\1\x1b[m\t/;}
}



 #printf('ctags -f - --sort=no --fields=nKs --excmd=number %s | 
 #perl -ne  
 ##-n causes Perl to run a while loop around the program, which makes it iterate over filename arguments
 #-e runs command line
 unless (/^\!/)     #if this condition is not true, run the following
 { 
     s/^(.*?)\t(.*?)\t/\x1b[33m\1\x1b[m\t\x1b[34m\2\x1b[m\t/; 
     print 
 }
 #', expand('%:S'))]
 #\t tab character
 #\x hexadecimal escape sequence
 #  if no curly braces after it then it's the next 2 numbers
 #  so \x1b is hex 0x1b
 #  ^ matches the beginning of the string
 #  http://www.troubleshooters.com/codecorn/littperl/perlreg.htm#UsingSimpleWildcards
 #      - perl regex tutorial
 #  - "." matches any character
 #  - "*" match 0 or more times
 #  http://ascii-table.com/ansi-escape-sequences.php
 #      - ansi escape sequences
 #      - /x1b is asci escape key
 #      - \x1b[<value>;..;<value>m
 #          - set graphics mode
 #          Text attributes
 #          0   All attributes off
 #          1   Bold on
 #          4   Underscore (on monochrome display adapter only)
 #          5   Blink on
 #          7   Reverse video on
 #          8   Concealed on
 #          Foreground colors
 #          30  Black
 #          31  Red
 #          32  Green
 #          33  Yellow
 #          34  Blue
 #          35  Magenta
 #          36  Cyan
 #          37  White 
 #          Background colors
 #          40  Black
 #          41  Red
 #          42  Green
 #          43  Yellow
 #          44  Blue
 #          45  Magenta
 #          46  Cyan
 #          47  White 
 # http://docstore.mik.ua/orelly/perl3/lperl/ch08_04.htm
 # - perl back reference
