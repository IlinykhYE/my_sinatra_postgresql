Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
 def run
   puts 'Start truncate for all models'
   DB[:applies].truncate(cascade: true, restart: true)
   DB[:geeks].truncate(cascade: true, restart: true)
   DB[:jobs].truncate(cascade: true, restart: true)
   DB[:companies].truncate(cascade: true, restart: true)
   puts 'Models truncated'

   DB[:jobs].insert(job_id: 1, geek_id: 1, read: true, invited: true)
   DB[:jobs].insert(job_id: 1, geek_id: 2, read: false, invited: false)
   DB[:jobs].insert(job_id: 5, geek_id: 5, read: true, invited: false)
   DB[:jobs].insert(job_id: 6, geek_id: 8, read: false, invited: false)
 end
end
