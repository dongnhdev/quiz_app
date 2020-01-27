require 'bundler'
Bundler.require

set :questions, JSON.parse(File.read('./final.json'))

get '/' do
  erb :index
end

get '/random' do
  questions = settings.questions
  @random_chapter = (1..12).to_a.sample
  @random_question = questions[@random_chapter.to_s].sample
  @correct_index = @random_question['answer'].match(/\d+\.\s+(\w)/).captures.first.upcase.ord - "A".ord + 1
  erb :random
end

get '/full' do
  erb :full
end

get '/by_chapter' do
  @questions = settings.questions
  erb :by_chapter
end

get '/by_chapter/:id' do
  @questions = settings.questions[params[:id]]
  erb :chapter
end