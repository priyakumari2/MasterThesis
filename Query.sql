-- fetch test labels with count of patients

SELECT 
    d_labitems.label, COUNT(dicd.subject_id) as count
FROM `physionet-data.mimic_hosp.diagnoses_icd` dicd
JOIN `physionet-data.mimic_hosp.d_icd_diagnoses` dig 
ON dig.icd_code = dicd.icd_code 
JOIN`physionet-data.mimic_hosp.labevents` labtest 
ON labtest.subject_id = dicd.subject_id AND labtest.hadm_id= dicd.hadm_id
JOIN `physionet-data.mimic_hosp.d_labitems` d_labitems
ON d_labitems.itemid = labtest.itemid 
WHERE dig.long_title LIKE '%chronic kidney%' 
AND labtest.value IS NOT null
AND d_labitems.label IN ('Glucose', 'Potassium', 'Sodium', 'Chloride', 'Creatinine', 'Urea Nitrogen', 'Bicarbonate', 'Anion Gap', 'Hematocrit', 'Magnesium', 'Hemoglobin', 'Platelet Count', 'Phosphate', 'White Blood Cells', 'Calcium, Total', 'MCHC', 'Red Blood Cells', 'MCV', 'MCH', 'RDW', 'L', 'H', 'I', 'PTT', 'RDW-SD', 'INR(PT)', 'PT', 'pH', 'Specimen Type', 'pO2', 'Base Excess', 'Calculated Total CO2', 'pCO2', 'Asparate Aminotransferase (AST)', 'Bilirubin, Total', 'Alkaline Phosphatase', 'Alanine Aminotransferase (ALT)', 'Lactate', 'Free Calcium', 'Lymphocytes', 'Monocytes', 'Eosinophils', 'Basophils', 'Lactate Dehydrogenase (LD)', 'Neutrophils', 'Albumin', 'Troponin T', 'Creatine Kinase, MB Isoenzyme', 'Oxygen Saturation', 'Potassium, Whole Blood', 'Creatine Kinase (CK)', 'Specific Gravity', 'Absolute Lymphocyte Count', 'Absolute Neutrophil Count', 'Absolute Eosinophil Count', 'Absolute Basophil Count', 'Absolute Monocyte Count', 'Yeast', 'Vancomycin', 'RBC', 'WBC', 'Epithelial Cells', 'Protein', 'Temperature', 'Immature Granulocytes', 'tacroFK', 'Hematocrit, Calculated', 'Creatinine, Urine', 'Sodium, Whole Blood', 'Bands', 'Fibrinogen, Functional', 'Metamyelocytes', 'Myelocytes', 'Atypical Lymphocytes', 'Sodium, Urine', 'Oxygen', 'Lipase', 'PEEP', 'Chloride, Whole Blood', 'Hyaline Casts', 'Ferritin', 'Iron', 'Osmolality, Urine', 'Iron Binding Capacity, Total', 'Transferrin', 'Urea Nitrogen, Urine', 'Thyroid Stimulating Hormone', 'Tidal Volume', 'Potassium, Urine', 'Uric Acid', 'Amylase', 'Urobilinogen', 'Chloride, Urine', 'Haptoglobin', 'Reticulocyte Count, Automated', 'NTproBNP', 'Nucleated Red Cells', 'Ketone', '% Hemoglobin A1c', 'Urine Color', 'eAG', 'C-Reactive Protein', 'Triglycerides', 'Polys', 'Urine Appearance', 'Blood', 'Leukocytes', 'Bilirubin', 'Nitrite', 'Vitamin B12', 'CK-MB Index', 'Total Protein, Urine', 'Bilirubin, Indirect', 'Reticulocyte Count, Absolute', 'Bilirubin, Direct', 'Protein/Creatinine Ratio', 'Protein, Total', 'Bacteria', 'Cholesterol, Total', 'Cortisol', 'Osmolality, Measured', 'Cholesterol, HDL', 'Cholesterol Ratio (Total/HDL)', 'HPE1', 'Cholesterol, LDL, Calculated', 'HPE3', 'Parathyroid Hormone', 'HPE7', 'Macrophage', 'Monos', 'Folate', 'Cyclosporin', 'Thyroxine (T4), Free', 'Digoxin', 'O2 Flow', 'Phenytoin', 'Granular Casts', 'Required O2', 'Alveolar-arterial Gradient', 'Total Nucleated Cells, Ascites', 'Sedimentation Rate', 'RBC, Ascites', 'Immunoglobulin G', 'Blasts', '25-OH Vitamin D', 'Immunoglobulin A', 'Rapamycin', 'Thyroxine (T4)', 'Globulin', 'Transitional Epithelial Cells', 'Calculated Bicarbonate, Whole Blood', 'Immunoglobulin M', 'Heparin', 'Total Nucleated Cells, Pleural', 'Lactate Dehydrogenase, Pleural', 'Total Protein, Pleural', 'RBC, Pleural', 'Glucose, Pleural', 'Mesothelial Cell', 'HPE2', 'ARCH-1', 'Macrophages', 'C4', 'C3', 'Total Protein, Ascites', 'D-Dimer', 'Gamma Glutamyltransferase', 'Granulocyte Count', 'Triiodothyronine (T3)', 'Other', 'Total Nucleated Cells, Other', 'Cholesterol, Pleural', 'RBC, Other Fluid', 'Valproic Acid', 'Benzodiazepine Screen', 'Lymphs', 'Total Nucleated Cells, CSF', 'Barbiturate Screen', 'RBC, CSF', 'Tricyclic Antidepressant Screen', 'Mesothelial Cells', 'Cocaine, Urine', 'STX6', 'Amphetamine Screen, Urine', 'Benzodiazepine Screen, Urine', 'Albumin/Creatinine, Urine', 'Barbiturate Screen, Urine', 'Opiate Screen, Urine', 'Methadone, Urine')

