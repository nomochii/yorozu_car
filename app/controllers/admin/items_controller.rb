class Admin::ItemsController < ApplicationController
  def new
    
  end

  def create
    
  end

  def index
    
  end


  def edit
    
  end

  def show
    
  end

  def destroy
    
  end

  def update
    
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :product_name, :introduction, :price)
  end
end

