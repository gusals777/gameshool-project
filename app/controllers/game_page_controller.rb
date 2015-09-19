class GamePageController < ApplicationController
    def main
        @teamlists_fifa = TeamlistFifa.all
        @teamlists_lol = TeamlistLol.all
        @teamlists_hearthstone = TeamlistHearthstone.all
        
        render layout: false
    end
end