GROUP BY d_labitems.label ORDER BY count DESC ;


-- fetch more columns

SELECT
    dicd.subject_id,
    d_labitems.label,
    labtest.value,
    labtest.valueuom,
    labtest.flag
FROM `physionet-data.mimic_hosp.diagnoses_icd` dicd
JOIN `physionet-data.mimic_hosp.d_icd_diagnoses` dig 
ON dig.icd_code = dicd.icd_code 
JOIN`physionet-data.mimic_hosp.labevents` labtest 
ON labtest.subject_id = dicd.subject_id AND labtest.hadm_id= dicd.hadm_id
JOIN `physionet-data.mimic_hosp.d_labitems` d_labitems
ON d_labitems.itemid = labtest.itemid 
WHERE dig.long_title LIKE '%chronic kidney%' 
AND labtest.value IS NOT null
AND d_labitems.label IN ('Glucose', 'Potassium', 'Sodium', 'Chloride', 'Creatinine', 'Urea Nitrogen', 'Bicarbonate', 'Anion Gap', 'Hematocrit', 'Magnesium', 'Hemoglobin', 'Platelet Count', 'Phosphate', 'White Blood Cells', 'Calcium, Total', 'MCHC', 'Red Blood Cells', 'MCV', 'MCH', 'RDW', 'L', 'H', 'I', 'PTT', 'RDW-SD', 'INR(PT)', 'PT', 'pH', 'Specimen Type', 'pO2', 'Base Excess', 'Calculated Total CO2', 'pCO2', 'Asparate Aminotransferase (AST)', 'Bilirubin, Total', 'Alkaline Phosphatase', 'Alanine Aminotransferase (ALT)', 'Lactate', 'Free Calcium', 'Lymphocytes', 'Monocytes', 'Eosinophils', 'Basophils', 'Lactate Dehydrogenase (LD)', 'Neutrophils', 'Albumin', 'Troponin T', 'Creatine Kinase, MB Isoenzyme', 'Oxygen Saturation', 'Potassium, Whole Blood', 'Creatine Kinase (CK)', 'Specific Gravity', 'Absolute Lymphocyte Count', 'Absolute Neutrophil Count', 'Absolute Eosinophil Count', 'Absolute Basophil Count', 'Absolute Monocyte Count', 'Yeast', 'Vancomycin', 'RBC', 'WBC', 'Epithelial Cells', 'Protein', 'Temperature', 'Immature Granulocytes', 'tacroFK', 'Hematocrit, Calculated', 'Creatinine, Urine', 'Sodium, Whole Blood', 'Bands', 'Fibrinogen, Functional', 'Metamyelocytes', 'Myelocytes', 'Atypical Lymphocytes', 'Sodium, Urine', 'Oxygen', 'Lipase', 'PEEP', 'Chloride, Whole Blood', 'Hyaline Casts', 'Ferritin', 'Iron', 'Osmolality, Urine', 'Iron Binding Capacity, Total', 'Transferrin', 'Urea Nitrogen, Urine', 'Thyroid Stimulating Hormone', 'Tidal Volume', 'Potassium, Urine', 'Uric Acid', 'Amylase', 'Urobilinogen', 'Chloride, Urine', 'Haptoglobin', 'Reticulocyte Count, Automated', 'NTproBNP', 'Nucleated Red Cells', 'Ketone', '% Hemoglobin A1c', 'Urine Color', 'eAG', 'C-Reactive Protein', 'Triglycerides', 'Polys', 'Urine Appearance', 'Blood', 'Leukocytes', 'Bilirubin', 'Nitrite', 'Vitamin B12', 'CK-MB Index', 'Total Protein, Urine', 'Bilirubin, Indirect', 'Reticulocyte Count, Absolute', 'Bilirubin, Direct', 'Protein/Creatinine Ratio', 'Protein, Total', 'Bacteria', 'Cholesterol, Total', 'Cortisol', 'Osmolality, Measured', 'Cholesterol, HDL', 'Cholesterol Ratio (Total/HDL)', 'HPE1', 'Cholesterol, LDL, Calculated', 'HPE3', 'Parathyroid Hormone', 'HPE7', 'Macrophage', 'Monos', 'Folate', 'Cyclosporin', 'Thyroxine (T4), Free', 'Digoxin', 'O2 Flow', 'Phenytoin', 'Granular Casts', 'Required O2', 'Alveolar-arterial Gradient', 'Total Nucleated Cells, Ascites', 'Sedimentation Rate', 'RBC, Ascites', 'Immunoglobulin G', 'Blasts', '25-OH Vitamin D', 'Immunoglobulin A', 'Rapamycin', 'Thyroxine (T4)', 'Globulin', 'Transitional Epithelial Cells', 'Calculated Bicarbonate, Whole Blood', 'Immunoglobulin M', 'Heparin', 'Total Nucleated Cells, Pleural', 'Lactate Dehydrogenase, Pleural', 'Total Protein, Pleural', 'RBC, Pleural', 'Glucose, Pleural', 'Mesothelial Cell', 'HPE2', 'ARCH-1', 'Macrophages', 'C4', 'C3', 'Total Protein, Ascites', 'D-Dimer', 'Gamma Glutamyltransferase', 'Granulocyte Count', 'Triiodothyronine (T3)', 'Other', 'Total Nucleated Cells, Other', 'Cholesterol, Pleural', 'RBC, Other Fluid', 'Valproic Acid', 'Benzodiazepine Screen', 'Lymphs', 'Total Nucleated Cells, CSF', 'Barbiturate Screen', 'RBC, CSF', 'Tricyclic Antidepressant Screen', 'Mesothelial Cells', 'Cocaine, Urine', 'STX6', 'Amphetamine Screen, Urine', 'Benzodiazepine Screen, Urine', 'Albumin/Creatinine, Urine', 'Barbiturate Screen, Urine', 'Opiate Screen, Urine', 'Methadone, Urine')
;


