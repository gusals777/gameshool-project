class WhichgameFifa < ActiveRecord::Base
    
    mount_uploader :fifa_victory_image, S3uploaderUploader
end
