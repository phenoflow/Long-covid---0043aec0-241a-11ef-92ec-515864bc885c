cwlVersion: v1.0
steps:
  covid19-result---tadds:
    run: covid19-result---tadds.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  positive-covid19---tadds:
    run: positive-covid19---tadds.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: covid19-result---tadds/output
  covid19-exposure---tadds:
    run: covid19-exposure---tadds.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: positive-covid19---tadds/output
  covid19-suspected---tadds:
    run: covid19-suspected---tadds.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: covid19-exposure---tadds/output
  covid19-confirmed---tadds:
    run: covid19-confirmed---tadds.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: covid19-suspected---tadds/output
  covid19-coronavirus---tadds:
    run: covid19-coronavirus---tadds.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: covid19-confirmed---tadds/output
  covid19---tadds:
    run: covid19---tadds.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: covid19-coronavirus---tadds/output
  covid19-hospitalisation---hes-exclude:
    run: covid19-hospitalisation---hes-exclude.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: covid19---tadds/output
  long-covid---tadds-exclude:
    run: long-covid---tadds-exclude.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: covid19-hospitalisation---hes-exclude/output
  long-covid-assessment---tadds-exclude:
    run: long-covid-assessment---tadds-exclude.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: long-covid---tadds-exclude/output
  long-covid-symptoms-tiredness---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-tiredness---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: long-covid-assessment---tadds-exclude/output
  long-covid-symptoms---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-tiredness---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-muscle---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-muscle---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-concentrating---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-concentrating---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-muscle---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-smell---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-smell---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-concentrating---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-sleeping---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-sleeping---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-smell---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-headache---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-headache---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-sleeping---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-anxiety---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-anxiety---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-headache---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-confusion---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-confusion---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-anxiety---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-dizziness---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-dizziness---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule20
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-confusion---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-cough---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-cough---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule21
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-dizziness---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-palpitations---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-palpitations---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule22
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-cough---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-vomiting---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-vomiting---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule23
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-palpitations---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-diarrhoea---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-diarrhoea---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule24
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-vomiting---tadds-31-to-186-days-after-covid19/output
  long-covid-symptoms-fever---tadds-31-to-186-days-after-covid19:
    run: long-covid-symptoms-fever---tadds-31-to-186-days-after-covid19.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule25
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-diarrhoea---tadds-31-to-186-days-after-covid19/output
  output-diagnosis-of-long-covid-symptoms-31-days-to-186-days-after-covid19-without-a-record-of-long-covid-and-covid19-hospitalisation-cases:
    run: output-diagnosis-of-long-covid-symptoms-31-days-to-186-days-after-covid19-without-a-record-of-long-covid-and-covid19-hospitalisation-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule26
      potentialCases:
        id: potentialCases
        source: long-covid-symptoms-fever---tadds-31-to-186-days-after-covid19/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
  inputModule20:
    id: inputModule20
    doc: Python implementation unit
    type: File
  inputModule21:
    id: inputModule21
    doc: Python implementation unit
    type: File
  inputModule22:
    id: inputModule22
    doc: Python implementation unit
    type: File
  inputModule23:
    id: inputModule23
    doc: Python implementation unit
    type: File
  inputModule24:
    id: inputModule24
    doc: Python implementation unit
    type: File
  inputModule25:
    id: inputModule25
    doc: Python implementation unit
    type: File
  inputModule26:
    id: inputModule26
    doc: Python implementation unit
    type: File
outputs:
  output:
    id: output
    type: File
    outputSource: output-diagnosis-of-long-covid-symptoms-31-days-to-186-days-after-covid19-without-a-record-of-long-covid-and-covid19-hospitalisation-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
