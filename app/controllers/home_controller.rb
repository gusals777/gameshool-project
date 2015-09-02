class HomeController < ApplicationController
    def index
        
         
    end
    
    def participation
        render layout: false
    end
    
    def participation_process
        
        @one_apply = GameApply.new
        @one_apply.name = params[:name]
        @one_apply.major = params[:major]
        @one_apply.hakbun = params[:hakbun]
        @one_apply.kakao = params[:kakao]
        @one_apply.email = params[:email]
        @one_apply.phone_num = params[:phone_num]
        @one_apply.game = params[:game]
        @one_apply.team_name = params[:team_name]
        @one_apply.save
        
        redirect_to :back
    end
    
    def apply_list
        @select_game = params[:select_game]
        
        if @select_game.nil? || @select_game == "all"
            @user_list = GameApply.all
        else
            @user_list = GameApply.where(:game => @select_game)
        end
        
        render  layout: false
    end
    
    def apply_process
        
        redirect_to action: "apply_list", select_game: params[:select_game]
        
    end
end
