FactoryBot.define do

  factory :user do
    name              {"abe"}
    first_name        {"阿部"}
    first_name_yomi   {"アベ"}
    last_name         {"広"}
    last_name_yomi    {"ヒロ"}
    birthday          {"19990121"}
    prefecture        {"r"}
    city              {"v"}
    address           {"d"}
    building          {"f"}
    zipcode           {"1234212"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end