--- with age and sex

SELECT
    DISTINCT
    dicd.subject_id,
    patients.anchor_age,
    patients.gender,
    d_labitems.label,
    labtest.value,
    labtest.valueuom,
    labtest.flag,
FROM `physionet-data.mimic_hosp.diagnoses_icd` dicd
JOIN `physionet-data.mimic_hosp.d_icd_diagnoses` dig 
ON dig.icd_code = dicd.icd_code 
JOIN `physionet-data.mimic_core.patients` patients 
ON dicd.subject_id = patients.subject_id
JOIN`physionet-data.mimic_hosp.labevents` labtest 
ON labtest.subject_id = dicd.subject_id AND labtest.hadm_id= dicd.hadm_id
JOIN `physionet-data.mimic_hosp.d_labitems` d_labitems
ON d_labitems.itemid = labtest.itemid 
WHERE dicd.icd_code IN ('40390', 'I129', 'E1122', '40391', 'I130', '28521', 'D631', 'I120', 'I132', '40310', 'E1022')
AND labtest.value IS NOT null
AND d_labitems.label IN ('Glucose', 'Potassium', 'Sodium', 'Chloride', 'Creatinine', 'Urea Nitrogen', 'Bicarbonate', 'Anion Gap', 'Hematocrit', 'Magnesium', 'Hemoglobin', 'Platelet Count', 'Phosphate', 'White Blood Cells', 'Calcium, Total', 'MCHC', 'Red Blood Cells', 'MCV', 'MCH', 'RDW', 'L', 'H', 'I', 'PTT', 'RDW-SD', 'INR(PT)', 'PT', 'pH', 'Specimen Type', 'pO2', 'Base Excess', 'Calculated Total CO2', 'pCO2', 'Asparate Aminotransferase (AST)', 'Bilirubin, Total', 'Alkaline Phosphatase', 'Alanine Aminotransferase (ALT)', 'Lactate', 'Free Calcium', 'Lymphocytes', 'Monocytes', 'Eosinophils', 'Basophils', 'Lactate Dehydrogenase (LD)', 'Neutrophils', 'Albumin', 'Troponin T', 'Creatine Kinase, MB Isoenzyme', 'Oxygen Saturation', 'Potassium, Whole Blood', 'Creatine Kinase (CK)', 'Specific Gravity', 'Absolute Lymphocyte Count', 'Absolute Neutrophil Count', 'Absolute Eosinophil Count', 'Absolute Basophil Count', 'Absolute Monocyte Count', 'Yeast', 'Vancomycin', 'RBC', 'WBC', 'Epithelial Cells', 'Protein', 'Temperature', 'Immature Granulocytes', 'tacroFK', 'Hematocrit, Calculated', 'Creatinine, Urine', 'Sodium, Whole Blood', 'Bands', 'Fibrinogen, Functional', 'Metamyelocytes', 'Myelocytes', 'Atypical Lymphocytes', 'Sodium, Urine', 'Oxygen', 'Lipase', 'PEEP', 'Chloride, Whole Blood', 'Hyaline Casts', 'Ferritin', 'Iron', 'Osmolality, Urine', 'Iron Binding Capacity, Total', 'Transferrin', 'Urea Nitrogen, Urine', 'Thyroid Stimulating Hormone', 'Tidal Volume', 'Potassium, Urine', 'Uric Acid', 'Amylase', 'Urobilinogen', 'Chloride, Urine', 'Haptoglobin', 'Reticulocyte Count, Automated', 'NTproBNP', 'Nucleated Red Cells', 'Ketone', '% Hemoglobin A1c', 'Urine Color', 'eAG', 'C-Reactive Protein', 'Triglycerides', 'Polys', 'Urine Appearance', 'Blood', 'Leukocytes', 'Bilirubin', 'Nitrite', 'Vitamin B12', 'CK-MB Index', 'Total Protein, Urine', 'Bilirubin, Indirect', 'Reticulocyte Count, Absolute', 'Bilirubin, Direct', 'Protein/Creatinine Ratio', 'Protein, Total', 'Bacteria', 'Cholesterol, Total', 'Cortisol', 'Osmolality, Measured', 'Cholesterol, HDL', 'Cholesterol Ratio (Total/HDL)', 'HPE1', 'Cholesterol, LDL, Calculated', 'HPE3', 'Parathyroid Hormone', 'HPE7', 'Macrophage', 'Monos', 'Folate', 'Cyclosporin', 'Thyroxine (T4), Free', 'Digoxin', 'O2 Flow', 'Phenytoin', 'Granular Casts', 'Required O2', 'Alveolar-arterial Gradient', 'Total Nucleated Cells, Ascites', 'Sedimentation Rate', 'RBC, Ascites', 'Immunoglobulin G', 'Blasts', '25-OH Vitamin D', 'Immunoglobulin A', 'Rapamycin', 'Thyroxine (T4)', 'Globulin', 'Transitional Epithelial Cells', 'Calculated Bicarbonate, Whole Blood', 'Immunoglobulin M', 'Heparin', 'Total Nucleated Cells, Pleural', 'Lactate Dehydrogenase, Pleural', 'Total Protein, Pleural', 'RBC, Pleural', 'Glucose, Pleural', 'Mesothelial Cell', 'HPE2', 'ARCH-1', 'Macrophages', 'C4', 'C3', 'Total Protein, Ascites', 'D-Dimer', 'Gamma Glutamyltransferase', 'Granulocyte Count', 'Triiodothyronine (T3)', 'Other', 'Total Nucleated Cells, Other', 'Cholesterol, Pleural', 'RBC, Other Fluid', 'Valproic Acid', 'Benzodiazepine Screen', 'Lymphs', 'Total Nucleated Cells, CSF', 'Barbiturate Screen', 'RBC, CSF', 'Tricyclic Antidepressant Screen', 'Mesothelial Cells', 'Cocaine, Urine', 'STX6', 'Amphetamine Screen, Urine', 'Benzodiazepine Screen, Urine', 'Albumin/Creatinine, Urine', 'Barbiturate Screen, Urine', 'Opiate Screen, Urine', 'Methadone, Urine')
;



