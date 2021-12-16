Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
 def run
   puts 'Start truncate for all models'
   DB[:applies].truncate(cascade: true, restart: true)
   DB[:geeks].truncate(cascade: true, restart: true)
   DB[:jobs].truncate(cascade: true, restart: true)
   DB[:companies].truncate(cascade: true, restart: true)
   puts 'Models truncated'

   DB[:jobs].insert(name: 'Sinatra React', place: 'Remote', company_id: 1)
   DB[:jobs].insert(name: 'Ruby React', place: 'Contract', company_id: 2)
   DB[:jobs].insert(name: 'React', place: 'Remote', company_id: 3)
   DB[:jobs].insert(name:'Node React', place:'Permanent', company_id:1)
   DB[:jobs].insert(name:'Ruby on Rails', place:'Remote', company_id:4)
   DB[:jobs].insert(name:'Node', place:'Permanent', company_id:4)
   DB[:jobs].insert(name:'Javascript CSS HTML', place:'Permanent', company_id:4)
 end
end
