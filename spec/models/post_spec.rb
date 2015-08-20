require "rails_helper"

RSpec.describe Post, :type => :model do
  it "creates a post" do
    gorillas = Post.create!(title: nil, body: "Gorillas are huge and eat bananas.")

    expect(gorillas.title).to eq(nil)
    expect(gorillas.body).to eq('Gorillas are huge and eat bananas.')
  end
end
