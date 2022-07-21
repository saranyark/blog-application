FactoryBot.define do
    factory :post do
      id {1}
      title {"title"}
      description {"description"}
     
    
    end
    factory :comment do
        id {2}
        body {"comment body"}
        post

      end
end