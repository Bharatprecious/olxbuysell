class MessegesController < ApplicationController
   
    def show
       @messege = Messege.find(params[:id])
    end


    def create
      @messege = Messege.new(messege_params)
      respond_to do |format|
        if @messege.save
          format.html { redirect_to user_room_path(current_user,@messege.room), notice: "" }
          format.json { render :show, status: :created, location: @message }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @messege.errors, status: :unprocessable_entity }
        end
      end
    end

    private
    def messege_params
        params.require(:messege).permit(:content,:user_id,:room_id)
    end
end
