# frozen_string_literal: true

# Create blood cell descriptions
if Admin::BloodCellDescription.find_by(title: 'Blood plasma')
  Rails.logger.debug 'Plasma description already exists'
else
  plasma = Admin::BloodCellDescription.new(
    title: 'Blood plasma',
    glossary_only: false,
    description: "<p>Blood plasma is the yellowish fluid component of blood that constitutes approximately <code>55%</code> of the total blood volume. It is the liquid in which blood cells, platelets, and various substances are suspended. Plasma is crucial for the transportation of nutrients, hormones, antibodies, waste products, and other important components throughout the body.</p>
    <p>Blood plasma consists mainly of water, electrolytes (such as sodium, potassium, and chloride), proteins (including albumin, globulins, and fibrinogen), hormones, enzymes, antibodies, nutrients, and waste products. It serves several crucial functions:</p>
    <ul>
      <li>Transportation: Plasma acts as a medium for carrying cells, nutrients, hormones, and waste products throughout the body.</li>
      <li>Immune Response: It contains antibodies and immune system components that help defend against infections and diseases.</li>
      <li>Regulation of Fluid Balance: Plasma helps maintain the balance of fluids, electrolytes, and pH in the body.</li>
      <li>Blood Clotting: Plasma contains clotting factors that are essential for the coagulation process to prevent excessive bleeding.</li>
      <li>Regulation of Blood Pressure: The proteins in plasma play a role in maintaining the osmotic pressure and fluid balance necessary for blood pressure regulation.</li>
    </ul>
    "
  )
  plasma.links.build(
    name: 'Becker KL. Principles and Practice of Endocrinology and Metabolism. 3rd edition. Lippincott Williams & Wilkins; 2001.',
    url: nil,
    text_generator: false
  )
  plasma.links.build(
    name: 'Hoffbrand AV, Moss PAH, Pettit JE. Essential Haematology. 7th edition. Wiley-Blackwell; 2015.',
    url: nil,
    text_generator: false
  )
  plasma.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  plasma.save

  Rails.logger.debug 'Plasma description created'
end

if Admin::BloodCellDescription.find_by(title: 'Leukocytes (White blood cells)')
  Rails.logger.debug 'Leukocytes description already exists'
else
  leukocytes = Admin::BloodCellDescription.new(
    title: 'Leukocytes (White blood cells)',
    parameter: 'white_blood_cells',
    glossary_only: false,
    description: "<p>Leukocytes, commonly known as white blood cells (WBCs), are a crucial component of the immune system and are essential for the body's defense against infections and diseases. They are a diverse group of cells that play various roles in recognizing, attacking, and eliminating pathogens, foreign substances, and abnormal cells.</p>
    <p>White blood cells are produced in the bone marrow and circulate in the bloodstream and lymphatic system. There are different types of leukocytes, each with its unique functions and characteristics, including:</p>
    <ul>
      <li>Neutrophils: They are the most abundant type of white blood cell and are the first responders to sites of infection or tissue damage.</li>
      <li>Lymphocytes: They include T cells, B cells, and natural killer (NK) cells, and are involved in specific immune responses, such as antibody production and cell-mediated immunity.</li>
      <li>Monocytes: They are involved in phagocytosis and can differentiate into macrophages, playing a role in tissue repair and defense against pathogens.</li>
      <li>Eosinophils: They are important in fighting parasitic infections and have a role in allergic reactions.</li>
      <li>Basophils: They are involved in allergic responses and release histamine and other mediators.</li>
    </ul>
    <p>White blood cells are crucial for several reasons:</p>
    <ul>
      <li>Defense against Infections: They recognize and destroy pathogens, such as bacteria, viruses, and fungi, helping to prevent and control infections.</li>
      <li>Immune Responses: White blood cells play a vital role in specific immune responses, including the production of antibodies, memory cells, and coordination of the immune system.</li>
      <li>Tissue Repair and Inflammation: They contribute to tissue repair, wound healing, and the regulation of inflammation.</li>
      <li>Surveillance of Abnormal Cells: White blood cells help detect and eliminate abnormal or cancerous cells in the body.</li>
      <li>Immunological Memory: Some white blood cells retain memory of previous encounters with pathogens, leading to faster and more effective immune responses upon re-exposure.</li>
      <li>Disease Diagnosis: White blood cell counts and differentials are important diagnostic tools. Abnormal levels or changes in the composition of white blood cells can indicate underlying medical conditions.</li>
    </ul>
    <p>Normal Ranges:</p>
    <p>White blood cell counts are typically reported in one of two units: cells per microliter (<code>cells/µL</code>) or cells per liter (<code>cells/L</code>). The normal range for white blood cell counts can vary slightly between laboratories, but it's generally around <code>4,000</code> to <code>11,000 cells/µL</code> or <code>4.0</code> to <code>11.0 x 10^9 cells/L</code>.</p>
    <p>Interpretation:</p>
    <ul>
      <li>Low White Blood Cell Count (Leukopenia): This can be caused by conditions such as viral infections, bone marrow disorders, certain medications (e.g., chemotherapy), and autoimmune diseases. It can lead to an increased risk of infections.</li>
      <li>High White Blood Cell Count (Leukocytosis): This can result from infections, inflammation, stress, certain medications (e.g., corticosteroids), and bone marrow disorders. In some cases, it can indicate leukemia or other blood disorders.</li>
    </ul>
    "
  )
  leukocytes.links.build(
    name: 'Abbas AK, Lichtman AH, Pillai S. Cellular and Molecular Immunology. 9th edition. Elsevier; 2017.',
    url: nil,
    text_generator: false
  )
  leukocytes.links.build(
    name: 'Kumar, V., Abbas, A. K., Aster, J. C., & Robbins, S. L. (2015). Robbins Basic Pathology (Ninth Edition). Elsevier.',
    url: nil,
    text_generator: false
  )
  leukocytes.links.build(
    name: 'National Library of Medicine. (2022). Leukopenia. MedlinePlus.',
    url: 'https://medlineplus.gov/ency/article/003643.htm',
    text_generator: false
  )
  leukocytes.links.build(
    name: 'National Library of Medicine. (2022). Leukopenia. MedlinePlus.',
    url: 'https://medlineplus.gov/ency/article/003642.htm',
    text_generator: false
  )
  leukocytes.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  leukocytes.save

  Rails.logger.debug 'Leukocytes description created'
end

if Admin::BloodCellDescription.find_by(title: 'Hemoglobin (Hb)')
  Rails.logger.debug 'Hemoglobin description already exists'
else
  hemoglobin = Admin::BloodCellDescription.new(
    title: 'Hemoglobin (Hb)',
    parameter: 'hemoglobin',
    glossary_only: false,
    description: "<p>Hemoglobin is a protein found in red blood cells (erythrocytes) that is responsible for transporting oxygen from the lungs to various tissues and organs in the body. It is an essential component of the circulatory system and plays a crucial role in maintaining overall health and vitality.</p>
      <p>Hemoglobin molecules are composed of four protein chains called globins, each of which is bound to a heme group. The heme group contains iron, which enables hemoglobin to bind and carry oxygen molecules. When oxygen-rich blood reaches the capillaries in the tissues, hemoglobin releases the oxygen, allowing it to be used by cells for various metabolic processes.</p>
      <p>The importance of hemoglobin lies in its role in oxygen transport and delivery to body tissues. Some key points about its significance include:</p>
      <ul>
        <li>Oxygen Transport: Hemoglobin efficiently binds oxygen in the lungs and carries it through the bloodstream to oxygen-deprived tissues, ensuring proper oxygenation and cellular respiration.</li>
        <li>Tissue Oxygenation: Adequate hemoglobin levels are crucial for providing oxygen to vital organs, such as the brain, heart, and muscles, ensuring their proper function.</li>
        <li>Acid-Base Balance: Hemoglobin helps maintain the body's acid-base balance by acting as a buffer, preventing excessive changes in blood pH.</li>
        <li>Carbon Dioxide Transport: Hemoglobin also aids in the removal of carbon dioxide, a waste product of cellular respiration, by binding and transporting it back to the lungs for exhalation.</li>
      </ul>
      <p>Measurement and Normal Values:</p>
      <p>Hemoglobin is typically measured in grams per deciliter (<code>g/dL</code>) of blood. The normal range can vary slightly depending on factors like age, sex, and health status. However, a general reference range for adults is:</p>
      <ul>
        <li>Men: <code>13.8</code> to <code>17.2 g/dL</code></li>
        <li>Women: <code>12.1</code> to <code>15.1 g/dL</code></li>
      </ul>
      <p>Values outside of this range can have various clinical implications:</p>
      <ul>
        <li>Low Hemoglobin (Anemia): Hemoglobin levels below the normal range can indicate anemia, a condition characterized by a decreased oxygen-carrying capacity of the blood. Anemia can result from various factors, including nutritional deficiencies, chronic diseases, and bone marrow disorders.</li>
        <li>High Hemoglobin (Polycythemia): Elevated hemoglobin levels can be associated with conditions like polycythemia, which involves an abnormal increase in the number of red blood cells. This can result from conditions such as chronic hypoxia, kidney disorders, or bone marrow disorders.</li>
      </ul>
    "
  )
  hemoglobin.links.build(
    name: 'Alberts B, Johnson A, Lewis J, et al. Molecular Biology of the Cell. 6th edition. Garland Science; 2014.',
    url: nil,
    text_generator: false
  )
  hemoglobin.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  hemoglobin.save

  Rails.logger.debug 'Hemoglobin description created'
