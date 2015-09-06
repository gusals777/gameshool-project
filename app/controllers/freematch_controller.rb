class FreematchController < ApplicationController
    
    def index
        
    end
    
    def add_team
        
    end
    
    def team_list
        
        
        
        @aaa = Teamlist.all
        
    end
    
    def team_list_write
        @teamlists = Teamlist.new
        @teamlists.kind_of_game = params[:radio]
        @teamlists.team_name = params[:team_name]
        @teamlists.member_name = params[:member_name1] + params[:member_name2] + params[:member_name3] + params[:member_name4]
        @teamlists.game_id = params[:leader_game_id] + params[:game_id1] + params[:game_id2] + params[:game_id3] + params[:game_id4]
        @teamlists.tear = params[:leader_tear] + params[:tear1] + params[:tear2] + params[:tear3] + params[:tear4]
        @teamlists.comment = params[:team_comment]
        @teamlists.save
        
        redirect_to '/freematch/team_list'
        
    end
    
 
end
