FactoryBot.define do
  factory :attachment do
    name { "File1" }
    tag_list { ["+music", "-funny"] }
  end
end
