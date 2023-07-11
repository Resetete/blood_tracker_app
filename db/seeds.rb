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


