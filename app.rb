require 'bundler'
Bundler.require

set :questions, JSON.parse(File.read('./final.json'))

get '/' do
  questions = settings.questions
  @random_chapter = (1..18).to_a.sample
  @random_question = questions[@random_chapter.to_s].sample
  @correct_index = @random_question['answer'].match(/\d+\.\s+(\w)/).captures.first.upcase.ord - "A".ord + 1
  erb :index
end