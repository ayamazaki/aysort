class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
  # before_action :correct_user,   only: :destroy


def new
@micropost = Micropost.new
end


	def show
    @user = User.find(params[:id])
    @micropost = @user.microposts.paginate(page: params[:page])
  end

def create
    @micropost = current_person.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to controller: 'people', action: 'show',id: current_person.id
    else
      redirect_to controller: 'people', action: 'show',id: current_person.id
    end
  end


def update
  @micropost = current_person.microposts.find_by(id: params[:id])
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to controller: 'people', action: 'show',id: current_person.id}
        # format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @current_person }
      else
        format.html { render :edit }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    # @microposts = Micropost.all
    @micropost = current_person.microposts.find_by(id: params[:id])
     @microposts = current_person.microposts if logged_in?
     @time= Time.now
  end



  def destroy
    @micropost = current_person.microposts.find_by(id: params[:id])
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end



  private

    def micropost_params
      params.require(:micropost).permit(:question,:answer,:value1,:value2,:value3)
    end

end
