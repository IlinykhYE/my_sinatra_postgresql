require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/base'

namespace '/api/v1' do
  get '/jobs' do
    jobs = Job.all
    return collection_to_api(jobs) if params.empty?
    if params['name']
      puts 'name'
      jobs_all = Job.by_name(params['name'])
      if params['place']
        puts 'name + place'
        jobs = jobs_all.by_place(params['place'])
      else
        puts 'name NO place'
        jobs = jobs_all
      end
    else
      if params['place']
        puts 'place'
        jobs = Job.by_location(params['place'])
      end
    end
    collection_to_api(jobs)
  end

  get '/jobs_company/:name' do
    company = Company.where(name: params[:name]).first
    halt(404, { message:'Company Document Not Found', status: 404, params_id: params[:id]}.to_json) unless company
    company_id = company.id
    puts "company id = #{company_id.inspect}"

    jobs = Job.where(company_id: company_id)
    halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless jobs
    # puts "job id = #{job.id.inspect} "
    # puts "job = #{job.values.inspect} "
    collection_to_api(jobs)
  end

  get '/job/:id' do
    job = Job.where(id: params[:id]).first
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) unless job
    puts "job id = #{job.id.inspect} "
    puts "job = #{job.values.inspect} "
    job.values.to_json	# serialization
  end

end
