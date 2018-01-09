FactoryBot.define do
  factory :goal do
    title { Faker::HarryPotter.character }
    completed? { false }
    private? { false }
  end
  factory :private_goal do
    title { Faker::HarryPotter.character }
    completed? { true }
    private? { true }
  end
end
