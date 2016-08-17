FactoryGirl.define do
  factory :recipe do
    title {Faker::Name.title}
    description {Faker::Hipster.paragraph}
    user

    after :build do |rec|
      rec.ingredients << FactoryGirl.build(:ingredient, recipe: rec)
      rec.directions << FactoryGirl.build(:direction, recipe: rec)
    end
  end
end