--- Final query with DISTINCT result is 7278145

SELECT
    DISTINCT
    dicd.subject_id,
    patients.anchor_age,
    patients.gender,
    d_labitems.label,
    labtest.value,
    labtest.valueuom,
    labtest.flag,
FROM `physionet-data.mimic_hosp.diagnoses_icd` dicd
JOIN `physionet-data.mimic_hosp.d_icd_diagnoses` dig 
ON dig.icd_code = dicd.icd_code 
JOIN `physionet-data.mimic_core.patients` patients 
ON dicd.subject_id = patients.subject_id
JOIN`physionet-data.mimic_hosp.labevents` labtest 
ON labtest.subject_id = dicd.subject_id AND labtest.hadm_id= dicd.hadm_id
JOIN `physionet-data.mimic_hosp.d_labitems` d_labitems
ON d_labitems.itemid = labtest.itemid 
WHERE dicd.icd_code IN ('40390', 'I129', 'E1122', '40391', 'I130', '28521', 'D631', 'I120', 'I132', '40310', 'E1022')
AND labtest.value IS NOT null
AND d_labitems.label IN ('Glucose', 'Potassium', 'Sodium', 'Chloride', 'Creatinine', 'Urea Nitrogen', 'Bicarbonate', 'Anion Gap', 'Hematocrit', 'Magnesium', 'Hemoglobin', 'Platelet Count', 'Phosphate', 'White Blood Cells', 'Calcium, Total', 'MCHC', 'Red Blood Cells', 'MCV', 'MCH', 'RDW', 'L', 'H', 'I', 'PTT', 'RDW-SD', 'INR(PT)', 'PT', 'pH', 'Specimen Type', 'pO2', 'Base Excess', 'Calculated Total CO2', 'pCO2', 'Asparate Aminotransferase (AST)', 'Bilirubin, Total', 'Alkaline Phosphatase', 'Alanine Aminotransferase (ALT)', 'Lactate', 'Free Calcium', 'Lymphocytes', 'Monocytes', 'Eosinophils', 'Basophils', 'Lactate Dehydrogenase (LD)', 'Neutrophils', 'Albumin', 'Troponin T', 'Creatine Kinase, MB Isoenzyme', 'Oxygen Saturation', 'Potassium, Whole Blood', 'Creatine Kinase (CK)', 'Specific Gravity', 'Absolute Lymphocyte Count', 'Absolute Neutrophil Count', 'Absolute Eosinophil Count', 'Absolute Basophil Count', 'Absolute Monocyte Count', 'Yeast', 'Vancomycin', 'RBC', 'WBC', 'Epithelial Cells', 'Protein', 'Temperature', 'Immature Granulocytes', 'tacroFK', 'Hematocrit, Calculated', 'Creatinine, Urine', 'Sodium, Whole Blood', 'Bands', 'Fibrinogen, Functional', 'Metamyelocytes', 'Myelocytes', 'Atypical Lymphocytes', 'Sodium, Urine', 'Oxygen', 'Lipase', 'PEEP', 'Chloride, Whole Blood', 'Hyaline Casts', 'Ferritin', 'Iron', 'Osmolality, Urine', 'Iron Binding Capacity, Total', 'Transferrin', 'Urea Nitrogen, Urine', 'Thyroid Stimulating Hormone', 'Tidal Volume', 'Potassium, Urine', 'Uric Acid', 'Amylase', 'Urobilinogen', 'Chloride, Urine', 'Haptoglobin', 'Reticulocyte Count, Automated', 'NTproBNP', 'Nucleated Red Cells', 'Ketone', '% Hemoglobin A1c', 'Urine Color', 'eAG', 'C-Reactive Protein', 'Triglycerides', 'Polys', 'Urine Appearance', 'Blood', 'Leukocytes', 'Bilirubin', 'Nitrite', 'Vitamin B12', 'CK-MB Index', 'Total Protein, Urine', 'Bilirubin, Indirect', 'Reticulocyte Count, Absolute', 'Bilirubin, Direct', 'Protein/Creatinine Ratio', 'Protein, Total', 'Bacteria', 'Cholesterol, Total', 'Cortisol', 'Osmolality, Measured', 'Cholesterol, HDL', 'Cholesterol Ratio (Total/HDL)', 'HPE1', 'Cholesterol, LDL, Calculated', 'HPE3', 'Parathyroid Hormone', 'HPE7', 'Macrophage', 'Monos', 'Folate', 'Cyclosporin', 'Thyroxine (T4), Free', 'Digoxin', 'O2 Flow', 'Phenytoin', 'Granular Casts', 'Required O2', 'Alveolar-arterial Gradient', 'Total Nucleated Cells, Ascites', 'Sedimentation Rate', 'RBC, Ascites', 'Immunoglobulin G', 'Blasts', '25-OH Vitamin D', 'Immunoglobulin A', 'Rapamycin', 'Thyroxine (T4)', 'Globulin', 'Transitional Epithelial Cells', 'Calculated Bicarbonate, Whole Blood', 'Immunoglobulin M', 'Heparin', 'Total Nucleated Cells, Pleural', 'Lactate Dehydrogenase, Pleural', 'Total Protein, Pleural', 'RBC, Pleural', 'Glucose, Pleural', 'Mesothelial Cell', 'HPE2', 'ARCH-1', 'Macrophages', 'C4', 'C3', 'Total Protein, Ascites', 'D-Dimer', 'Gamma Glutamyltransferase', 'Granulocyte Count', 'Triiodothyronine (T3)', 'Other', 'Total Nucleated Cells, Other', 'Cholesterol, Pleural', 'RBC, Other Fluid', 'Valproic Acid', 'Benzodiazepine Screen', 'Lymphs', 'Total Nucleated Cells, CSF', 'Barbiturate Screen', 'RBC, CSF', 'Tricyclic Antidepressant Screen', 'Mesothelial Cells', 'Cocaine, Urine', 'STX6', 'Amphetamine Screen, Urine', 'Benzodiazepine Screen, Urine', 'Albumin/Creatinine, Urine', 'Barbiturate Screen, Urine', 'Opiate Screen, Urine', 'Methadone, Urine')
;