end

if Admin::BloodCellDescription.find_by(title: 'Hematocrit (Hct)')
  Rails.logger.debug 'Hematocrit description already exists'
else
  hematocrit = Admin::BloodCellDescription.new(
    title: 'Hematocrit (Hct)',
    parameter: 'hematocrit',
    glossary_only: false,
    description: "<p>Hematocrit is a measure of the volume of red blood cells (RBCs) in relation to the total volume of blood. It is expressed as a percentage and represents the proportion of blood occupied by RBCs.</p>
    <p>Hematocrit is determined by separating the cellular components (primarily RBCs) from the liquid component (plasma) of blood. It is obtained by centrifuging a blood sample and measuring the height of the RBC layer compared to the total height of the blood sample.</p>
    <p>Hematocrit is important for several reasons:</p>
    <ul>
      <li>Blood Oxygen-Carrying Capacity: Hematocrit provides an estimation of the blood's capacity to carry oxygen since RBCs contain hemoglobin, which binds and transports oxygen to tissues and organs.</li>
      <li>Assessment of Anemia: Hematocrit values below the normal range may indicate anemia, a condition characterized by a decreased number of RBCs or reduced hemoglobin levels.</li>
      <li>Monitoring Blood Disorders: Hematocrit levels can be used to monitor the progression and treatment of various blood disorders, such as polycythemia (abnormally high RBC count) or certain bone marrow disorders.</li>
      <li>Evaluation of Fluid Balance: Changes in hematocrit may indicate alterations in blood volume, such as dehydration (which leads to a higher hematocrit) or fluid overload (which results in a lower hematocrit).</li>
      <li>Assessing Blood Disorders: Hematocrit values, along with other blood cell indices, can provide insight into the presence of specific blood disorders and help guide further diagnostic investigations.</li>
    </ul>
    <p>Measurement and Interpretation:</p>
    <ul>
      <li>Upper Limit: The upper limit of the normal range for adult men is typically around <code>52%</code>, while for adult women, it's around <code>47%</code>. Values above this range may indicate polycythemia or dehydration.</li>
      <li>Lower Limit: The lower limit of the normal range is around 38% for adult men and <code>36%</code> for adult women. Values below this range may suggest anemia or overhydration.</li>
    </ul>
    <p>Most Common Unit: Hematocrit is most commonly expressed as a percentage (<code>%</code>) of the total blood volume.</p>
    <p>Abnormal values, whether high or low, often require further investigation and may be indicative of underlying medical conditions or imbalances in blood composition.</p>
    "
  )
  hematocrit.links.build(
    name: 'Kumar V, Abbas AK, Aster JC. Robbins and Cotran Pathologic Basis of Disease. 9th edition. Elsevier; 2014.',
    url: nil,
    text_generator: false
  )
  hematocrit.links.build(
    name: "McPherson, R., & Pincus, M. (2017). Henry's Clinical Diagnosis and Management by Laboratory Methods. Elsevier.",
    url: nil,
    text_generator: false
  )
  hematocrit.links.build(
    name: 'Hematocrit." StatPearls. 2021.',
    url: 'https://www.ncbi.nlm.nih.gov/books/NBK539761/',
    text_generator: false
  )
  hematocrit.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  hematocrit.save

  Rails.logger.debug 'Hematocrit description created'
end

if Admin::BloodCellDescription.find_by(title: 'Complete blood count (CBC)')
  Rails.logger.debug 'Blood count description already exists'
else
  blood_count = Admin::BloodCellDescription.new(
    title: 'Complete blood count (CBC)',
    glossary_only: false,
    description: "<p>A complete blood count (CBC) is a common laboratory test that provides valuable information about the cellular components of blood. It involves the measurement of various blood cell types and other parameters, offering insights into overall health and potential underlying conditions.</p>
      <p>A CBC typically includes the following measurements:</p>
      <ul>
        <li>Red Blood Cell Count (RBC): This measures the number of red blood cells per volume of blood. The normal range for RBCs is around <code>4.5</code> to <code>6.0</code> million cells per microliter (<code>µL</code>) for men and <code>4.0</code> to <code>5.5 million/µL</code> for women.
        <li>Hemoglobin (Hb): Hemoglobin is a protein in red blood cells that carries oxygen. The normal range for hemoglobin is approximately <code>13.5</code> to <code>17.5</code> grams per deciliter (<code>g/dL</code>) for men and <code>12.0</code> to <code>15.5 g/dL</code> for women.
        <li>Hematocrit (Hct): This is the percentage of blood volume occupied by red blood cells. The normal range for hematocrit is about <code>38.3%</code> to <code>48.6%</code> for men and <code>35.5%</code> to <code>44.9%</code> for women.
        <li>White Blood Cell Count (WBC): This measures the total number of white blood cells, which are critical for the immune system. The normal range for WBCs is typically <code>4,000</code> to <code>11,000/µL</code>.
        <li>Platelet Count: Platelets are important for blood clotting. The normal range for platelet counts is approximately <code>150,000</code> to <code>450,000/µL</code>.
      </ul>
      <p>A CBC is important for several reasons:</p>
      <ul>
        <li>Diagnostic Tool: It serves as an initial screening test to evaluate overall blood health and detect various blood-related disorders, such as anemia, infections, or leukemia.</li>
        <li>Monitoring Treatment: CBCs can help assess the effectiveness of treatments like chemotherapy or blood transfusions, aiding in disease management.</li>
        <li>Health Checkup: Routine CBCs are often performed during regular checkups to evaluate an individual's overall health status.</li>
        <li>Preoperative Assessment: Prior to surgery, a CBC can identify any underlying blood disorders or conditions that may affect the surgical procedure or postoperative care.</li>
        <li>Follow-up Tool: CBCs may be repeated over time to monitor disease progression, response to treatment, or recovery from illness.</li>
      </ul>
    "
  )
  blood_count.links.build(
    name: "Greer JP, Foerster J, Rodgers GM, et al. Wintrobe's Clinical Hematology. 13th edition. Wolters Kluwer; 2013.",
    url: nil,
    text_generator: false
  )
  blood_count.links.build(
    name: 'Hoffman R, Benz EJ Jr, Silberstein LE, Heslop H, Weitz JI, Anastasi J. Hematology: Basic Principles and Practice. 7th edition. Elsevier; 2018.',
    url: nil,
    text_generator: false
  )
  blood_count.links.build(
    name: 'Buttarello M. Laboratory diagnosis of anemia: are the old and new red cell parameters useful in classification and treatment, how? Int J Lab Hematol. 2016;38 Suppl 1:123-32.',
    url: nil,
    text_generator: false
  )
  blood_count.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  blood_count.save

  Rails.logger.debug 'Blood count description created'
end

if Admin::BloodCellDescription.find_by(title: 'Coagulation')
  Rails.logger.debug 'Coagulation description already exists'
else
  coagulation = Admin::BloodCellDescription.new(
    title: 'Coagulation',
    glossary_only: false,
    description: "<p>Blood coagulation, also known as blood clotting or hemostasis, is a complex physiological process that plays a vital role in preventing excessive bleeding and maintaining the integrity of the circulatory system. It involves a series of well-coordinated steps leading to the formation of a clot at the site of vascular injury.</p>
      <p>When a blood vessel is damaged, the process of coagulation is initiated through two main pathways: the intrinsic pathway and the extrinsic pathway. These pathways involve the activation of specific factors and the conversion of proenzymes into enzymes, ultimately leading to the formation of a stable blood clot.</p>
      <p>Blood coagulation is important for several reasons:</p>
      <ul>
        <li>Preventing Excessive Bleeding: Coagulation helps seal off the damaged blood vessel, preventing excessive blood loss and promoting wound healing.</li>
        <li>Maintaining Blood Vessel Integrity: The formation of a clot helps to maintain the integrity of blood vessels, preventing the leakage of blood into surrounding tissues.</li>
        <li>Providing a Scaffold for Tissue Repair: The clot forms a temporary scaffold that supports the migration and proliferation of cells involved in tissue repair.</li>
        <li>Trapping Pathogens: Blood clots can also trap and localize infectious agents, preventing their spread throughout the body.</li>
        <li>Regulating Clot Formation: The coagulation process is tightly regulated to ensure clot formation occurs only when needed, preventing the formation of clots in healthy blood vessels.</li>
      </ul>
      <p>Normal Ranges:</p>
      <p>The normal range for blood coagulation tests can vary depending on the specific test being performed. Common coagulation tests include prothrombin time (PT) and activated partial thromboplastin time (aPTT). For PT, the typical reference range is around <code>11-13 seconds</code>, while for aPTT, it is approximately <code>30-40 seconds</code>. These values may vary between different laboratories and should be interpreted in the context of the clinical situation.</p>
      <p>Abnormal Values:</p>
      <ul>
        <li>Prolonged PT: A prolonged PT can indicate a deficiency in certain coagulation factors, such as those involved in the extrinsic coagulation pathway. This may increase the risk of bleeding and can be seen in conditions like liver disease or vitamin K deficiency.</li>
        <li>Prolonged aPTT: A prolonged aPTT may suggest a deficiency in factors of the intrinsic coagulation pathway and can be associated with bleeding disorders, such as hemophilia.</li>
        <li>Shortened Coagulation Times: Shortened coagulation times may indicate a prothrombotic state, where there is an increased risk of blood clot formation. This can be seen in conditions like deep vein thrombosis (DVT) or factor V Leiden mutation.</li>
      </ul>
      <p>Note:</p>
      <p>The interpretation of coagulation test results should always be done in consultation with a healthcare provider, as multiple factors can influence coagulation status, and additional tests may be necessary for a comprehensive assessment.</p>
    "
  )
  coagulation.links.build(
    name: 'Hoffman M, Monroe DM 3rd. Coagulation 2006: a modern view of hemostasis. Hematology Am Soc Hematol Educ Program. 2006;2006(1):1-4.',
    url: nil,
    text_generator: false
  )
  coagulation.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  coagulation.save

  Rails.logger.debug 'Coagulation description created'
