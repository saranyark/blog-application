require 'spec_helper'

RSpec.describe "routes for posts", type: :routing do
    it "routes /posts to the posts controller" do
      expect(get("/posts")).to route_to("posts#index")
    end

    it "routes show/posts to the posts controller" do
        expect(get("/posts/1")).to route_to("posts#show",id: "1")
    end

    it "routes new/posts to the posts controller" do
        expect(get("/posts/new")).to route_to("posts#new")
    end
    it "routes create/posts to the posts controller" do
        expect(post("/posts")).to route_to("posts#create")
    end
    it "routes edit/posts to the posts controller" do
        expect(get("/posts/1/edit")).to route_to("posts#edit",id: "1")
    end
    it "routes update/posts to the posts controller" do
        expect(put("/posts/1")).to route_to("posts#update",id: "1")
    end

    it "routes destroy/posts to the posts controller" do
        expect(delete("/posts/1")).to route_to("posts#destroy",id: "1")
    end
  end


  

 

  

  


 