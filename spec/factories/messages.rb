FactoryGirl.define do

  factory :message do
    body                  Faker::Lorem.sentence
    group_id              3
    user_id               1
    #image                 Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/IMG_5471.jpg'))
     
  end

end
