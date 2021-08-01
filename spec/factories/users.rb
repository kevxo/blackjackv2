FactoryBot.define do
  factory :user do
    username { "user123" }
    password { '123' }
    wins { 0 }
    losses { 0 }
  end
end
