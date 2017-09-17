FactoryGirl.define do
  factory :nation do
    name 'Vietnam'
    code 'VN'

    initialize_with { Nation.find_or_create_by(name: name, code: code) }
  end
end