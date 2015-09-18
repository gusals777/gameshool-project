class WhichgameHearthstone < ActiveRecord::Base
    
    mount_uploader :hearthstone_victory_image, S3uploaderUploader
    
end