end

if Admin::BloodCellDescription.find_by(title: 'Anticoagulants')
  Rails.logger.debug 'Anticoagulants description already exists'
else
  anticoagulants = Admin::BloodCellDescription.new(
    title: 'Anticoagulants',
    glossary_only: false,
    description: "<p>Blood anticoagulants are substances or medications that prevent or inhibit blood clot formation, also known as coagulation. They play a crucial role in maintaining proper blood flow and preventing the formation of unwanted blood clots. Anticoagulants are used in various clinical settings to manage and prevent conditions associated with abnormal clotting.</p>
      <p>Anticoagulants work through different mechanisms to interfere with the coagulation process. They may target specific factors or enzymes involved in clot formation or inhibit platelet aggregation, ultimately preventing the formation of stable blood clots.</p>
      <p>The importance of blood anticoagulants includes:</p>
      <ul>
        <li>Prevention of Thrombosis: Anticoagulants are used to prevent the formation of blood clots in various situations, such as in individuals with a history of thromboembolic events or those at high risk for developing clots, such as during surgery or prolonged immobility.</li>
        <li>Treatment of Thromboembolic Disorders: Anticoagulants are commonly used to treat conditions such as deep vein thrombosis (DVT), pulmonary embolism (PE), and atrial fibrillation, where the risk of clot formation and subsequent complications is high.</li>
        <li>Management of Cardiovascular Diseases: Anticoagulants play a role in managing certain cardiovascular conditions, including heart valve disorders, arterial thrombosis, and coronary artery disease.</li>
        <li>Use in Medical Procedures: Anticoagulants are employed during procedures like hemodialysis, cardiac surgeries, and certain interventions to prevent clot formation.</li>
        <li>Prevention of Stroke: Anticoagulants, particularly those targeting specific clotting factors, are utilized in the prevention of stroke in individuals with atrial fibrillation or other high-risk conditions.</li>
      </ul>
      <p>Upper and Lower Limits:</p>
      <p>The effectiveness and safety of anticoagulants are monitored through a blood test called the International Normalized Ratio (INR). The INR is a standardized measurement used to determine the time it takes for a patient's blood to clot compared to a control sample. The target INR range can vary based on the specific condition being treated and the type of anticoagulant used. In general, the therapeutic range for INR is typically between <code>2.0</code> and <code>3.0</code>, but it can be higher for certain conditions or lower for others.</p>
      <p>Most Common Unit:</p>
      <p>The most common unit used to measure the effectiveness of anticoagulants is the International Normalized Ratio (<code>INR</code>).</p>
      <p>Interpreting INR Values:</p>
      <ul>
        <li>Below Target Range (<code>INR < 2.0</code>): This indicates that the blood is clotting too quickly, which can increase the risk of thrombosis (clot formation).</li>
        <li>Within Target Range (<code>INR 2.0 - 3.0</code>): This is the typical therapeutic range for many anticoagulant therapies and indicates that the blood is clotting at an appropriate rate, reducing the risk of clot formation.</li>
        <li>Above Target Range (<code>INR > 3.0</code>): An INR above the target range suggests that the blood is clotting too slowly, which can increase the risk of bleeding complications.</li>
      </ul>
      <p>The specific target INR range and the interpretation of values can vary based on the individual patient, their underlying condition, and the type of anticoagulant used.</p>
    "
  )
  anticoagulants.links.build(
    name: 'Weitz JI, Fredenburgh JC. Anticoagulant Drugs. In: Hoffman R, Benz EJ Jr, Silberstein LE, et al., editors. Hematology: Basic Principles and Practice. 7th edition. Elsevier; 2018.',
    url: nil,
    text_generator: false
  )
  anticoagulants.links.build(
    name: 'Hirsh J, Raschke R. Heparin and Low-Molecular-Weight Heparin: The Seventh ACCP Conference on Antithrombotic and Thrombolytic Therapy. Chest. 2004;126(3 Suppl):188S-203S.',
    url: nil,
    text_generator: false
  )
  anticoagulants.links.build(
    name: 'Douketis JD, Crowther MA, Foster GA, Ginsberg JS. Does the INR value and the level of anticoagulation influence the clinical outcome of patients treated with heparin? Arch Intern Med. 2000;160(12):1612-1617.',
    url: nil,
    text_generator: false
  )
  anticoagulants.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  anticoagulants.save

  Rails.logger.debug 'Anticoagulants description created'
end

if Admin::BloodCellDescription.find_by(title: 'Blood types')
  Rails.logger.debug 'Blood types description already exists'
else
  blood_types = Admin::BloodCellDescription.new(
    title: 'Blood types',
    glossary_only: false,
    description: "<p>Blood types refer to the classification of blood based on the presence or absence of specific antigens on the surface of red blood cells. The most well-known blood typing system is the ABO system, which categorizes blood into four major types: A, B, AB, and O. Additionally, the Rh factor (positive or negative) is another crucial component of blood typing.</p>
    <p>Blood types are determined by inherited genetic traits. The presence or absence of specific antigens on red blood cells leads to the categorization of blood types. The ABO system is based on the presence or absence of A and B antigens, while the Rh system focuses on the presence or absence of the Rh antigen.</p>
    <p>Blood type is important for several reasons:</p>
    <ul>
      <li>Blood Transfusions: Matching blood types between donors and recipients is vital to ensure compatibility and avoid adverse reactions, such as hemolysis or agglutination.</li>
      <li>Pregnancy and Hemolytic Disease of the Newborn: Incompatibility between the mother's and fetus's blood types, particularly in Rh-negative mothers carrying Rh-positive fetuses, can lead to the development of antibodies that may affect subsequent pregnancies.</li>
      <li>Organ and Tissue Transplants: Blood type compatibility is considered when determining suitable donors for organ or tissue transplantation to minimize the risk of rejection.</li>
      <li>Forensic Medicine: Blood typing is utilized in forensic investigations to determine potential matches between blood samples found at crime scenes and suspects.</li>
      <li>Anthropology and Genetics: Blood typing plays a role in understanding human populations, migration patterns, and the inheritance of blood type traits.</li>
    </ul>
    "
  )
  blood_types.links.build(
    name: 'Dean L. Blood Groups and Red Cell Antigens. National Center for Biotechnology Information (US); 2005.',
    url: nil,
    text_generator: false
  )
  blood_types.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  blood_types.save

  Rails.logger.debug 'Blood types description created'
end

# Create blood cell descriptions
if Admin::BloodCellDescription.find_by(title: 'Erythroid cells')
  Rails.logger.debug 'Erythroids description already exists'
