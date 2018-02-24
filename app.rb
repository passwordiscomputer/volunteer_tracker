require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/volunteer.rb'
require './lib/project.rb'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do
  @project_list = Project.all
  erb(:home)
end

post('/')do
binding.pry
  @project = Project.find(params[:id])
  @project.delete
  @project_list = Project.all
  erb(:home)
end

post('/projects') do
  project = Project.new(params)
  project.save
  @project_list = Project.all
  erb(:projects)
end

get('/projects') do
  @project_list = Project.all
  erb(:projects)
end

get('/volunteers') do
  @project_list = Project.all
  @volunteer_list = Volunteer.all

  erb(:volunteers)
end

post('/volunteers') do
  volunteer = Volunteer.new(params)
  volunteer.save
  @volunteer_list = Volunteer.all
  @project_list = Project.all
  erb(:volunteers)
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id])
  @project_list = Project.all
  @project = Project.find(@volunteer.project_id)
  erb(:volunteer)
end

post('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id])
  @volunteer.update(params)
  @project_list = Project.all
  @project = Project.find(@volunteer.project_id)
  erb(:volunteer)
end

get('/projects/:id') do
  @project = Project.find(params[:id])
  @volunteer_list = @project.volunteers
  erb(:project)
end

post('/projects/:id') do
  @project = Project.find(params[:id])
  @volunteer_list = @project.volunteers
  @project.update(params)
  erb(:project)
end
