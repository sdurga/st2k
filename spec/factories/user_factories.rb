FactoryGirl.define do
  factory :user do
    sequence(:email)      {|n| "user#{n}@example.com" }
    password "Passw0rd"
    firstname "Shree"
    lastname "Durga"
  


      end

end
