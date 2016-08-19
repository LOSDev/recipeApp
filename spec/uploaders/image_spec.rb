require 'rails_helper'
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before(:all) do
    ImageUploader.enable_processing = true
  end

  # Create a new uploader. The model is mocked as the uploading and resizing images does not depend on the model creation.
  before(:each) do
    path_to_file = "app/assets/images/test.png"
    @uploader = ImageUploader.new(FactoryGirl.create(:recipe))
    @uploader.store!(File.open(path_to_file))
  end

  # Disable images processing after executing the examples
  after(:all) do
    ImageUploader.enable_processing = false
  end
  context 'the default version' do
    it 'scales down an image to be no larger than 700 by 700 pixels' do
      expect(@uploader.medium).to be_no_larger_than(700, 700)

    end
  end

  # Testing whether image has the exact dimensions
  context 'the thumb version' do
    it 'scales down an image to be exactly 64 by 64 pixels' do
      expect(@uploader.thumb).to have_dimensions(400, 400)
    end
  end


end
