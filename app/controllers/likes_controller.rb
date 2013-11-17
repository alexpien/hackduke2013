class LikesController < ApplicationController
      before_action :signed_in
      
    def stash
        uid=current_user.id
        sid=params[:stash_id]
        result=StashLike.where(user_id: uid, stash_id: sid)
        if result.length>0:
            result.destroy
        else
            StashLike.create(user_id: uid, stash_id: sid)
    end
end
