class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], prototype_id: comment_params[:prototype_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to prototype_path(params[:prototype_id]), notice: "コメントを送信しました"  }
      format.json
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to prototype_path(params[:prototype_id]), notice: "コメントを削除しました"  }
        format.json
      end
    end
  end

  private
  def comment_params
    params.permit(:text, :prototype_id)
  end
end
