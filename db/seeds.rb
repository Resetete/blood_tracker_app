# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create an admin user
unless User.find_by(email: Rails.application.credentials.admin.email)
  User.create(
    email: Rails.application.credentials.admin.email,
    password: Rails.application.credentials.admin.password,
    admin: true,
  )
  p 'Admin user created'
else
  p 'Admin user already exists'
end

# Create blood cell descriptions
unless Admin::BloodCellDescription.find_by(title: 'Monocytes')
  monocytes = Admin::BloodCellDescription.new(
    title: 'Monocytes',
    description: "Monocytes are a type of white blood cell that plays a crucial role in the body's immune system. They are abbreviated as \"MONO\" in blood work and measured in percentages. Monocytes are produced in the bone marrow and released into the bloodstream, where they can travel to different tissues and organs to help fight off infections and foreign substances.\n\nThe normal range for monocytes is between 2% to 10% of the total white blood cell count. A low monocyte count, called monocytopenia, can be caused by a variety of factors such as viral infections, autoimmune disorders, bone marrow disorders, or medications such as chemotherapy, corticosteroids, and immunosuppressive drugs. High monocyte counts, called monocytosis, can be caused by infections, inflammation, and certain types of cancer such as leukemia.\n\nMonocyte levels can be measured through a complete blood count (CBC) test, which is a standard test used to evaluate overall health and detect a wide range of medical conditions.\n\nCertain medications can cause low or high monocyte values. Corticosteroids can cause monocytopenia, while some immunosuppressive drugs can cause monocytosis. It is important to discuss any medications you are taking with your healthcare provider to understand their potential impact on your monocyte count.",
  )
  monocytes.links.build(
    name: "National Library of Medicine",
    url: "https://medlineplus.gov/lab-tests/monocyte-count/",
    text_generator: false,
  )
  monocytes.links.build(
    name: "Mayo Clinic",
    url: "https://www.mayoclinic.org/tests-procedures/complete-blood-count/about/pac-20384919",
    text_generator: false,
  )
  monocytes.links.build(
    name: "Medscape",
    url: "https://emedicine.medscape.com/article/208506-overview",
    text_generator: false,
  )
  monocytes.links.build(
    name: "ChatGPT",
    url: "https://chat.openai.com/",
    text_generator: true,
  )
  monocytes.save

  p 'Monocytes description created'
else
  p 'Monocytes description already exists'
end

unless Admin::BloodCellDescription.find_by(title: 'Thrombocytes')
  thrombocytes = Admin::BloodCellDescription.new(
    title: 'Thrombocytes',
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
    name: "National Heart, Lung, and Blood Institute (NHLBI). What are platelets and why are they important?",
    url: "https://www.nhlbi.nih.gov/health-topics/platelets",
    text_generator: false,
  )
  thrombocytes.links.build(
    name: "Mayo Clinic. Thrombocytopenia (low platelet count)",
    url: "https://www.mayoclinic.org/diseases-conditions/thrombocytopenia/symptoms-causes/syc-20378293",
    text_generator: false,
  )
  thrombocytes.links.build(
    name: "Griesshammer M. Myeloproliferative Neoplasms Associated with Elevated Platelet Counts. In: Tefferi A, editor. Myeloproliferative Neoplasms: Diagnosis and Treatment. Springer; 2018",
    url: nil,
    text_generator: false,
  )
  thrombocytes.links.build(
    name: "Kitchens CS. Thrombocytopenia and Platelet Dysfunction. In: Kitchens CS, Alving BM, Kessler CM, editors. Consultative Hemostasis and Thrombosis. 4th edition. Saunders Elsevier; 2013.",
    url: nil,
    text_generator: false,
  )
  thrombocytes.links.build(
    name: "Hoffbrand AV, Moss PAH, Pettit JE. Essential Haematology. 7th edition. Wiley-Blackwell; 2015.",
    url: nil,
    text_generator: false,
  )
  thrombocytes.links.build(
    name: "ChatGPT",
    url: "https://chat.openai.com/",
    text_generator: true,
  )
  thrombocytes.save

  p 'Thrombocytes description created'
