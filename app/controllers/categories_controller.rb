class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  layout 'dashboards'

  def index
    @users = User.all
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = current_user.categories.new
  end

  def edit
  end

  def create
    @category = current_user.categories.build(category_params)
    @category.user_id = current_user.id

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: _('Category was successfully created') }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: _('Category was successfully updated') }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: _('Category was successfully destroyed') }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
      unless @category = current_user.categories.where(id: params[:id]).first
        flash[:alert] = _('Category not found')
        redirect_to root_url
      end
    end

    def category_params
      params.require(:category).permit(
        :user_id,
        :name,
        :description,
        :displayed
      )
    end
end
