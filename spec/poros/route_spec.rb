require 'rails_helper'

RSpec.describe Route do
  it 'exists' do
      attributes = {
                     :boundingBox=>{:lr=>{:lng=>-122.466866, :lat=>45.516018}, :ul=>{:lng=>-122.681427, :lat=>48.754898}},
                     :distance=>261.758,
                     :hasTimedRestriction=>false,
                     :hasAccessRestriction=>false,
                     :time=>15257,
                     :legs=>
                      [{:hasTollRoad=>false,
                        :hasBridge=>true,
                        :destNarrative=>"Proceed to PORTLAND, OR.",
                        :distance=>261.758,
                        :hasTimedRestriction=>false,
                        :origNarrative=>"Go south on I-5 S.",
                        :maneuvers=>
                         [{:distance=>0.208,
                           :streets=>["N Commercial St"],
                           :narrative=>"Start out going south on N Commercial St toward Central Ave.",
                           :etc => "ETC."}]}]
                    }

      route = Route.new(attributes)

      expect(route).to be_an_instance_of(Route)
      expect(route.distance).to eq(261.758)
      expect(route.time).to eq(15257)
  end
end
