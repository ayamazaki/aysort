class PeopleController < ApplicationController
  before_action :logged_in_person, only: [:index,:edit, :update,:show]
  before_action :correct_person,   only: [:edit, :update]
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.paginate(page: params[:page])
  end


  # GET /people/1
  # GET /people/1.json
  def show
    @time= Time.now
    @person = Person.find(params[:id])
    @people = Person.find(params[:id])
    @users = User.all
    @micropost = current_person.microposts.build 
    @microposts = @people.microposts.order(:value1).order(:value2)
    @time4 = Time.now.ago(7.days)


    if params[:question].present? 
    @microposts = @people.microposts.get_by_question params[:question]
    end
    if params[:result].present?
    @microposts = @people.microposts.get_by_result params[:result]
    end
    if params[:succession].present?
    @microposts = @people.microposts.get_by_succession params[:succession]
    end
    if params[:past].present?
    @microposts = @people.microposts.where('? >= value2',params[:past])
    end
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save

        log_in @person
        # redirect_to user_url(@user)

        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # ログイン済みユーザーかどうか確認
    def logged_in_person
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_person
      @person = Person.find(params[:id])
      redirect_to(root_url) unless current_person?(@person)
    end

    def admin_person
      redirect_to(root_url) unless current_person.admin?
    end
end