--- With some labels result is 17699995

SELECT
    dicd.subject_id,
    patients.anchor_age,
    patients.gender,
    d_labitems.label,
    labtest.value,
    labtest.valueuom,
    labtest.flag,
FROM `physionet-data.mimic_hosp.diagnoses_icd` dicd
JOIN `physionet-data.mimic_hosp.d_icd_diagnoses` dig 
ON dig.icd_code = dicd.icd_code 
JOIN `physionet-data.mimic_core.patients` patients 
ON dicd.subject_id = patients.subject_id
JOIN`physionet-data.mimic_hosp.labevents` labtest 
ON labtest.subject_id = dicd.subject_id AND labtest.hadm_id= dicd.hadm_id
JOIN `physionet-data.mimic_hosp.d_labitems` d_labitems
ON d_labitems.itemid = labtest.itemid 
WHERE dicd.icd_code IN ('40390', 'I129', 'E1122', '40391', 'I130', '28521', 'D631', 'I120', 'I132', '40310', 'E1022')
AND labtest.value IS NOT null
AND d_labitems.label IN ('Glucose', 'Potassium', 'Sodium', 'Chloride', 'Creatinine', 'Urea Nitrogen', 'Bicarbonate', 'Anion Gap', 'Hematocrit', 'Magnesium', 'Hemoglobin', 'Platelet Count', 'Phosphate', 'White Blood Cells', 'Calcium, Total', 'MCHC', 'Red Blood Cells', 'MCV', 'MCH', 'RDW', 'L', 'H', 'I', 'PTT', 'RDW-SD', 'INR(PT)', 'PT', 'pH', 'Specimen Type', 'pO2', 'Base Excess', 'Calculated Total CO2', 'pCO2', 'Asparate Aminotransferase (AST)', 'Bilirubin, Total', 'Alkaline Phosphatase', 'Alanine Aminotransferase (ALT)', 'Lactate', 'Free Calcium', 'Lymphocytes', 'Monocytes', 'Eosinophils', 'Basophils', 'Lactate Dehydrogenase (LD)', 'Neutrophils', 'Albumin', 'Troponin T', 'Creatine Kinase, MB Isoenzyme', 'Oxygen Saturation', 'Potassium, Whole Blood', 'Creatine Kinase (CK)', 'Specific Gravity', 'Absolute Lymphocyte Count', 'Absolute Neutrophil Count', 'Absolute Eosinophil Count', 'Absolute Basophil Count', 'Absolute Monocyte Count', 'Yeast', 'Vancomycin', 'RBC', 'WBC', 'Epithelial Cells', 'Protein', 'Temperature', 'Immature Granulocytes', 'tacroFK', 'Hematocrit, Calculated', 'Creatinine, Urine', 'Sodium, Whole Blood', 'Bands', 'Fibrinogen, Functional', 'Metamyelocytes', 'Myelocytes', 'Atypical Lymphocytes', 'Sodium, Urine', 'Oxygen', 'Lipase', 'PEEP', 'Chloride, Whole Blood', 'Hyaline Casts', 'Ferritin', 'Iron', 'Osmolality, Urine', 'Iron Binding Capacity, Total', 'Transferrin', 'Urea Nitrogen, Urine', 'Thyroid Stimulating Hormone', 'Tidal Volume', 'Potassium, Urine', 'Uric Acid', 'Amylase', 'Urobilinogen', 'Chloride, Urine', 'Haptoglobin', 'Reticulocyte Count, Automated', 'NTproBNP', 'Nucleated Red Cells', 'Ketone', '% Hemoglobin A1c', 'Urine Color', 'eAG', 'C-Reactive Protein', 'Triglycerides', 'Polys', 'Urine Appearance', 'Blood', 'Leukocytes', 'Bilirubin', 'Nitrite', 'Vitamin B12', 'CK-MB Index', 'Total Protein, Urine', 'Bilirubin, Indirect', 'Reticulocyte Count, Absolute', 'Bilirubin, Direct', 'Protein/Creatinine Ratio', 'Protein, Total', 'Bacteria', 'Cholesterol, Total', 'Cortisol', 'Osmolality, Measured', 'Cholesterol, HDL', 'Cholesterol Ratio (Total/HDL)', 'HPE1', 'Cholesterol, LDL, Calculated', 'HPE3', 'Parathyroid Hormone', 'HPE7', 'Macrophage', 'Monos', 'Folate', 'Cyclosporin', 'Thyroxine (T4), Free', 'Digoxin', 'O2 Flow', 'Phenytoin', 'Granular Casts', 'Required O2', 'Alveolar-arterial Gradient', 'Total Nucleated Cells, Ascites', 'Sedimentation Rate', 'RBC, Ascites', 'Immunoglobulin G', 'Blasts', '25-OH Vitamin D', 'Immunoglobulin A', 'Rapamycin', 'Thyroxine (T4)', 'Globulin', 'Transitional Epithelial Cells', 'Calculated Bicarbonate, Whole Blood', 'Immunoglobulin M', 'Heparin', 'Total Nucleated Cells, Pleural', 'Lactate Dehydrogenase, Pleural', 'Total Protein, Pleural', 'RBC, Pleural', 'Glucose, Pleural', 'Mesothelial Cell', 'HPE2', 'ARCH-1', 'Macrophages', 'C4', 'C3', 'Total Protein, Ascites', 'D-Dimer', 'Gamma Glutamyltransferase', 'Granulocyte Count', 'Triiodothyronine (T3)', 'Other', 'Total Nucleated Cells, Other', 'Cholesterol, Pleural', 'RBC, Other Fluid', 'Valproic Acid', 'Benzodiazepine Screen', 'Lymphs', 'Total Nucleated Cells, CSF', 'Barbiturate Screen', 'RBC, CSF', 'Tricyclic Antidepressant Screen', 'Mesothelial Cells', 'Cocaine, Urine', 'STX6', 'Amphetamine Screen, Urine', 'Benzodiazepine Screen, Urine', 'Albumin/Creatinine, Urine', 'Barbiturate Screen, Urine', 'Opiate Screen, Urine', 'Methadone, Urine')
;

