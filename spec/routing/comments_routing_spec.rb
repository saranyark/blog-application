require 'spec_helper'

RSpec.describe "routes for Comments", type: :routing do
    it "routes /comments to the comments controller" do
      expect(get("/posts/1/comments")).to route_to("comments#index",post_id: "1")
    end

    it "routes show/comments to the comments controller" do
        expect(get("/posts/1/comments/1")).to route_to("comments#show",post_id: "1",id: "1")
    end

    it "routes new/ comments to the  comments controller" do
        expect(get("/posts/1/comments/new")).to route_to("comments#new",post_id: "1")
    end
    it "routes create/comments to the comments controller" do
        expect(post("/posts/1/comments")).to route_to("comments#create",post_id: "1")
    end
 
   
    it "routes destroy/comments to the comments controller" do
        expect(delete("/posts/1/comments/1")).to route_to("comments#destroy",post_id: "1",id: "1")
    end
  end


  

 

  

  


 