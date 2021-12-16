Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
 def run
   puts 'Start truncate for all models'
   DB[:applies].truncate(cascade: true, restart: true)
   DB[:geeks].truncate(cascade: true, restart: true)
   DB[:jobs].truncate(cascade: true, restart: true)
   DB[:companies].truncate(cascade: true, restart: true)
   puts 'Models truncated'

   DB[:jobs].insert(name: "Mike", stack: "Sinatra React", resume: true)
   DB[:jobs].insert(name: "Alex", stack: "Ruby React", resume: true)
   DB[:jobs].insert(name: "Martha", stack: "Rails", resume: false)
   DB[:jobs].insert(name: "Juri", stack: "Java", resume: true)
   DB[:jobs].insert(name: "Andrew", stack: "PHP", resume: false)
   DB[:jobs].insert(name: "Nina", stack: "Node", resume: true)
   DB[:jobs].insert(name: "Bob", stack: "Front end", resume: true)
   DB[:jobs].insert(name: "Kate", stack: "PHP", resume: false)
   DB[:jobs].insert(name: "Boris", stack: "Full stack", resume: true)
 end
end
