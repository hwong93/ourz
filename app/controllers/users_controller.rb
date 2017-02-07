class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :require_login, only: [:show, :edit, :update]


  def index

    @following_post = current_user.following_posts(current_user)

    @like_post_array = []

    current_user.likes.each do |like|
      @like_post_array << like.post_id
    end

  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)


      if @user.save
        auto_login(@user)

        redirect_to :users, notice: 'Signed Up';
        # redirect_to(:users, notice: 'User was successfully created')
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
      else
        render :new;
      end

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :bio, :email, :password, :password_confirmation, :profile_pic)
    end

    # def category_param
    #   params.require(:user)
    # end
    #
end
