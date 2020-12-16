import sys, csv
from io import StringIO

s=sys.stdin.read()
f = StringIO(s)
reader = csv.reader(f, delimiter=',')
# we are using ' ' as the escape char since we need it to be a special char in order for QUOTE_MINIMAL to quote fields with spaces to match ARK's format
writer = csv.writer(sys.stdout, delimiter=',', quotechar='"', lineterminator='\n', quoting=csv.QUOTE_MINIMAL, escapechar=' ')
cols = None
for row in reader:
    if cols == None:
        # initialize cols to the number of columns in the header or first line
        cols = len(row)
    # pad every row to have all columns, just pad in an empty value
    # this is the whole reason for this script, currently the last row is missing one empty col
    while (len(row) < cols):
        row.append('')
    writer.writerow(row)
