# martinchapman, 2020.

import sys, csv

def checkRow(row):
    for case_steps in cases: 
        if not "CASE" in {col:row[col] for col in case_steps if col in row}.values(): return row;
    row['diagnosis-of-long-covid-symptoms-31-days-to-186-days-after-covid19-without-a-record-of-long-covid-and-covid19-hospitalisation-identified'] = 'CASE';
    return row;

cases = [["covid19-result---tadds-identified","positive-covid19---tadds-identified","covid19-exposure---tadds-identified","covid19-suspected---tadds-identified","covid19-confirmed---tadds-identified","covid19-coronavirus---tadds-identified","covid19---tadds-identified"],["long-covid-symptoms-tiredness---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-muscle---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-concentrating---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-smell---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-sleeping---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-headache---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-anxiety---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-confusion---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-dizziness---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-cough---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-palpitations---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-vomiting---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-diarrhoea---tadds-31-to-186-days-after-covid19-identified","long-covid-symptoms-fever---tadds-31-to-186-days-after-covid19-identified"]];

with open(sys.argv[1], 'r') as file_in, open('long-covid-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    all_cases = [category for codes in cases for category in codes];
    all_exclude = [header for header in csv_reader.fieldnames if "exclusion" in header];
    csv_writer = csv.DictWriter(file_out, list(set(csv_reader.fieldnames)-set(all_cases)-set(all_exclude)) + ['diagnosis-of-long-covid-symptoms-31-days-to-186-days-after-covid19-without-a-record-of-long-covid-and-covid19-hospitalisation-identified'])
    csv_writer.writeheader();
    for row in csv_reader:
        new_row = row.copy();
        new_row.update(list(map(lambda item:(item[0],"UNK") if len([subitem for subitem in list(new_row.items())[:list(new_row.items()).index(item)] if "exclusion" in subitem[0] and subitem[1]=="TRUE"])>0 and "identified" in item[0] else item, new_row.items())));
        new_row['diagnosis-of-long-covid-symptoms-31-days-to-186-days-after-covid19-without-a-record-of-long-covid-and-covid19-hospitalisation-identified'] = 'UNK';
        new_row = checkRow(new_row);
        for case_key in all_cases+all_exclude: new_row.pop(case_key, None);
        csv_writer.writerow(new_row);
