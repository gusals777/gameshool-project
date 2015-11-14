class GamePageController < ApplicationController
    def main
        @teamlists_fifa = TeamlistFifa.all
        @teamlists_lol = TeamlistLol.all
        @teamlists_hearthstone = TeamlistHearthstone.all
        
        @whichgame_lol = Whichgame.all
          @whichgame_fifa = WhichgameFifa.all
          @whichgame_hearthstone = WhichgameHearthstone.all
          
        # @a = WhichgameFifa.where "DATE(created_at) = DATE(?)", Time.now
        
        @today_lol_matching = Whichgame.where("created_at >= ? and created_at <= ?", Time.now.beginning_of_day, Time.now.end_of_day)
        @today_fifa_matching = WhichgameFifa.where("created_at >= ? and created_at <= ?", Time.now.beginning_of_day, Time.now.end_of_day)
        @today_hearthstone_matching = WhichgameHearthstone.where("created_at >= ? and created_at <= ?", Time.now.beginning_of_day, Time.now.end_of_day) 
        # @a = WhichgameFifa.where("created_at <= ?", Time.now.beginning_of_day)
        
        render layout: false
    end
    
    def main2
        
        @teamlists_fifa = TeamlistFifa.all
        @teamlists_lol = TeamlistLol.all
        @teamlists_hearthstone = TeamlistHearthstone.all
        
        @whichgame_lol = Whichgame.all
          @whichgame_fifa = WhichgameFifa.all
          @whichgame_hearthstone = WhichgameHearthstone.all
          
        # @a = WhichgameFifa.where "DATE(created_at) = DATE(?)", Time.now
        
        @today_lol_matching = Whichgame.where("created_at >= ? and created_at <= ?", Time.now.beginning_of_day, Time.now.end_of_day)
        @today_fifa_matching = WhichgameFifa.where("created_at >= ? and created_at <= ?", Time.now.beginning_of_day, Time.now.end_of_day)
        @today_hearthstone_matching = WhichgameHearthstone.where("created_at >= ? and created_at <= ?", Time.now.beginning_of_day, Time.now.end_of_day) 
        # @a = WhichgameFifa.where("created_at <= ?", Time.now.beginning_of_day)
        
        render layout: false
    end
end