---with labtest value is not null 17761144

SELECT
    dicd.subject_id,
    patients.anchor_age,
    patients.gender,
    d_labitems.label,
    labtest.value,
    labtest.valueuom,
    labtest.flag,
FROM `physionet-data.mimic_hosp.diagnoses_icd` dicd
JOIN `physionet-data.mimic_hosp.d_icd_diagnoses` dig 
ON dig.icd_code = dicd.icd_code 
JOIN `physionet-data.mimic_core.patients` patients 
ON dicd.subject_id = patients.subject_id
JOIN`physionet-data.mimic_hosp.labevents` labtest 
ON labtest.subject_id = dicd.subject_id AND labtest.hadm_id= dicd.hadm_id
JOIN `physionet-data.mimic_hosp.d_labitems` d_labitems
ON d_labitems.itemid = labtest.itemid 
WHERE dicd.icd_code IN ('40390', 'I129', 'E1122', '40391', 'I130', '28521', 'D631', 'I120', 'I132', '40310', 'E1022')
AND labtest.value IS NOT null;

---CKD patient with some icd code:18776560
SELECT
    dicd.subject_id,
    patients.anchor_age,
    patients.gender,
    d_labitems.label,
    labtest.value,
    labtest.valueuom,
    labtest.flag,
FROM `physionet-data.mimic_hosp.diagnoses_icd` dicd
JOIN `physionet-data.mimic_hosp.d_icd_diagnoses` dig 
ON dig.icd_code = dicd.icd_code 
JOIN `physionet-data.mimic_core.patients` patients 
ON dicd.subject_id = patients.subject_id
JOIN`physionet-data.mimic_hosp.labevents` labtest 
ON labtest.subject_id = dicd.subject_id AND labtest.hadm_id= dicd.hadm_id
JOIN `physionet-data.mimic_hosp.d_labitems` d_labitems
ON d_labitems.itemid = labtest.itemid 
WHERE dicd.icd_code IN ('40390', 'I129', 'E1122', '40391', 'I130', '28521', 'D631', 'I120', 'I132', '40310', 'E1022')
;



---Only chronic kidney patient result is 19142551
SELECT
    dicd.subject_id,
    patients.anchor_age,
    patients.gender,
    d_labitems.label,
    labtest.value,
    labtest.valueuom,
    labtest.flag,
FROM `physionet-data.mimic_hosp.diagnoses_icd` dicd
JOIN `physionet-data.mimic_hosp.d_icd_diagnoses` dig 
ON dig.icd_code = dicd.icd_code 
JOIN `physionet-data.mimic_core.patients` patients 
ON dicd.subject_id = patients.subject_id
JOIN`physionet-data.mimic_hosp.labevents` labtest 
ON labtest.subject_id = dicd.subject_id AND labtest.hadm_id= dicd.hadm_id
JOIN `physionet-data.mimic_hosp.d_labitems` d_labitems
ON d_labitems.itemid = labtest.itemid 
WHERE dig.long_title LIKE '%chronic kidney%'
;
 