else
  erythroids = Admin::BloodCellDescription.new(
    title: 'Erythroid cells',
    parameter: 'red_blood_cells',
    glossary_only: false,
    description: "<p>Erythroid cells, also known as red blood cells (RBCs), are specialized cells in the bloodstream responsible for transporting oxygen to tissues and organs throughout the body. In blood work, erythroid cells are often abbreviated as RBC, and their unit of measurement is typically reported as the number of cells per microliter (<code>10^6/μL</code>) or as a concentration in grams per deciliter (<code>g/dL</code>).</p>
      <p>The normal range for erythroid cell counts and hemoglobin levels in adults can vary slightly, but generally, the reference ranges are:</p>
      <ul>
        <li>Erythroid cell count: Typically between 4.5 and 5.5 million cells per microliter (<code>4.5 - 5.5 x 10^6/μL</code>).</li>
        <li>Hemoglobin level: Usually between 12 and 16 grams per deciliter (<code>12 - 16 g/dL</code>) for females and 13.5 to 17.5 grams per deciliter (<code>13.5 - 17.5 g/dL</code>) for males.</li>
      </ul>
      <p>Low erythroid cell counts or hemoglobin levels, known as anemia, can be caused by various factors, including:</p>
      <ul>
        <li>Iron deficiency, which may be due to inadequate dietary intake, chronic blood loss, or poor iron absorption.</li>
        <li>Vitamin deficiencies, particularly vitamin B12 or folate.</li>
        <li>Chronic diseases, such as kidney disease or autoimmune disorders.</li>
        <li>Bone marrow disorders, like aplastic anemia or myelodysplastic syndromes.</li>
      </ul>
      <p>High erythroid cell counts or hemoglobin levels can be observed in conditions such as:</p>
      <ul>
        <li>Polycythemia vera, a rare blood disorder characterized by the overproduction of red blood cells.</li>
        <li>Chronic lung diseases, like chronic obstructive pulmonary disease (COPD) or congenital heart defects.</li>
        <li>Living at high altitudes where there is reduced oxygen availability.</li>
        <li>Dehydration, leading to a relative increase in the concentration of red blood cells.</li>
      </ul>
    "
  )
  erythroids.links.build(
    name: 'National Heart, Lung, and Blood Institute (NHLBI). What Is Anemia?',
    url: 'https://www.nhlbi.nih.gov/health-topics/anemia',
    text_generator: false
  )
  erythroids.links.build(
    name: 'Hoffbrand AV, Moss PAH, Pettit JE. Essential Haematology. 7th edition. Wiley-Blackwell; 2015.',
    url: nil,
    text_generator: false
  )
  erythroids.links.build(
    name: 'Kaushansky K, Lichtman MA, Prchal JT, Levi MM, Press OW, Burns LJ, Caligiuri MA. Williams Hematology. 9th edition. McGraw-Hill Education; 2020.',
    url: nil,
    text_generator: false
  )
  erythroids.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  erythroids.save

  Rails.logger.debug 'Erythroids description created'
end

if Admin::BloodCellDescription.find_by(title: 'Lymphocytes')
  Rails.logger.debug 'Lymphocytes description already exists'
else
  lymphocytes = Admin::BloodCellDescription.new(
    title: 'Lymphocytes',
    parameter: 'lymphocytes',
    glossary_only: false,
    description: "<p>Lymphocytes are a type of white blood cell, also known as leukocytes, that are a fundamental part of the immune system. They play a critical role in defending the body against infections and diseases. Lymphocytes are an essential component of the adaptive immune system, which provides specific and long-lasting protection against pathogens.</p>
      <p>Lymphocytes can be classified into three main types:</p>
      <ul>
        <li>T-lymphocytes (T cells): These cells play a central role in cell-mediated immunity. They recognize and destroy infected or abnormal cells and help regulate the immune response.</li>
        <li>B-lymphocytes (B cells): B cells are responsible for the production of antibodies (immunoglobulins), which are proteins that can neutralize pathogens and facilitate their removal from the body.</li>
        <li>Natural Killer (NK) cells: NK cells are a type of cytotoxic lymphocyte that can identify and kill infected or cancerous cells.</li>
      </ul>
      <p>Lymphocytes are crucial for several reasons:</p>
      <ul>
        <li>Immune Defense: They recognize and target a wide range of pathogens, including bacteria, viruses, fungi, and cancer cells.</li>
        <li>Immunological Memory: Lymphocytes retain a memory of previous encounters with specific pathogens, allowing for a faster and more effective response upon reexposure.</li>
        <li>Long-lasting Protection: The adaptive immune response orchestrated by lymphocytes provides long-lasting immunity to specific diseases.</li>
        <li>Regulation: Lymphocytes help regulate the immune response to prevent excessive inflammation and tissue damage.</li>
        <li>Immunosurveillance: They continuously monitor the body for signs of infection or abnormal cell growth, contributing to early detection and response.</li>
      <p>Normal Ranges and Units:</p>
      <p>The normal reference ranges for lymphocyte counts may vary slightly between laboratories and can depend on factors such as the individual's age. In adults, the typical range for lymphocytes is approximately <code>20%</code> to <code>40%</code> of the total white blood cell count, or around <code>1,000</code> to <code>4,000</code> lymphocytes per microliter (<code>µL</code>) of blood. The units used for lymphocyte counts are typically cells per microliter (<code>µL</code>) or cells per liter (<code>L</code>).</p>
      <p>Interpretation of Values:</p>
      <ul>
        <li>Low Lymphocyte Count (Lymphocytopenia): This may indicate a weakened immune system, which can be caused by various factors, including viral infections, immune system disorders, chemotherapy, or certain medications.</li>
        <li>High Lymphocyte Count (Lymphocytosis): An elevated lymphocyte count can be a response to infections, inflammatory conditions, or some types of leukemia or lymphoma.</li>
      </ul>
    "
  )
  lymphocytes.links.build(
    name: 'National Library of Medicine. Lymphocytopenia. MedlinePlus.',
    url: 'https://medlineplus.gov/ency/article/003657.htm',
    text_generator: false
  )
  lymphocytes.links.build(
    name: 'Abbas AK, Lichtman AH, Pillai S. Cellular and Molecular Immunology. 9th edition. Elsevier; 2017.',
    url: nil,
    text_generator: false
  )
  lymphocytes.links.build(
    name: 'Hoffbrand, A. V., Moss, P. A. H., & Pettit, J. E. (2015). Essential Haematology (7th ed.). Wiley-Blackwell.',
    url: nil,
    text_generator: false
  )
  lymphocytes.links.build(
    name: 'American Association for Clinical Chemistry (AACC). Lymphocytes. Lab Tests Online.',
    url: 'https://labtestsonline.org/tests/lymphocytes',
    text_generator: false
  )
  lymphocytes.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  lymphocytes.save

  Rails.logger.debug 'Lymphocytes description created'
end

if Admin::BloodCellDescription.find_by(title: 'Monocytes')
  Rails.logger.debug 'Monocytes description already exists'
else
  monocytes = Admin::BloodCellDescription.new(
    title: 'Monocytes',
    parameter: 'monocytes',
    glossary_only: false,
    description: "<p>Monocytes are a type of white blood cell (leukocyte) that plays a crucial role in the immune system's defense against infections and other diseases. They are part of the innate immune system and function as phagocytes, which means they have the ability to engulf and digest pathogens, dead cells, and other debris in the body.</p>
      <p>Monocytes are vital for several reasons:</p>
      <ul>
        <li>Immune Response: Monocytes are instrumental in the immune response to infections. They can migrate to tissues where infection or inflammation is present and differentiate into macrophages, which are highly effective in engulfing and destroying pathogens.</li>
        <li>Tissue Repair: Monocytes and macrophages are involved in the repair and remodeling of damaged tissues. They help clear away dead cells and debris, promoting the healing process.</li>
        <li>Antigen Presentation: Monocytes and macrophages serve as antigen-presenting cells (APCs). They process and present antigens from engulfed pathogens to helper T cells, initiating a specific immune response.</li>
      </ul>
      <p>Normal Values and Units:</p>
      <p>Monocyte levels are typically reported as a percentage (<code>%</code>) of total white blood cells or as an absolute count in cells per microliter (<code>µL</code>). The reference range for monocytes in a typical complete blood count (CBC) is as follows:</p>
      <ul>
        <li>Percentage of total white blood cells: <code>2%</code> to <code>9%</code></li>
        <li>Absolute monocyte count: <code>0.2</code> to <code>0.8 x 10^9/L</code> (cells per microliter)</li>
      </ul>
      <p>Interpretation:</p>
      <ul>
        <li>Low Monocyte Levels (Monocytopenia): A decreased monocyte count may be associated with conditions like immunosuppression, bone marrow disorders, or specific infections. It can also be a side effect of some medications.</li>
        <li>High Monocyte Levels (Monocytosis): An increased monocyte count may indicate an ongoing infection, chronic inflammatory condition, or certain diseases such as tuberculosis, mononucleosis, or myelodysplastic syndrome.</li>
      </ul>
    "
  )
  monocytes.links.build(
    name: 'Kumar V, Abbas AK, Aster JC. Robbins Basic Pathology. 9th edition. Elsevier; 2012.',
    url: nil,
    text_generator: false
  )
  monocytes.links.build(
    name: 'Swirski FK, Nahrendorf M. Leukocyte behavior in atherosclerosis, myocardial infarction, and heart failure. Science. 2013;339(6116):161-166.',
    url: nil,
    text_generator: false
  )
  monocytes.links.build(
    name: 'Medscape',
    url: 'https://emedicine.medscape.com/article/208506-overview',
    text_generator: false
  )
  monocytes.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  monocytes.save

  Rails.logger.debug 'Monocytes description created'
end

if Admin::BloodCellDescription.find_by(title: 'Platelets')
  Rails.logger.debug 'Thrombocytes description already exists'
