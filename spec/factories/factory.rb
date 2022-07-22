FactoryBot.define do
    factory :post do
      id {1}
      title {"title"}
      description {"description"}
     
    
    end
    factory :comment do
        id {1}
        body {"comment body"}
        post
      end

      factory :user do
        id {1}
        name {"saranya"}
        lastname {"rk"}
        email {"test123@gmail.com"}
        password {"awdaf"}
        is_admin {1}
      end
end