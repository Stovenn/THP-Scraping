require_relative '../lib/mairie_christmas'

describe "The content of the city url array :" do
  it "Check if the output is an array" do
    expect(get_city_url).to be_an_instance_of(Array)
  end
  it "Check if some links exists in the array" do
    expect(get_city_url).to include("https://www.annuaire-des-mairies.com/95/avernes.html")
    expect(get_city_url).to include("https://www.annuaire-des-mairies.com/95/brignancourt.html")
    expect(get_city_url).to include("https://www.annuaire-des-mairies.com/95/longuesse.html")
  end
end


describe "The content of the array of emails :" do
  it "Check if the output is an array" do
    expect(array_of_mails(get_city_url)).to be_an_instance_of(Array)
  end
  it "Check if some mails exists in the array" do
    expect(array_of_mails(get_city_url)).to include("mairie.avernes@orange.fr")
    expect(array_of_mails(get_city_url)).to include("mairie.longuesse@orange.fr")
    expect(array_of_mails(get_city_url)).to include("contact@ville-cergy.fr")
  end
end

describe "The content of the array of names :" do
  it "Check if the output is an array" do
    expect(array_of_names(get_city_url)).to be_an_instance_of(Array)
  end
  it "Check if some cities exists in the array" do
    expect(array_of_names(get_city_url)).to include("Vaureal")
    expect(array_of_names(get_city_url)).to include("Bezons")
    expect(array_of_names(get_city_url)).to include("Mareil-en-france")
  end
end

describe "The content of the array of hash :" do
  it "Check if the output is an array" do
    expect(finalHash(array_of_names(get_city_url), array_of_mails(get_city_url))).to be_an_instance_of(Array)
  end
  it "Check if some cities exists in the array" do
    expect(finalHash(array_of_names(get_city_url), array_of_mails(get_city_url))).to include("Valmondois"=>"mairievalmondois@gmail.com")
  end
end