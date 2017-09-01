class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    # @users = User.all
    @users = User.order(:value1).order(:value2)
    @time = Time.now
    @time2 = Time.now
    # @time3=((Time.now - @user.updated_at)/3600).round(1)
    @time4 = Time.now.ago(7.days)

    if params[:name].present? 
    @users = @users.get_by_name params[:name]
    end
    if params[:value1].present?
    @users = @users.get_by_value1 params[:value1]
    end
    if params[:value5].present?
    @users = User.where('? >= value2',params[:value5])
    end
    if params[:value6].present? 
    @users = @users.where('? == value1',params[:value6]).get_by_value3 params[:value6]
    end

  end

  # def ph1
  #   @users = User.where('value3 >= ?',params[:value3])
  #   render 'users/index'
  # end

  def index2
  @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def help
  end

  def ph1
    @users = User.all.where('value3 >= 168')
  end


  # GET /users/new
  def new
    @user = User.new
    @users = User.all

  end

  # GET /users/1/edit
  def edit
    @users = User.all
  end

  # POST /users
  # POST /users.json

  def create
    @user = User.new(user_params)
    @time = Time.now.to_s
    @users = User.all

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new , notice: 'User was unsuccessfully created.'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url}
        # format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit , notice: 'User was unsuccessfully updated.'}
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
      params.require(:user).permit(:name, :email, :value1, :value2, :value3)
    end
end