else
  thrombocytes = Admin::BloodCellDescription.new(
    title: 'Platelets',
    parameter: 'thrombozythes',
    glossary_only: false,
    description: "<p>Thrombocytes, also referred to as platelets, are small, irregularly-shaped blood cells that play a crucial role in the process of blood clotting, known as hemostasis.</p>
      <p>In the context of blood work, thrombocytes are commonly abbreviated as PLT, and their unit of measurement is typically reported as platelets per microliter of blood (<code>10^9/L</code> or <code>thousand/μL</code>).</p>
      <p>The normal range for platelet counts in a healthy individual typically falls between <code>150,000</code> and <code>450,000 platelets per microliter</code> of blood (<code>150-450 x 10^9/L</code>). Deviations from this range may indicate certain medical conditions or factors that impact platelet production, survival, or consumption.</p>
      <p>Low platelet counts, referred to as thrombocytopenia, can be attributed to various factors, including:</p>
      <ul>
        <li> Impaired platelet production in the bone marrow due to conditions like aplastic anemia, leukemia, or myelodysplastic syndromes.</li>
        <li> Increased platelet destruction or consumption resulting from autoimmune disorders, such as immune thrombocytopenic purpura (ITP) or systemic lupus erythematosus (SLE).</li>
        <li> Medications, including heparin, chemotherapeutic agents, or certain antibiotics.</li>
        <li> Viral infections, such as dengue fever or HIV.</li>
      </ul>
      <p>High platelet counts, known as thrombocytosis, can be caused by various factors, including:</p>
      <ul>
        <li> Chronic inflammatory conditions, like rheumatoid arthritis or inflammatory bowel disease.</li>
        <li> Infections, such as tuberculosis or chronic hepatitis.</li>
        <li> Bone marrow disorders, including essential thrombocythemia or polycythemia vera.</li>
        <li> Certain cancers, particularly those affecting the bone marrow or blood, like leukemia or lymphoma.</li>
        <li> Medications, such as steroids or epinephrine.</li>
      </ul>
    "
  )
  thrombocytes.links.build(
    name: 'National Heart, Lung, and Blood Institute (NHLBI). What are platelets and why are they important?',
    url: 'https://www.nhlbi.nih.gov/health-topics/platelets',
    text_generator: false
  )
  thrombocytes.links.build(
    name: 'Mayo Clinic. Thrombocytopenia (low platelet count)',
    url: 'https://www.mayoclinic.org/diseases-conditions/thrombocytopenia/symptoms-causes/syc-20378293',
    text_generator: false
  )
  thrombocytes.links.build(
    name: 'Griesshammer M. Myeloproliferative Neoplasms Associated with Elevated Platelet Counts. In: Tefferi A, editor. Myeloproliferative Neoplasms: Diagnosis and Treatment. Springer; 2018',
    url: nil,
    text_generator: false
  )
  thrombocytes.links.build(
    name: 'Kitchens CS. Thrombocytopenia and Platelet Dysfunction. In: Kitchens CS, Alving BM, Kessler CM, editors. Consultative Hemostasis and Thrombosis. 4th edition. Saunders Elsevier; 2013.',
    url: nil,
    text_generator: false
  )
  thrombocytes.links.build(
    name: 'Hoffbrand AV, Moss PAH, Pettit JE. Essential Haematology. 7th edition. Wiley-Blackwell; 2015.',
    url: nil,
    text_generator: false
  )
  thrombocytes.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  thrombocytes.save

  Rails.logger.debug 'Thrombocytes description created'
end

if Admin::BloodCellDescription.find_by(title: 'Neutrophil cells')
  Rails.logger.debug 'Neutrophils description already exists'
else
  neutrophils = Admin::BloodCellDescription.new(
    title: 'Neutrophil cells',
    parameter: 'neutrophils',
    glossary_only: false,
    description: "<p>Neutrophils are a type of white blood cell, also known as neutrophil granulocytes, that play a pivotal role in the immune system's response to infections. They are the most abundant type of white blood cells and are classified as granulocytes due to the presence of granules in their cytoplasm, which contain various enzymes and antimicrobial substances. Neutrophils are part of the body's innate immune system, providing a rapid and nonspecific defense against a wide range of pathogens, primarily bacteria and fungi.</p>
      <p>Importance of Neutrophils:</p>
      <ul>
        <li>Innate Immune Response: Neutrophils are essential components of the body's innate immune response, serving as the first line of defense against invading pathogens.</li>
        <li>Phagocytosis: Neutrophils are highly effective phagocytes, meaning they can engulf and digest bacteria, fungi, and other foreign particles.</li>
        <li>Inflammatory Response: Neutrophils are recruited to sites of infection or tissue damage, where they release various chemical signals to initiate the inflammatory response, which helps to contain and eliminate infections.</li>
        <li>Antimicrobial Activity: Neutrophils contain granules filled with enzymes and antimicrobial proteins that can directly destroy pathogens.</li>
        <li>Respiratory Burst: Neutrophils produce reactive oxygen species (ROS) during an oxidative burst, which further aids in killing microorganisms.</li>
      </ul>
      <p>Normal Ranges:</p>
      <p>The normal range for neutrophil counts is typically between <code>40%</code> and <code>75%</code> of the total white blood cell count.</p>
      <p>Neutrophil counts are usually reported in absolute terms, with a normal range of <code>2,000</code> to <code>7,500</code> neutrophils per microliter (<code>10^9/L</code>).</p>
      <p>Abnormal Values:</p>
      <ul>
        <li>Low Neutrophil Count (Neutropenia): Neutropenia, characterized by a decreased neutrophil count, can result from bone marrow disorders, viral infections (e.g., HIV), chemotherapy or radiation therapy, certain medications, and autoimmune conditions. It increases the risk of severe infections.</li>
        <li>High Neutrophil Count (Neutrophilia): Neutrophilia, characterized by an elevated neutrophil count, is often seen in response to bacterial infections, inflammatory conditions (e.g., rheumatoid arthritis), physical or emotional stress, and some medications. It can also be associated with certain myeloproliferative disorders.</li>
      </ul>
    "
  )
  neutrophils.links.build(
    name: 'Abbas AK, Lichtman AH, Pillai S. Cellular and Molecular Immunology. 9th edition. Elsevier; 2017.',
    url: nil,
    text_generator: false
  )
  neutrophils.links.build(
    name: 'National Library of Medicine. Neutropenia. MedlinePlus.',
    url: 'https://medlineplus.gov/ency/article/001090.htm',
    text_generator: false
  )
  neutrophils.links.build(
    name: 'American Association for Clinical Chemistry (AACC). Neutrophils. Lab Tests Online.',
    url: 'https://labtestsonline.org/tests/neutrophils',
    text_generator: false
  )
  neutrophils.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  neutrophils.save

  Rails.logger.debug 'Neutrophils description created'
end

if Admin::BloodCellDescription.find_by(title: 'Basophil cells')
  Rails.logger.debug 'Basophils description already exists'
else
  basophils = Admin::BloodCellDescription.new(
    title: 'Basophil cells',
    parameter: 'basophils',
    glossary_only: false,
    description: "<p>Basophils are a type of white blood cell involved in the immune response, specifically in allergic reactions and defense against parasites. In blood work, basophils are abbreviated as BASO or BAS in blood count reports, and their unit of measurement is typically reported as a percentage of the total white blood cell count.</p>
      <p>In a healthy individual, basophils constitute a small fraction of the total white blood cell count, usually ranging from <code>0.5%</code> to <code>1%</code> of the total white blood cells. They are usually reported as a percentage. The absolute basophil count is usually measured in cells per microliter (<code>cells/μL</code>). A normal range for the absolute basophil count is around <code>20</code> to <code>300 cells/μL</code>.</p>
      <p>Low basophil values, known as basopenia, are not typically considered clinically significant. They are generally not associated with specific health conditions and are usually inconsequential.</p>
      <p>High basophil counts, known as basophilia, can occur due to several factors, including:</p>
      <ul>
        <li>Allergic reactions, such as asthma or hay fever.</li>
        <li>Chronic inflammatory conditions, like ulcerative colitis or rheumatoid arthritis.</li>
        <li>Chronic myeloid leukemia or other myeloproliferative disorders.</li>
        <li>Hypothyroidism or certain other endocrine disorders.</li>
      </ul>
    "
  )
  basophils.links.build(
    name: 'Abbas AK, Lichtman AH, Pillai S. Cellular and Molecular Immunology. 9th edition. Elsevier; 2017.',
    url: nil,
    text_generator: false
  )
  basophils.links.build(
    name: 'National Library of Medicine. Basophilia. MedlinePlus.',
    url: 'https://medlineplus.gov/ency/article/003647.htm',
    text_generator: false
  )
  basophils.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  basophils.save

  Rails.logger.debug 'Basophils description created'
end

if Admin::BloodCellDescription.find_by(title: 'Eosinophil cells')
  Rails.logger.debug 'Eosinophils description already exists'
