# oxford, 2024.

import sys, csv, re

codes_exclude = [{"code":"5519","system":"TADDS"},{"code":"5520","system":"TADDS"},{"code":"5521","system":"TADDS"}];

with open(sys.argv[1], 'r') as file_in, open('long-covid-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["long-covid-assessment---tadds-exclusion"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        newRow["long-covid-assessment---tadds-exclusion"] = "FALSE";
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes_exclude))):
                    newRow["long-covid-assessment---tadds-exclusion"] = "TRUE";        
        csv_writer.writerow(newRow);
