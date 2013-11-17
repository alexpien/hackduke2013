class LikesController < ApplicationController
      before_action :signed_in

    def stash
        uid=current_user.id
        sid=params[:stash_id]
        stash=Stash.find(sid)

        result=StashLike.where(user_id: uid, stash_id: sid)
        if result.length>0:
            result.destroy
            stash.count-=1
        else
            StashLike.create(user_id: uid, stash_id: sid)
            stash.count+=1
        end
        stash.save
        @json={}
        @json["count"]=Stash.find(sid).score
        render json: @result
    end
end
