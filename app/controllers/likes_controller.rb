class LikesController < ApplicationController
      before_action :signed_in

    def stash
        uid=current_user.id
        sid=params[:stash_id]
        stash=Stash.find(sid)

        result=StashLike.where(user_id: uid, stash_id: sid)
        if result.length>0
            result[0].destroy
            stash.score-=1
        else
            StashLike.create(user_id: uid, stash_id: sid)
            stash.score+=1
        end
        stash.save
        response={}
        response["score"]=Stash.find(sid).score
        render json: response
    end
end
