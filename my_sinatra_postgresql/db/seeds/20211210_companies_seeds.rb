Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
 def run
   puts 'Start truncate for all models'
   DB[:applies].truncate(cascade: true, restart: true)
   DB[:geeks].truncate(cascade: true, restart: true)
   DB[:jobs].truncate(cascade: true, restart: true)
   DB[:companies].truncate(cascade: true, restart: true)
   puts 'Models truncated'

   DB[:companies].insert(name:'MoGo', location: 'New York')
   DB[:companies].insert(name: 'Wirkkle', location: 'London')
   DB[:companies].insert(name:'Artesis', location: 'Saint-Petersburg')
   DB[:companies].insert(name:'BuildEmpire', location: 'London')
 end
end
