class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def new
        @cat = Cat.new
        render :new
    end
        
      def create
        @artwork = Artwork.new(params.require(:artwork).permit(:title, :img_url, :artist_id))
        # replace the `artwork_attributes_here` with the actual attribute keys
        @artwork.save
    
        if @artwork.save
          render json: @artwork
        else
          render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
      end
    
      def show
        @cat = Cat.find(params[:id])
        render :show
      end
    
      def edit
        @cat = Cat.find(params[:id])
        render :edit
      end

      def update
        @artwork = Artwork.find(params[:id])
    
        if @artwork.update(artwork_params) 
          render json: @artwork
        else
          render json: @artwork.errors.full_messages, status: unprocessable_entity
        end
      end

      private
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :sex, :color, :description)
  end

end
