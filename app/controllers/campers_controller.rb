class CampersController < ApplicationController
  before_action :set_camper, :set_user, only: [:show, :edit, :update, :destroy]
  # GET /campers
  # GET /campers.json
  def index   
    @user = User.find_by(id: session[:user_id])
    @campers = @user.campers
  end

  # GET /campers/1
  # GET /campers/1.json
  def show
  end

  # GET /campers/new
  def new
    @camper = Camper.new()
  end

  # GET /campers/1/edit
  def edit
  end


  # POST /campers
  # POST /campers.json
  def create
    @camper = Camper.new(camper_params)
    @camper.update_attribute(:user_id, id: session[:user_id])
    respond_to do |format|
      if @camper.save
        format.html { redirect_to @camper, notice: 'Camper was successfully created.' }
        format.json { render :show, status: :created, location: @camper }
	#User.find(params[:id]).add_a_camper(@camper)
        User.find_by(id: session[:user_id]).add_a_camper(@camper)
      else
        format.html { render :new }
        format.json { render json: @camper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campers/1
  # PATCH/PUT /campers/1.json
  def update
    respond_to do |format|
      if @camper.update(camper_params)
        format.html { redirect_to @camper, notice: 'Camper was successfully updated.' }
        format.json { render :show, status: :ok, location: @camper }
      else
        format.html { render :edit }
        format.json { render json: @camper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campers/1
  # DELETE /campers/1.json
  def destroy
    @camper.destroy
    respond_to do |format|
      format.html { redirect_to campers_url, notice: 'Camper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camper
      @camper = Camper.find(params[:id])
    end

   def set_user
     #@user = User.find(1)
     @user = User.find_by(id: session[:user_id])
   end
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def camper_params
      params.require(:camper).permit(:name, :age, :gender, :picked_up, :user_id)
    end
end