else
  eosinophils = Admin::BloodCellDescription.new(
    title: 'Eosinophil cells',
    parameter: 'eosinophils',
    glossary_only: false,
    description: "<p>Eosinophils are a type of white blood cell involved in the immune response against parasites and in allergic reactions. In blood work, eosinophils are often abbreviated as EOS or EO in blood count reports, and their unit of measurement is typically reported as a percentage of the total white blood cell count.</p>
      <p>Eosinophil levels are typically measured as a percentage of total white blood cells in a complete blood count (CBC) or as an absolute count in cells per microliter (µL) of blood. The normal reference range for eosinophils is approximately <code>0.0%</code> to <code>4.0%</code> of the total white blood cell count or <code>0</code> to <code>450 eosinophils per µL</code>.</p>
      <p>Low eosinophil values, known as eosinopenia, are generally not considered significant and are not associated with specific health conditions.</p>
      <p>High eosinophil counts, known as eosinophilia, can occur due to several factors, including:</p>
      <ul>
        <li>Allergic reactions, such as asthma or hay fever.</li>
        <li>Parasitic infections, like intestinal parasites or certain helminth infections.</li>
        <li>Autoimmune disorders, including eosinophilic granulomatosis with polyangiitis (formerly known as Churg-Strauss syndrome) or systemic lupus erythematosus (SLE).</li>
        <li>Certain types of cancers, such as Hodgkin's lymphoma or eosinophilic leukemia.</li>
      </ul>
    "
  )
  eosinophils.links.build(
    name: 'Abbas AK, Lichtman AH, Pillai S. Cellular and Molecular Immunology. 9th edition. Elsevier; 2017.',
    url: nil,
    text_generator: false
  )
  eosinophils.links.build(
    name: 'National Library of Medicine. Eosinophilia. MedlinePlus.',
    url: 'https://medlineplus.gov/ency/article/003665.htm',
    text_generator: false
  )
  eosinophils.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  eosinophils.save

  Rails.logger.debug 'Eosinophils description created'
end

if Admin::BloodCellDescription.find_by(title: 'Fibrinogen')
  Rails.logger.debug 'Fibrinogen description already exists'
else
  fibrinogen = Admin::BloodCellDescription.new(
    title: 'Fibrinogen',
    parameter: 'fibrinogen',
    glossary_only: true,
    description: "<p>Fibrinogen is a soluble protein found in the blood that plays a critical role in the blood clotting process, also known as coagulation. This essential protein is produced by the liver and is one of the key factors involved in the formation of blood clots to prevent excessive bleeding.</p>
    <p>Importance of Fibrinogen:</p>
    <ol>
      <li>Blood Clot Formation: Fibrinogen is converted into fibrin, a fibrous protein, during the blood coagulation process. Fibrin forms a mesh-like structure that traps blood cells and platelets, leading to the formation of a stable blood clot at the site of injury. This helps prevent excessive bleeding in the event of vascular damage.</li>
      <li>Hemostasis: Fibrinogen is a vital component of hemostasis, the body's natural response to blood vessel injury. It ensures that the integrity of the circulatory system is maintained and that blood loss is controlled.</li>
      <li>Wound Healing: The formation of a fibrin clot provides a scaffold for tissue repair and wound healing. It supports the migration of cells involved in the healing process.</li>
    </ol>
    <p>Measurement of Fibrinogen:</p>
    <p>Fibrinogen levels are typically measured in blood tests using different units and reference ranges. The most common unit for measuring fibrinogen is grams per liter (<code>g/L</code>) or milligrams per deciliter (<code>mg/dL</code>). The reference range for fibrinogen levels can vary slightly between laboratories, but a typical range for normal fibrinogen levels in adults is between <code>200</code> to <code>400 mg/dL</code> or <code>2.0</code> to <code>4.0 g/L</code>.</p>
    <p>Interpretation of Fibrinogen Levels:</p>
    <ul>
      <li>Low Fibrinogen Levels (Hypofibrinogenemia): Low fibrinogen levels can be indicative of various conditions, including liver disease, disseminated intravascular coagulation (DIC), or congenital fibrinogen deficiencies. Hypofibrinogenemia may increase the risk of bleeding and impair the body's ability to form clots.</li>
      <li>High Fibrinogen Levels (Hyperfibrinogenemia): Elevated fibrinogen levels are often associated with inflammatory conditions, acute infections, cardiovascular diseases, and cancer. Hyperfibrinogenemia may contribute to an increased risk of thrombosis (excessive clot formation), potentially leading to conditions like deep vein thrombosis (DVT) or pulmonary embolism (PE).</li>
    </ul>
    "
  )
  fibrinogen.links.build(
    name: 'Hoffman M, Monroe DM 3rd. (2006). Coagulation 2006: a modern view of hemostasis. Hematology Am Soc Hematol Educ Program.',
    url: 'https://pubmed.ncbi.nlm.nih.gov/17124064/',
    text_generator: false
  )
  fibrinogen.links.build(
    name: 'Mann KG, Brummel K, Butenas S. (2003). What is all that thrombin for? J Thromb Haemost.',
    url: 'https://pubmed.ncbi.nlm.nih.gov/12871274/',
    text_generator: false
  )
  fibrinogen.links.build(
    name: 'Mosesson MW. (2005). Fibrinogen and fibrin structure and functions. J Thromb Haemost.',
    url: 'https://pubmed.ncbi.nlm.nih.gov/16420523/',
    text_generator: false
  )
  fibrinogen.links.build(
    name: 'Mannucci PM, Canciani MT, Forza I, Lussana F, Lattuada A, Rossi E. (2001). Changes in health and disease of the metal content of human fibrinogen. Semin Thromb Hemost.',
    url: 'https://pubmed.ncbi.nlm.nih.gov/11727148/',
    text_generator: false
  )
  fibrinogen.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  fibrinogen.save

  Rails.logger.debug 'Fibrinogen description created'
end

if Admin::BloodCellDescription.find_by(title: 'Mean Corpuscular Hemoglobin')
  Rails.logger.debug 'Mean Corpuscular Hemoglobin description already exists'
else
  mean_corpuscular_hemoglobin = Admin::BloodCellDescription.new(
    title: 'Mean Corpuscular Hemoglobin',
    parameter: 'mean_corpuscular_hemoglobin',
    glossary_only: true,
    description: "<p>Mean Corpuscular Hemoglobin (MCH) is a significant hematological parameter that measures the average amount of hemoglobin (Hb) present in a single red blood cell (RBC). It is an essential component of a complete blood count (CBC), providing valuable information about the size and hemoglobin content of red blood cells.</p>
      <p>Importance of Mean Corpuscular Hemoglobin (MCH)</p>
      <p>MCH is important for several reasons:</p>
      <ul>
        <li>Assessing Anemia: MCH levels are a critical indicator in diagnosing and classifying different types of anemia. Anemia can be classified as microcytic (low MCH), normocytic (normal MCH), or macrocytic (high MCH), helping healthcare professionals determine the underlying causes of anemia.</li>
        <li>Identifying Hemoglobin Disorders: Abnormal MCH values can provide insights into certain hemoglobinopathies and thalassemias, which are genetic conditions affecting hemoglobin production.</li>
        <li>Monitoring Overall Health: MCH, along with other CBC parameters, is used to assess overall health and screen for various blood-related disorders.</li>
      </ul>
      <p>Measurement and Interpretation</p>
      <p>MCH is typically measured in picograms (<code>pg</code>) and is calculated using the formula:</p>

      <code> MCH = Hb / RBC </code>
      Where:
      <p><strong>MCH</strong> is the Mean Corpuscular Hemoglobin in picograms (<code>pg</code>).</p>
      <p><strong>Hb</strong> is the hemoglobin concentration in grams per deciliter (<code>g/dL</code>).</p>
      <p><strong>RBC</strong> is the red blood cell count in millions per microliter (<code>10^6/μL</code>).</p>
      The normal range for MCH can vary between laboratories but is often approximately <code>27</code> to <code>33 pg</code>.

      <ul>
        <li>Low MCH: A lower-than-normal MCH value (microcytic anemia) may indicate conditions such as iron-deficiency anemia or thalassemia.</li>
        <li>Normal MCH: Falling within the normal MCH range is generally considered healthy.</li>
        <li>High MCH: An elevated MCH value (macrocytic anemia) may suggest vitamin B12 deficiency, folate deficiency, or other underlying health conditions.</li>
      </ul>
    "
  )
  mean_corpuscular_hemoglobin.links.build(
    name: 'MedlinePlus. (2021).',
    url: 'https://medlineplus.gov/lab-tests/mean-corpuscular-hemoglobin-mch',
    text_generator: false
  )
  mean_corpuscular_hemoglobin.links.build(
    name: 'Kumar, V., Abbas, A. K., & Aster, J. C. (2018). Robbins and Cotran Pathologic Basis of Disease (10th ed.). Elsevier.',
    url: nil,
    text_generator: false
  )
  mean_corpuscular_hemoglobin.links.build(
    name: 'Bishop, M. L., Fody, E. P., & Schoeff, L. E. (2017). Clinical Chemistry: Techniques, Principles, Correlations (8th ed.). Wolters Kluwer.',
    url: nil,
    text_generator: false
  )
  mean_corpuscular_hemoglobin.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  mean_corpuscular_hemoglobin.save

  Rails.logger.debug 'Mean Corpuscular Hemoglobin description created'
end

if Admin::BloodCellDescription.find_by(title: 'Mean Corpuscular Hemoglobin Concentration')
  Rails.logger.debug 'Mean Corpuscular Hemoglobin Concentration description already exists'
