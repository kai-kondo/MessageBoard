class MessagesController < ApplicationController
    def index
      @messages = Message.all  
    end
    
    def show
        @message = Message.find(params[:id])
    end
    
    def new
        @message = Message.new
    end
    
    def create
        @message = Message.new(message_params)
        
        if @message.save
          flash[:success] = 'Meesageが正常に投稿されました'
        else
          flash.now[:danger] = 'Messageが投稿されませんでした'
          render :new
        end
    end
    
    def edit
        @message = Message.find(params[:id])
    end
    
    def update
      @message = Message.find(params[:id])
      
      if @message.update(message_params)
        flash[:success] = 'Messageは正常に更新されました'
        redirect_to @message
      else
        flash.now[:danger] = 'Messageは更新されませんでした'
        render :edit
      end
    end
    
    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        
        flash[:success]  = 'Messageは正常に削除されました'
        redirect_to message_url
    end
end
