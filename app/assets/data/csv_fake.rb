countries = %w(China Russia America Mexico Sweden ISIS)
people = %w(Clinton Sanders Ivanka Putin OReilly Obama Trump)
bad = %w(crooked evil corrupt mean terrible stupid dumb awful)
good = %w(great happy good wonderful amazing nice friends)
words = %w(@realdonaldtrump trump great thank my trump2016 america do Hillary all so just me make new makeamericagreatagain people poll get again out vote go no donald very clinton president now like time more watch job support want big Debat say am country @foxnews win one only need up tonight interview back love crook look today did never @cnn many cruz total join said rt why last show media even good than state american let bad see much night does were campaign know obama crowd fail other tomorrow had iowa year talk jeb run really nice work ca enjoy candidate im via speech U.S down rubio deal nation way wow day over report take live bush lead republican call illegal ted must right because border million rally elect keep thing got think against rate amazed come wonder after being use MAGA best gop believe interest better morning carolina soon florida immigrant true @megynkelly politics made stop Hampshire first ohio give done ever into money speak word most won truth politician story)

countries.each do |string|
  p string + ",Country"
end
people.each do |string|
  p string + ",Person"
end
bad.each do |string|
  p string + ",Bad"
end
good.each do |string|
  p string + ",Good"
end
words.each do |string|
  p string + ",Other"
end