else
  mean_corpuscular_hemoglobin_concentration = Admin::BloodCellDescription.new(
    title: 'Mean Corpuscular Hemoglobin Concentration',
    parameter: 'mean_corpuscular_hemoglobin_concentration',
    glossary_only: true,
    description: "<p>Mean Corpuscular Hemoglobin Concentration (MCHC) is a measure of the concentration of hemoglobin in a given volume of packed red blood cells. It is an important parameter included in a Complete Blood Count (CBC) and is typically reported in units of grams per deciliter (<code>g/dL</code>).</p>
      <p>MCHC is calculated by dividing the hemoglobin concentration by the hematocrit (the volume of red blood cells in the blood). The formula for MCHC is:</p>
      <p><code>MCHC (g/dL) = (Hemoglobin concentration, g/dL) / (Hematocrit, %)</code></p>
      <p>The importance of MCHC lies in its role in diagnosing and monitoring various blood disorders and conditions, such as anemia. Here are some key points regarding MCHC:</p>
      <ul>
        <li>Diagnostic Tool: MCHC, in combination with other CBC parameters, helps in the diagnosis of different types of anemia. Anemia can result from various causes, such as nutritional deficiencies, chronic diseases, or inherited conditions, and MCHC values provide insights into the specific type of anemia.</li>
        <li>Classification of Anemia: MCHC values are used to categorize anemia as normochromic (normal MCHC), hypochromic (low MCHC), or hyperchromic (high MCHC). This classification aids in identifying the underlying causes of anemia, such as iron deficiency or hemolytic anemias.</li>
        <li>Treatment Guidance: MCHC levels may guide healthcare professionals in determining the appropriate treatment for anemia, which could include iron supplementation, nutritional adjustments, or other therapeutic interventions.</li>
      </ul>
      <p>The typical reference range for MCHC is approximately <code>31%</code> to <code>37 g/dL</code>. Values outside this range may indicate specific types of anemia or other blood-related disorders:</p>

      <ul>
        <li>Low MCHC (Hypochromic): This may indicate iron-deficiency anemia or other conditions affecting hemoglobin synthesis.</li>
        <li>High MCHC (Hyperchromic): While less common, high MCHC may suggest conditions like hereditary spherocytosis, a disorder that affects the shape and fragility of red blood cells.</li>
      </ul>
      <p>It's important to note that while MCHC provides valuable information in diagnosing and managing anemia, it is usually interpreted in conjunction with other CBC parameters and clinical data to make a comprehensive assessment of a patient's condition.</p>
    "
  )
  mean_corpuscular_hemoglobin_concentration.links.build(
    name: 'Clinical Methods: The History, Physical, and Laboratory Examinations. 3rd edition. Walker HK, Hall WD, Hurst JW, editors. Butterworth Publishers; 1990.',
    url: nil,
    text_generator: false
  )
  mean_corpuscular_hemoglobin_concentration.links.build(
    name: "Henry's Clinical Diagnosis and Management by Laboratory Methods. 23rd edition. McPherson RA, Pincus MR, editors. Elsevier; 2017.",
    url: nil,
    text_generator: false
  )
  mean_corpuscular_hemoglobin_concentration.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  mean_corpuscular_hemoglobin_concentration.save

  Rails.logger.debug 'Mean Corpuscular Hemoglobin Concentration description created'
end

if Admin::BloodCellDescription.find_by(title: 'Mean Corpuscular Volume')
  Rails.logger.debug 'Mean Corpuscular Volume description already exists'
else
  mean_corpuscular_volume = Admin::BloodCellDescription.new(
    title: 'Mean Corpuscular Volume',
    parameter: 'mean_corpuscular_volume',
    glossary_only: true,
    description: "<p>Mean Corpuscular Volume (MCV) is a measure used in a complete blood count (CBC) to describe the average volume or size of a single red blood cell (erythrocyte). It is an essential component of the CBC and provides valuable information about the characteristics of red blood cells. The MCV is typically reported in femtoliters (<code>fL</code>), which is equal to <code>10^-15 liters</code>.</p>
      <p>MCV is important for several reasons:</p>
      <ul>
        <li>Classification of Anemias: MCV values are used to categorize anemias, which are conditions characterized by a decreased number of red blood cells or reduced hemoglobin levels. MCV helps differentiate between different types of anemia, such as microcytic anemia (small red blood cells), normocytic anemia (normal-sized red blood cells), and macrocytic anemia (large red blood cells).</li>
        <li>Diagnosis and Evaluation: MCV is a valuable diagnostic tool in identifying the underlying causes of anemia. It helps healthcare providers narrow down potential factors, such as nutritional deficiencies, bone marrow disorders, or chronic diseases, contributing to anemia.</li>
        <li>Monitoring Response to Treatment: MCV can be used to monitor the response to treatment in individuals with anemia. Changes in MCV over time may indicate whether the treatment is effective or if adjustments are needed.</li>
      </ul>
      <p>The typical reference range for MCV is approximately <code>80</code> to <code>100</code> femtoliters (<code>fL</code>). MCV values can provide the following insights:</p>

      <ul>
        <li>Low MCV (microcytic): This can be indicative of conditions like iron-deficiency anemia, thalassemia, or lead poisoning.</li>
        <li>Normal MCV (normocytic): Normal MCV values are generally associated with chronic diseases, chronic kidney disease, or hemolytic anemia.</li>
        <li>High MCV (macrocytic): Elevated MCV values may suggest conditions like vitamin B12 deficiency, folate deficiency, or certain medications.</li>
      </ul>
      <p>Please note that reference ranges and interpretation may vary slightly between laboratories and medical professionals, so it's essential to discuss MCV results with a healthcare provider for an accurate assessment.</p>
    "
  )
  mean_corpuscular_volume.links.build(
    name: "McPherson, R. A., & Pincus, M. R. (2016). Henry's Clinical Diagnosis and Management by Laboratory Methods. Elsevier.",
    url: nil,
    text_generator: false
  )
  mean_corpuscular_volume.links.build(
    name: 'Walker, H. K., Hall, W. D., & Hurst, J. W. (1990). Clinical Methods: The History, Physical, and Laboratory Examinations. Butterworths.',
    url: nil,
    text_generator: false
  )
  mean_corpuscular_volume.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  mean_corpuscular_volume.save

  Rails.logger.debug 'Mean Corpuscular Volume description created'
end

if Admin::BloodCellDescription.find_by(title: 'Platelet Distribution Width')
  Rails.logger.debug 'Platelet Distribution Width description already exists'
else
  platelet_distribution_width = Admin::BloodCellDescription.new(
    title: 'Platelet Distribution Width',
    parameter: 'platelet_distribution_width',
    glossary_only: true,
    description: "<p>Platelet distribution width (PDW) is a measure of the variation in the size of platelets, which are small cell fragments in the blood that play a crucial role in blood clotting and wound healing. PDW is an important component of a complete blood count (CBC) and is often reported along with other platelet parameters.</p>
      <p>Importance of Platelet Distribution Width (PDW):</p>
      <p>PDW provides information about the range of platelet sizes in a blood sample. While platelets are typically small and uniform in size, an increased PDW can indicate variability in platelet size. This variability may be associated with various medical conditions and can provide insights into a patient's health.</p>
      <p>Reference Ranges and Units:</p>
      <p>The reference ranges for PDW can vary between different laboratories and may be influenced by the specific equipment and methods used for testing. Generally, a typical reference range for PDW falls between <code>9%</code> and <code>17%</code>. The unit for PDW is usually reported as a percentage (<code>%</code>).</p>

      <p>Interpretation:</p>
      <ul>
        <li>High PDW: An elevated PDW may be indicative of various health conditions, such as:</li>
        <ul>
          <li>Platelet disorders: Some platelet disorders, including immune thrombocytopenia and myeloproliferative disorders, can lead to increased platelet size variability.</li>
          <li>Inflammatory conditions: Conditions associated with chronic inflammation, like rheumatoid arthritis or inflammatory bowel disease, can also result in higher PDW values.</li>
          <li>Acute conditions: In certain acute situations, such as infections or recent surgery, PDW may temporarily increase.</li>
        </ul>
        <li>Low PDW: A decreased PDW is less common and may be seen in conditions such as:</li>
          <ul>
            <li>Bone marrow disorders: Certain bone marrow disorders can lead to reduced platelet size variability and, consequently, a lower PDW.</li>
            <li>Medication effects: Some medications, like chemotherapy drugs, may cause a decrease in PDW as they affect bone marrow function.</li>
          </ul>
      <p>It's important to note that while PDW can provide valuable information, it is usually interpreted alongside other platelet parameters, such as platelet count, mean platelet volume (MPV), and plateletcrit (PCT), to get a more comprehensive understanding of a patient's blood and potential underlying conditions.</p>
    "
  )
  platelet_distribution_width.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  platelet_distribution_width.save

  Rails.logger.debug 'Platelet Distribution Width description created'
end

if Admin::BloodCellDescription.find_by(title: 'Prothrombin Time')
  Rails.logger.debug 'Prothrombin Time description already exists'
