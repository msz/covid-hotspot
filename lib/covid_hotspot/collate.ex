defmodule CovidHotspot.Collate do
  @covid_id_to_population_id [
                               {"afghanistan", "AFG"},
                               {"albania", "ALB"},
                               {"algeria", "DZA"},
                               {"andorra", "AND"},
                               {"angola", "AGO"},
                               {"antiguaandbarbuda", "ATG"},
                               {"argentina", "ARG"},
                               {"armenia", "ARM"},
                               {"australia", "AUS"},
                               {"austria", "AUT"},
                               {"azerbaijan", "AZE"},
                               {"bahamas", "BHS"},
                               {"bahrain", "BHR"},
                               {"bangladesh", "BGD"},
                               {"barbados", "BRB"},
                               {"belarus", "BLR"},
                               {"belgium", "BEL"},
                               {"belize", "BLZ"},
                               {"benin", "BEN"},
                               {"bhutan", "BTN"},
                               {"bolivia", "BOL"},
                               {"bosniaandherzegovina", "BIH"},
                               {"brazil", "BRA"},
                               {"brunei", "BRN"},
                               {"bulgaria", "BGR"},
                               {"burkinafaso", "BFA"},
                               {"caboverde", "CPV"},
                               {"cambodia", "KHM"},
                               {"cameroon", "CMR"},
                               {"canada", "CAN"},
                               {"centralafricanrepublic", "CAF"},
                               {"chad", "TCD"},
                               {"chile", "CHL"},
                               {"chinamainland", "CHN"},
                               {"colombia", "COL"},
                               {"congo", "COG"},
                               {"congodrc", "COD"},
                               {"costarica", "CRI"},
                               {"croatia", "HRV"},
                               {"cuba", "CUB"},
                               {"cyprus", "CYP"},
                               {"czechrepublic", "CZE"},
                               {"ctedivoire", "CIV"},
                               {"denmark", "DNK"},
                               {"djibouti", "DJI"},
                               {"dominica", "DMA"},
                               {"dominicanrepublic", "DOM"},
                               {"ecuador", "ECU"},
                               {"egypt", "EGY"},
                               {"elsalvador", "SLV"},
                               {"equatorialguinea", "GNQ"},
                               {"eritrea", "ERI"},
                               {"estonia", "EST"},
                               {"eswatini", "SWZ"},
                               {"ethiopia", "ETH"},
                               {"fiji", "FJI"},
                               {"finland", "FIN"},
                               {"france", "FRA"},
                               {"gabon", "GAB"},
                               {"gambia", "GMB"},
                               {"georgia", "GEO"},
                               {"germany", "DEU"},
                               {"ghana", "GHA"},
                               {"greece", "GRC"},
                               {"grenada", "GRD"},
                               {"guam", "GUM"},
                               {"guatemala", "GTM"},
                               {"guinea", "GIN"},
                               {"guineabissau", "GNB"},
                               {"guyana", "GUY"},
                               {"haiti", "HTI"},
                               {"honduras", "HND"},
                               {"hongkong", "HKG"},
                               {"hungary", "HUN"},
                               {"iceland", "ISL"},
                               {"india", "IND"},
                               {"indonesia", "IDN"},
                               {"iran", "IRN"},
                               {"iraq", "IRQ"},
                               {"ireland", "IRL"},
                               {"isleofman", "IMN"},
                               {"israel", "ISR"},
                               {"italy", "ITA"},
                               {"jamaica", "JAM"},
                               {"japan", "JPN"},
                               {"jordan", "JOR"},
                               {"kazakhstan", "KAZ"},
                               {"kenya", "KEN"},
                               {"kosovo", "XKX"},
                               {"kuwait", "KWT"},
                               {"kyrgyzstan", "KGZ"},
                               {"laos", "LAO"},
                               {"latvia", "LVA"},
                               {"lebanon", "LBN"},
                               {"liberia", "LBR"},
                               {"libya", "LBY"},
                               {"liechtenstein", "LIE"},
                               {"lithuania", "LTU"},
                               {"luxembourg", "LUX"},
                               {"macau", "MAC"},
                               {"madagascar", "MDG"},
                               {"malaysia", "MYS"},
                               {"maldives", "MDV"},
                               {"mali", "MLI"},
                               {"malta", "MLT"},
                               {"mauritania", "MRT"},
                               {"mauritius", "MUS"},
                               {"mexico", "MEX"},
                               {"moldova", "MDA"},
                               {"monaco", "MCO"},
                               {"mongolia", "MNG"},
                               {"montenegro", "MNE"},
                               {"morocco", "MAR"},
                               {"mozambique", "MOZ"},
                               {"myanmar", "MMR"},
                               {"namibia", "NAM"},
                               {"nepal", "NPL"},
                               {"netherlands", "NLD"},
                               {"newzealand", "NZL"},
                               {"nicaragua", "NIC"},
                               {"niger", "NER"},
                               {"nigeria", "NGA"},
                               {"northmacedonia", "MKD"},
                               {"norway", "NOR"},
                               {"oman", "OMN"},
                               {"pakistan", "PAK"},
                               {"panama", "PAN"},
                               {"papuanewguinea", "PNG"},
                               {"paraguay", "PRY"},
                               {"peru", "PER"},
                               {"philippines", "PHL"},
                               {"poland", "POL"},
                               {"portugal", "PRT"},
                               {"puertorico", "PRI"},
                               {"qatar", "QAT"},
                               {"romania", "ROU"},
                               {"russia", "RUS"},
                               {"rwanda", "RWA"},
                               {"saintlucia", "LCA"},
                               {"saintmartin", "MAF"},
                               {"sanmarino", "SMR"},
                               {"saudiarabia", "SAU"},
                               {"senegal", "SEN"},
                               {"serbia", "SRB"},
                               {"seychelles", "SYC"},
                               {"singapore", "SGP"},
                               {"slovakia", "SVK"},
                               {"slovenia", "SVN"},
                               {"somalia", "SOM"},
                               {"southafrica", "ZAF"},
                               {"southkorea", "KOR"},
                               {"spain", "ESP"},
                               {"srilanka", "LKA"},
                               {"stvincentandthegrenadines", "VCT"},
                               {"sudan", "SDN"},
                               {"suriname", "SUR"},
                               {"syria", "SYR"},
                               {"sweden", "SWE"},
                               {"switzerland", "CHE"},
                               {"tanzania", "TZA"},
                               {"thailand", "THA"},
                               {"timorleste", "TLS"},
                               {"togo", "TGO"},
                               {"trinidadandtobago", "TTO"},
                               {"tunisia", "TUN"},
                               {"turkey", "TUR"},
                               {"uganda", "UGA"},
                               {"ukraine", "UKR"},
                               {"unitedarabemirates", "ARE"},
                               {"unitedkingdom", "GBR"},
                               {"unitedstates", "USA"},
                               {"uruguay", "URY"},
                               {"usvirginislands", "VIR"},
                               {"uzbekistan", "UZB"},
                               {"venezuela", "VEN"},
                               {"vietnam", "VNM"},
                               {"zambia", "ZMB"},
                               {"zimbabwe", "ZWE"}
                             ]
                             |> Enum.into(%{})

  def covid_id_to_population_id(covid_id) do
    @covid_id_to_population_id[covid_id]
  end
end
