class RoomsController < ApplicationController
    before_action :set_room, only: %i[ show edit destroy ]

      def index
        @rooms = Room.where(user_id: current_user.id).or(Room.where(seconduser_id: current_user.id))
      end
    
  
      def show
        @room = Room.find(params[:id])
        @messege = Messege.new
        @messeges = Messege.where(room_id: @room.id)
      end
  

      def new
        @product = Product.find(params[:product_id])
        @room = Room.new
        @chatroom = Room.find_by(user_id: current_user.id, product_id: @product.id)
        if @chatroom
           flash.now[:error] = "room  already exits"
           redirect_to user_room_path(current_user,@chatroom)
        end
      end
    
      def edit
      end
    
  
      def create
        @product = Product.find(params[:product_id])
        @room = @product.rooms.create(room_params) 
        respond_to do |format|
          if @room.save
            GmailMailer.with(user: current_user).welcome_email.deliver_now
            format.html { redirect_to user_room_path(current_user,@room), notice: "Room was successfully created." }
            format.json { render :show, status: :created, location: @room }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @room.errors, status: :unprocessable_entity }
          end
        end
      end
    
      def destroy
        @room.destroy
        redirect_to user_rooms_path
      end
      
      private
        def set_room
          @room = Room.find(params[:id])
        end
    
        def room_params
          params.require(:room).permit(:name, :user_id, :seconduser_id)
        end
end