else
  prothrombin_time = Admin::BloodCellDescription.new(
    title: 'Prothrombin Time',
    parameter: 'prothrombin_time',
    glossary_only: true,
    description: "<p>Prothrombin Time (PT) is a laboratory test used to assess the integrity of the extrinsic and common coagulation pathways, primarily in the context of the blood's ability to clot. It measures the time it takes for plasma to clot when specific reagents are added. PT is an essential test for evaluating the clotting function and the effectiveness of anticoagulant medications, such as warfarin.</p>
      <p>Prothrombin Time (PT) is a laboratory test that measures the time it takes for blood plasma to clot. It evaluates the function of the extrinsic and common coagulation pathways, which are essential for blood clot formation.</p>
      <p>Prothrombin Time is important for several reasons:</p>
      <ul>
        <li>Monitoring Anticoagulant Therapy: PT is commonly used to monitor the effectiveness of anticoagulant medications, such as warfarin, which are prescribed to prevent or treat blood clots. It helps healthcare providers adjust medication dosages to maintain the desired level of anticoagulation.</li>
        <li>Diagnosis of Bleeding Disorders: PT can help diagnose bleeding disorders, such as hemophilia or liver disease, by assessing the blood's ability to clot.</li>
        <li>Assessment of Liver Function: PT is also a part of liver function tests and can detect liver damage or disease. The liver produces many of the proteins required for blood clotting, including clotting factors.</li>
      </ul>
      <p>The normal PT range can vary slightly from one laboratory to another but is generally around <code>11</code> to <code>13.5 seconds</code>. It's essential to use the reference range provided by the specific laboratory that conducted the test because it may vary.</p>
      <p>Prothrombin Time is typically expressed in <code>seconds</code>. The International Normalized Ratio (INR) is another common unit used to standardize PT results, especially for monitoring anticoagulant therapy. A target INR is often set to maintain a balance between preventing clot formation and avoiding excessive bleeding.</p>
      <p>Interpretation:</p>
      <ul>
        <li>Elevated PT: An elevated PT indicates a prolonged clotting time, which can be associated with conditions like liver disease, vitamin K deficiency, certain clotting factor deficiencies, or anticoagulant therapy. It can also indicate a bleeding disorder.</li>
        <li>Decreased PT: A decreased PT suggests a shorter clotting time and can be a concern, as it may indicate a higher risk of blood clot formation. This can occur in individuals with a genetic predisposition to clotting disorders or in cases of excess production of clotting factors.</li>
      </ul>
    "
  )
  prothrombin_time.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  prothrombin_time.save

  Rails.logger.debug 'Prothrombin Time description created'
end

if Admin::BloodCellDescription.find_by(title: 'Red Cell Distribution Width')
  Rails.logger.debug 'Red Cell Distribution Width description already exists'
else
  red_cell_distribution_width = Admin::BloodCellDescription.new(
    title: 'Red Cell Distribution Width',
    parameter: 'red_cell_distribution_width',
    glossary_only: true,
    description: "<p>Red Cell Distribution Width (RDW) is a measure of the variation in the size of red blood cells (erythrocytes) in a blood sample. It is typically reported as a percentage and is an important component of a complete blood count (CBC) along with other parameters such as hemoglobin and hematocrit. RDW provides valuable information about the size and heterogeneity of red blood cells, which can have clinical significance.</p>
      <p>RDW is important for several reasons:</p>
      <ul>
        <li>Anemia Assessment: RDW can help in the diagnosis and differentiation of anemia. An elevated RDW suggests a wide variation in red blood cell size, which can be indicative of certain types of anemia, including iron-deficiency anemia and vitamin B12 deficiency anemia.</li>
        <li>Health Monitoring: It can be used to monitor changes in red blood cell size over time, which may be associated with various medical conditions.</li>
        <li>Prognostic Indicator: In some cases, a high RDW has been associated with an increased risk of adverse outcomes in conditions such as heart disease and certain cancers.</li>
        <li>Identification of Underlying Conditions: RDW can be a valuable tool for healthcare professionals to identify underlying health issues and guide further diagnostic investigations.</li>
      </ul>
      <p>Reference Range and Units:</p>
      <p>RDW is typically reported as a percentage (<code>%</code>). The reference range can vary slightly between different laboratories, but in a standard range, the normal RDW is between <code>11.5%</code> and <code>14.5%</code>. Values above or below this range may suggest specific medical conditions.</p>
      <p>Interpretation:</p>
      <ul>
        <li>High RDW: An elevated RDW indicates that there is significant variation in the size of red blood cells. This can occur in conditions such as anemia (iron-deficiency anemia, vitamin B12 deficiency anemia), nutritional deficiencies, chronic inflammation, and certain hemoglobinopathies. It may also be associated with chronic diseases and bone marrow disorders.</li>
        <li>Low RDW: A low RDW suggests that red blood cells are relatively uniform in size. This can occur in conditions like thalassemia or some types of anemia. It's less common for RDW to be significantly lower than the reference range.</li>
      </ul>
    "
  )
  red_cell_distribution_width.links.build(
    name: "McPherson, R., & Pincus, M. R. (2017). Henry's Clinical Diagnosis and Management by Laboratory Methods. Elsevier.",
    url: nil,
    text_generator: false
  )
  red_cell_distribution_width.links.build(
    name: 'Rodak, B. F., & Fritsma, G. A. (2018). Hematology: Clinical Principles and Applications. Saunders.',
    url: nil,
    text_generator: false
  )
  red_cell_distribution_width.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  red_cell_distribution_width.save

  Rails.logger.debug 'Red Cell Distribution Width description created'
end

if Admin::BloodCellDescription.find_by(title: 'Blood glucose levels')
  Rails.logger.debug 'Blood glucose levels Width description already exists'
else
  blood_glucose_levels = Admin::BloodCellDescription.new(
    title: 'Blood glucose levels',
    parameter: nil,
    glossary_only: true,
    description: "<p>Blood glucose levels, also known as blood sugar levels, refer to the concentration of glucose (sugar) present in the bloodstream. Glucose is a primary source of energy for cells and is crucial for the normal functioning of the body. Blood glucose levels are tightly regulated and are influenced by various factors, including diet, physical activity, hormones, and overall health.</p>
      <p>Maintaining blood glucose levels within a specific range is essential for several reasons:</p>
      <ul>
        <li>Energy Supply: Glucose is the body's primary energy source, especially for the brain and muscles. It provides the fuel necessary for daily activities and bodily functions.</li>
        <li>Metabolic Health: Proper blood glucose regulation is crucial for overall metabolic health. Consistently high or low glucose levels can lead to health problems, including diabetes and hypoglycemia.</lp>
        <li>Brain Function: The brain relies on a steady supply of glucose. Fluctuations in glucose levels can affect cognitive function, mood, and concentration.</li>
        <li>Prevention of Complications: Chronic high blood glucose levels, as seen in diabetes, can lead to long-term complications like cardiovascular disease, kidney damage, and nerve damage. Maintaining healthy levels can help reduce the risk of these complications.</li>
      </ul>
      <p>Blood Glucose Levels:</p>
      <p>Blood glucose levels are typically measured in milligrams per deciliter (<code>mg/dL</code>) or millimoles per liter (<code>mmol/L</code>). The most common unit used in the United States is <code>mg/dL</code>, while <code>mmol/L</code> is more common in many other countries.</p>
      <ul>
        <li>Fasting Blood Glucose: A normal fasting blood glucose level is typically considered to be between <code>70 mg/dL</code> and <code>100 mg/dL</code> (<code>3.9 mmol/L</code> to <code>5.6 mmol/L</code>).</li>
        <li>Postprandial (After Eating) Blood Glucose: Normal levels after a meal can vary but are generally less than <code>140 mg/dL</code> (<code>7.8 mmol/L</code>) two hours after eating.</li>
        <li>Diabetes Diagnosis: A diagnosis of diabetes is typically made if fasting blood glucose levels consistently measure <code>126 mg/dL</code> (<code>7.0 mmol/L</code>) or higher. Levels between <code>100 mg/dL</code> and <code>125 mg/dL</code> (<code>5.6 mmol/L</code> to <code>6.9 mmol/L</code>) are often indicative of prediabetes.</li>
        <li>Hypoglycemia (Low Blood Sugar): Blood glucose levels below <code>70 mg/dL</code> (<code>3.9 mmol/L</code>) are considered low and can lead to symptoms of hypoglycemia, such as shakiness, sweating, and confusion. Severe hypoglycemia can be dangerous and may require immediate treatment.</li>
      </ul>
      <p>It's important to note that these reference ranges can vary slightly based on factors like age, individual health, and the specific laboratory conducting the test. Regular monitoring of blood glucose levels is crucial for individuals with diabetes and can help guide treatment and lifestyle adjustments to maintain optimal health.</p>
    "
  )
  blood_glucose_levels.links.build(
    name: "McPherson, R., & Pincus, M. R. (2017). Henry's Clinical Diagnosis and Management by Laboratory Methods. Elsevier.",
    url: nil,
    text_generator: false
  )
  blood_glucose_levels.links.build(
    name: 'Rodak, B. F., & Fritsma, G. A. (2018). Hematology: Clinical Principles and Applications. Saunders.',
    url: nil,
    text_generator: false
  )
  blood_glucose_levels.links.build(
    name: 'ChatGPT',
    url: 'https://chat.openai.com/',
    text_generator: true
  )
  blood_glucose_levels.save

  Rails.logger.debug 'Blood Glucose Levels description created'
end
