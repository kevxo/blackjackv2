FactoryBot.define do
  factory :user do
    username { "user123" }
    password { '123' }
    wins
    losses
  end
end
