class UsController < ApplicationController
  before_action :set_u, only: [:show, :edit, :update, :destroy]

  # GET /us
  # GET /us.json
  def index
    @us = U.all
    if params[:name].present? 
@us = @us.get_by_name params[:name]
end
if params[:gender].present?
@us = @us.get_by_gender params[:gender]
end
  end

  # GET /us/1
  # GET /us/1.json
  def show
  end

  # GET /us/new
  def new
    @u = U.new
  end

  # GET /us/1/edit
  def edit
  end

  # POST /us
  # POST /us.json
  def create
    @u = U.new(u_params)

    respond_to do |format|
      if @u.save
        format.html { redirect_to @u, notice: 'U was successfully created.' }
        format.json { render :show, status: :created, location: @u }
      else
        format.html { render :new }
        format.json { render json: @u.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /us/1
  # PATCH/PUT /us/1.json
  def update
    respond_to do |format|
      if @u.update(u_params)
        format.html { redirect_to @u, notice: 'U was successfully updated.' }
        format.json { render :show, status: :ok, location: @u }
      else
        format.html { render :edit }
        format.json { render json: @u.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /us/1
  # DELETE /us/1.json
  def destroy
    @u.destroy
    respond_to do |format|
      format.html { redirect_to us_url, notice: 'U was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_u
      @u = U.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def u_params
      params.require(:u).permit(:name, :age, :gender, :birthday, :hometown, :remarks)
    end
end
