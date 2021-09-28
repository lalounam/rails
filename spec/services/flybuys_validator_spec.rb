require 'flybuys_validator'

RSpec.describe FlybuysValidator, "#validate" do

  RSpec.shared_examples "valid" do |card_number, expected_result|
    it "for value" do
      expect(FlybuysValidator.validate(card_number)).to eql expected_result
    end
  end

  it_behaves_like "valid", "60141016700078611", "Fly Buys Black: 60141016700078611 (valid)"

  it_behaves_like "valid", "6014152705006141", "Fly Buys Black: 6014152705006141 (invalid)"

  it_behaves_like "valid", "6014111100033006", "Fly Buys Black: 6014111100033006 (valid)"

  it_behaves_like "valid", "6014709045001234", "Fly Buys Blue: 6014709045001234 (valid)"

  it_behaves_like "valid", "6014352700000140", "Fly Buys Red: 6014352700000140 (valid)"

  it_behaves_like "valid", "6014355526000020", "Fly Buys Green: 6014355526000020 (valid)"

  # Originally "6014 3555 2900 0028"
  it_behaves_like "valid", "6014 3555 2600 0028", "Fly Buys Green: 6014355526000028 (invalid)"

  it_behaves_like "valid", "6013111111111111", "Unknown: 6013111111111111 (invalid)"
end
