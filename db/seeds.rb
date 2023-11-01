# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create an admin user
if User.find_by(email: Rails.application.credentials.admin.email)
  Rails.logger.debug 'Admin user already exists'
else
  User.create(
    email: Rails.application.credentials.admin.email,
    password: Rails.application.credentials.admin.password,
    admin: true
  )
  Rails.logger.debug 'Admin user created'
end

# Create blood term descriptions
if Admin::BloodCellDescription.find_by(title: 'Blood plasma')
  Rails.logger.debug 'Plasma description already exists'
else
  plasma = Admin::BloodCellDescription.new(
    title: 'Blood plasma',
    description: "<p>Blood plasma is the yellowish fluid component of blood that constitutes approximately 55% of the total blood volume. It is the liquid in which blood cells, platelets, and various substances are suspended. Plasma is crucial for the transportation of nutrients, hormones, antibodies, waste products, and other important components throughout the body.</p>
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
    </ul>
    "
  )
  leukocytes.links.build(
    name: 'Abbas AK, Lichtman AH, Pillai S. Cellular and Molecular Immunology. 9th edition. Elsevier; 2017.',
    url: nil,
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
    description: "<p>Hemoglobin is a protein found in red blood cells (erythrocytes) that is responsible for transporting oxygen from the lungs to various tissues and organs in the body. It is an essential component of the circulatory system and plays a crucial role in maintaining overall health and vitality.</p>
    <p>Hemoglobin molecules are composed of four protein chains called globins, each of which is bound to a heme group. The heme group contains iron, which enables hemoglobin to bind and carry oxygen molecules. When oxygen-rich blood reaches the capillaries in the tissues, hemoglobin releases the oxygen, allowing it to be used by cells for various metabolic processes.</p>
    <p>The importance of hemoglobin lies in its role in oxygen transport and delivery to body tissues. Some key points about its significance include:</p>
    <ul>
    <li>Oxygen Transport: Hemoglobin efficiently binds oxygen in the lungs and carries it through the bloodstream to oxygen-deprived tissues, ensuring proper oxygenation and cellular respiration.</li>
    <li>Tissue Oxygenation: Adequate hemoglobin levels are crucial for providing oxygen to vital organs, such as the brain, heart, and muscles, ensuring their proper function.</li>
    <li>Acid-Base Balance: Hemoglobin helps maintain the body's acid-base balance by acting as a buffer, preventing excessive changes in blood pH.</li>
    <li>Carbon Dioxide Transport: Hemoglobin also aids in the removal of carbon dioxide, a waste product of cellular respiration, by binding and transporting it back to the lungs for exhalation.</li>
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
    "
  )
  hematocrit.links.build(
    name: 'Kumar V, Abbas AK, Aster JC. Robbins and Cotran Pathologic Basis of Disease. 9th edition. Elsevier; 2014.',
    url: nil,
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
    description: "<p>A complete blood count (CBC) is a common laboratory test that provides valuable information about the cellular components of blood. It involves the measurement of various blood cell types and other parameters, offering insights into overall health and potential underlying conditions.</p>
    <p>A CBC typically includes the following measurements:</p>
    <ul>
    <li>Red Blood Cell Count (RBC): The number of red blood cells per volume of blood, providing information about oxygen-carrying capacity.</li>
    <li>Hemoglobin (Hb): The concentration of the protein in red blood cells responsible for oxygen transport.</li>
    <li>Hematocrit (Hct): The percentage of blood volume occupied by red blood cells, indicating blood's viscosity and ability to transport oxygen.</li>
    <li>White Blood Cell Count (WBC): The total number of white blood cells, serving as an indicator of immune system health and potential infections.</li>
    <li>Platelet Count: The number of platelets involved in blood clotting and wound healing.</li>
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
    "
  )
  anticoagulants.links.build(
    name: 'Weitz JI, Fredenburgh JC. Anticoagulant Drugs. In: Hoffman R, Benz EJ Jr, Silberstein LE, et al., editors. Hematology: Basic Principles and Practice. 7th edition. Elsevier; 2018.',
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
    description: "<p>Erythroid cells, also known as red blood cells (RBCs), are specialized cells in the bloodstream responsible for transporting oxygen to tissues and organs throughout the body. In blood work, erythroid cells are often abbreviated as RBC, and their unit of measurement is typically reported as the number of cells per microliter (10^6/μL) or as a concentration in grams per deciliter (g/dL).</p>
    <p>The normal range for erythroid cell counts and hemoglobin levels in adults can vary slightly, but generally, the reference ranges are:</p>
    <ul>
    <li>Erythroid cell count: Typically between 4.5 and 5.5 million cells per microliter (4.5 - 5.5 x 10^6/μL).</li>
    <li>Hemoglobin level: Usually between 12 and 16 grams per deciliter (12 - 16 g/dL) for females and 13.5 to 17.5 grams per deciliter (13.5 - 17.5 g/dL) for males.</li>
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
    description: "<p>Lymphocytes are a type of white blood cell that plays a crucial role in the immune system's defense against infections and diseases. They are abbreviated as LY or LYMPH in blood work, and their unit of measurement is typically reported as a percentage of the total white blood cell count or as an absolute count in cells per microliter (10^9/L).</p>
    <p>In a healthy individual, lymphocytes make up a significant proportion of the total white blood cell count. The normal range for lymphocytes is typically between 20% and 40% of the total white blood cell count, or an absolute count of 1,000 to 4,000 lymphocytes per microliter.</p>
    <p>Low lymphocyte counts, known as lymphocytopenia, can be caused by various factors, including:</p>
    <ul>
    <li>Viral infections, such as HIV or hepatitis.</li>
    <li>Certain medications, including chemotherapy drugs or immunosuppressants.</li>
    <li>Autoimmune diseases, like systemic lupus erythematosus (SLE).</li>
    <li>Bone marrow disorders, such as aplastic anemia or leukemia.</li>
    </ul>
    <p>High lymphocyte counts, known as lymphocytosis, can be attributed to various factors, including:</p>
    <ul>
    <li>Viral infections, such as mononucleosis or pertussis.</li>
    <li>Bacterial infections, including tuberculosis or whooping cough.</li>
    <li>Certain cancers, like leukemia or lymphoma.</li>
    <li>Autoimmune disorders, such as rheumatoid arthritis or multiple sclerosis.</li>
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
    description: "Monocytes are a type of white blood cell that plays a crucial role in the body's immune system. They are abbreviated as \"MONO\" in blood work and measured in percentages. Monocytes are produced in the bone marrow and released into the bloodstream, where they can travel to different tissues and organs to help fight off infections and foreign substances.\n\nThe normal range for monocytes is between 2% to 10% of the total white blood cell count. A low monocyte count, called monocytopenia, can be caused by a variety of factors such as viral infections, autoimmune disorders, bone marrow disorders, or medications such as chemotherapy, corticosteroids, and immunosuppressive drugs. High monocyte counts, called monocytosis, can be caused by infections, inflammation, and certain types of cancer such as leukemia.\n\nMonocyte levels can be measured through a complete blood count (CBC) test, which is a standard test used to evaluate overall health and detect a wide range of medical conditions.\n\nCertain medications can cause low or high monocyte values. Corticosteroids can cause monocytopenia, while some immunosuppressive drugs can cause monocytosis. It is important to discuss any medications you are taking with your healthcare provider to understand their potential impact on your monocyte count."
  )
  monocytes.links.build(
    name: 'National Library of Medicine',
    url: 'https://medlineplus.gov/lab-tests/monocyte-count/',
    text_generator: false
  )
  monocytes.links.build(
    name: 'Mayo Clinic',
    url: 'https://www.mayoclinic.org/tests-procedures/complete-blood-count/about/pac-20384919',
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
    description: "<p>Thrombocytes, also referred to as platelets, are small, irregularly-shaped blood cells that play a crucial role in the process of blood clotting, known as hemostasis.
    In the context of blood work, thrombocytes are commonly abbreviated as PLT, and their unit of measurement is typically reported as platelets per microliter of blood (10^9/L or thousand/μL).
    The normal range for platelet counts in a healthy individual typically falls between 150,000 and 450,000 platelets per microliter of blood. Deviations from this range may indicate certain medical conditions or factors that impact platelet production, survival, or consumption.
    Low platelet counts, referred to as thrombocytopenia, can be attributed to various factors, including:</p>
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
    description: "<p>Neutrophil cells, often referred to as neutrophils, are a type of white blood cell that plays a critical role in the immune system's defense against bacterial and fungal infections. Neutrophils are abbreviated as NEU or NEUT in blood work, and their unit of measurement is typically reported as a percentage of the total white blood cell count or as an absolute count in cells per microliter (10^9/L).</p>
    <p>In a healthy individual, neutrophils make up the majority of the total white blood cell count and are the most abundant type of white blood cell. The normal range for neutrophil counts is typically between 40% and 75% of the total white blood cell count or an absolute count of 2,000 to 7,500 neutrophils per microliter.</p>
    <p>Low neutrophil counts, known as neutropenia, can be caused by various factors, including:</p>
    <ul>
    <li>Bone marrow disorders or damage, such as aplastic anemia or leukemia.</li>
    <li>Viral infections, including HIV or hepatitis.</li>
    <li>Chemotherapy or radiation therapy for cancer treatment.</li>
    <li>Certain medications, such as antibiotics or immunosuppressants.</li>
    </ul>
    <p>High neutrophil counts, known as neutrophilia, can be attributed to various factors, including:</p>
    <ul>
    <li>Bacterial infections, such as pneumonia or urinary tract infections.</li>
    <li>Inflammatory conditions, like rheumatoid arthritis or inflammatory bowel disease.</li>
    <li>Physical or emotional stress.</li>
    <li>Certain medications, such as corticosteroids.</li>
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
    description: "<p>Basophils are a type of white blood cell involved in the immune response, specifically in allergic reactions and defense against parasites. In blood work, basophils are abbreviated as BASO or BAS in blood count reports, and their unit of measurement is typically reported as a percentage of the total white blood cell count.</p>
    <p>In a healthy individual, basophils constitute a small fraction of the total white blood cell count, usually ranging from 0.5% to 1% of the total white blood cells.</p>
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
    description: "<p>Eosinophils are a type of white blood cell involved in the immune response against parasites and in allergic reactions. In blood work, eosinophils are often abbreviated as EOS or EO in blood count reports, and their unit of measurement is typically reported as a percentage of the total white blood cell count.</p>
    <p>In a healthy individual, eosinophils constitute a small fraction of the total white blood cell count, usually ranging from 1% to 4% of the total white blood cells.</p>
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
