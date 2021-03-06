class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :destroy, :edit, :update]

  def index
    @prototypes = Prototype.all.order("created_at DESC").page(params[:page]).per(4)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
    if @prototype.save
      redirect_to action: :create, notice: '新規投稿が完了しました。'
    else
      render :new
    end
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: :new }), alert: 'New prototype was unsuccessfully created'
     end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)
  end

  def destroy
   if @prototype.user_id == current_user.id
     @prototype.destroy
   end
  end

  def edit
    # @prototype = Prototype.find(params[:id])
  end

  def update
    if @prototype.user_id == current_user.id
      @prototype.update(prototype_params)
      redirect_to action: :show
    end
  end


  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status]
    )
  end
end
