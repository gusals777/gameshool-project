class Whichgame < ActiveRecord::Base
    
    mount_uploader :lol_victory_image, S3uploaderUploader
    
end
