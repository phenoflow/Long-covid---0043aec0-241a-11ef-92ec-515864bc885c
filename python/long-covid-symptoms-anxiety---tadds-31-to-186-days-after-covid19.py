# oxford, 2024.

import sys, csv, re
from datetime import datetime, date

codes_before = [{"code":"4851","system":"TADDS"},{"code":"4852","system":"TADDS"},{"code":"4854","system":"TADDS"},{"code":"4855","system":"TADDS"},{"code":"4856","system":"TADDS"},{"code":"4857","system":"TADDS"},{"code":"4889","system":"TADDS"},{"code":"4897","system":"TADDS"},{"code":"4898","system":"TADDS"},{"code":"4899","system":"TADDS"},{"code":"4895","system":"TADDS"},{"code":"4783","system":"TADDS"},{"code":"4784","system":"TADDS"},{"code":"4787","system":"TADDS"},{"code":"4788","system":"TADDS"},{"code":"4853","system":"TADDS"},{"code":"4903","system":"TADDS"}];
codes_after = [{"code":"4920","system":"TADDS"},{"code":"4791","system":"TADDS"}];
MIN_DAYS = 31;
MAX_DAYS = 186;

with open(sys.argv[1], 'r') as file_in, open('long-covid-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["long-covid-symptoms-anxiety---tadds-31-to-186-days-after-covid19-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        new_row = row.copy();
        new_row["long-covid-symptoms-anxiety---tadds-31-to-186-days-after-covid19-identified"] = "UNK";
        matching_before_codes=[];
        matching_after_codes=[];
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*\,[^,]*)\)', row[cell]):
                code = item.split(",")[0];
                date = datetime.fromisoformat(item.split(",")[1]);
                if(code in list(map(lambda code: code['code'], codes_before))): matching_before_codes.append((code, date));
                if(code in list(map(lambda code: code['code'], codes_after))): matching_after_codes.append((code, date));
        sorted(matching_before_codes, key=lambda code_date: code_date[1]);
        sorted(matching_after_codes, key=lambda code_date: code_date[1]);
        matching_before_codes.reverse();
        if(len(matching_before_codes)>0 and len(matching_after_codes)>0): 
            if(MIN_DAYS < (matching_after_codes[0][1]-matching_before_codes[0][1]).days and (matching_after_codes[0][1]-matching_before_codes[0][1]).days < MAX_DAYS):
                new_row["long-covid-symptoms-anxiety---tadds-31-to-186-days-after-covid19-identified"] = "CASE";
            else:
                new_row["long-covid-symptoms-anxiety---tadds-31-to-186-days-after-covid19-identified"] = "UNK";
        csv_writer.writerow(new_row)
