require 'factory_girl_rails'

RSpec.configure do |config|
  # enables `create :user` instead of `FactoryGirl.create :user`
  config.include FactoryGirl::Syntax::Methods
end