else
  p 'Thrombocytes description already exists'
end

unless Admin::BloodCellDescription.find_by(title: 'Lymphocytes')
  lymphocytes = Admin::BloodCellDescription.new(
    title: 'Lymphocytes',
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
    name: "National Library of Medicine. Lymphocytopenia. MedlinePlus.",
    url: "https://medlineplus.gov/ency/article/003657.htm",
    text_generator: false,
  )
  lymphocytes.links.build(
    name: "Abbas AK, Lichtman AH, Pillai S. Cellular and Molecular Immunology. 9th edition. Elsevier; 2017.",
    url: nil,
    text_generator: false,
  )
  lymphocytes.links.build(
    name: "American Association for Clinical Chemistry (AACC). Lymphocytes. Lab Tests Online.",
    url: 'https://labtestsonline.org/tests/lymphocytes',
    text_generator: false,
  )
  lymphocytes.links.build(
    name: "ChatGPT",
    url: "https://chat.openai.com/",
    text_generator: true,
  )
  lymphocytes.save

  p 'Lymphocytes description created'
else
  p 'Lymphocytes description already exists'
end

unless Admin::BloodCellDescription.find_by(title: 'Erythroid cells')
  erythroids = Admin::BloodCellDescription.new(
    title: 'Erythroid cells',
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
    name: "National Heart, Lung, and Blood Institute (NHLBI). What Is Anemia?",
    url: "https://www.nhlbi.nih.gov/health-topics/anemia",
    text_generator: false,
  )
  erythroids.links.build(
    name: "Hoffbrand AV, Moss PAH, Pettit JE. Essential Haematology. 7th edition. Wiley-Blackwell; 2015.",
    url: nil,
    text_generator: false,
  )
  erythroids.links.build(
    name: 'Kaushansky K, Lichtman MA, Prchal JT, Levi MM, Press OW, Burns LJ, Caligiuri MA. Williams Hematology. 9th edition. McGraw-Hill Education; 2020.',
    url: nil,
    text_generator: false,
  )
  erythroids.links.build(
    name: "ChatGPT",
    url: "https://chat.openai.com/",
    text_generator: true,
  )
  erythroids.save

  p 'Erythroids description created'
else
  p 'Erythroids description already exists'
end

unless Admin::BloodCellDescription.find_by(title: 'Neutrophil cells')
  neutrophils = Admin::BloodCellDescription.new(
    title: 'Neutrophil cells',
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
    name: "Abbas AK, Lichtman AH, Pillai S. Cellular and Molecular Immunology. 9th edition. Elsevier; 2017.",
    url: nil,
    text_generator: false,
  )
  neutrophils.links.build(
    name: "National Library of Medicine. Neutropenia. MedlinePlus.",
    url: "https://medlineplus.gov/ency/article/001090.htm",
    text_generator: false,
  )
  neutrophils.links.build(
    name: 'American Association for Clinical Chemistry (AACC). Neutrophils. Lab Tests Online.',
    url: 'https://labtestsonline.org/tests/neutrophils',
    text_generator: false,
  )
  neutrophils.links.build(
    name: "ChatGPT",
    url: "https://chat.openai.com/",
    text_generator: true,
  )
  neutrophils.save

  p 'Neutrophils description created'
else
  p 'Neutrophils description already exists'
end

unless Admin::BloodCellDescription.find_by(title: 'Basophil cells')
  basophils = Admin::BloodCellDescription.new(
    title: 'Basophil cells',
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
    name: "Abbas AK, Lichtman AH, Pillai S. Cellular and Molecular Immunology. 9th edition. Elsevier; 2017.",
    url: nil,
    text_generator: false,
  )
  basophils.links.build(
    name: "National Library of Medicine. Basophilia. MedlinePlus.",
    url: "https://medlineplus.gov/ency/article/003647.htm",
    text_generator: false,
  )
  basophils.links.build(
    name: "ChatGPT",
    url: "https://chat.openai.com/",
    text_generator: true,
  )
  basophils.save

  p 'Basophils description created'
else
  p 'Basophils description already exists'
end