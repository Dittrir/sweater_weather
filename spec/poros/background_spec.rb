require 'rails_helper'

RSpec.describe Background do
  it 'exists' do
      attributes = {
                     :total=>4026,
                     :total_pages=>403,
                     :results=>
                      [{:id=>"ZMsQN8MJNK4",
                        :created_at=>"2020-10-06T01:37:35-04:00",
                        :updated_at=>"2022-03-08T06:17:23-05:00",
                        :promoted_at=>nil,
                        :width=>3933,
                        :height=>2627,
                        :color=>"#260c0c",
                        :blur_hash=>"L13uQER*0fxbt6oeRlNHIVt7-oI:",
                        :description=>"Treehouse",
                        :alt_description=>"woman in red and white plaid dress shirt standing on brown wooden bridge",
                        :urls=>
                         {:raw=>
                           "https://images.unsplash.com/photo-1601961782438-9d442fa2f450?ixid=MnwzMDc2NDF8MHwxfHNlYXJjaHwxfHxCZWxsaW5naGFtJTJDJTIwV0F8ZW58MHx8fHwxNjQ2NzU2ODAz&ixlib=rb-1.2.1",
                          :thumb=>
                           "https://images.unsplash.com/photo-1601961782438-9d442fa2f450?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDc2NDF8MHwxfHNlYXJjaHwxfHxCZWxsaW5naGFtJTJDJTIwV0F8ZW58MHx8fHwxNjQ2NzU2ODAz&ixlib=rb-1.2.1&q=80&w=200",
                          :small_s3=>"https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1601961782438-9d442fa2f450"},
                        :user=>
                         {:id=>"dg4S8j5TzmE",
                          :name=>"Karsten Winegeart",
                          :first_name=>"Karsten",
                          :last_name=>"Winegeart",
                          :twitter_username=>"karsten116",
                          :portfolio_url=>nil,
                          :bio=>"IG - @karsten116",
                          :location=>"Austin Texas"}}]
                    }
      location = "Bellingham, WA"

      background = Background.new(attributes, location)

      image = {
                 :location=>"Bellingham, WA",
                 :image_url=>"https://images.unsplash.com/photo-1601961782438-9d442fa2f450?ixid=MnwzMDc2NDF8MHwxfHNlYXJjaHwxfHxCZWxsaW5naGFtJTJDJTIwV0F8ZW58MHx8fHwxNjQ2NzU2ODAz&ixlib=rb-1.2.1",
                 :credit=>{:source=>"unsplash.com",
                           :author=>"Karsten Winegeart",
                           :logo=>"https://images.unsplash.com/photo-1601961782438-9d442fa2f450?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDc2NDF8MHwxfHNlYXJjaHwxfHxCZWxsaW5naGFtJTJDJTIwV0F8ZW58MHx8fHwxNjQ2NzU2ODAz&ixlib=rb-1.2.1&q=80&w=200"}
              }

      image_url = "https://images.unsplash.com/photo-1601961782438-9d442fa2f450?ixid=MnwzMDc2NDF8MHwxfHNlYXJjaHwxfHxCZWxsaW5naGFtJTJDJTIwV0F8ZW58MHx8fHwxNjQ2NzU2ODAz&ixlib=rb-1.2.1"

      credit = {
                :source=>"unsplash.com",
                :author=>"Karsten Winegeart",
                :logo=> "https://images.unsplash.com/photo-1601961782438-9d442fa2f450?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMDc2NDF8MHwxfHNlYXJjaHwxfHxCZWxsaW5naGFtJTJDJTIwV0F8ZW58MHx8fHwxNjQ2NzU2ODAz&ixlib=rb-1.2.1&q=80&w=200"
              }

      expect(background).to be_an_instance_of(Background)
      expect(background.id).to eq(nil)
      expect(background.image).to eq(image)
      expect(background.location).to eq(location)
      expect(background.image_url).to eq(image_url)
      expect(background.credit).to eq(credit)
  end
end
