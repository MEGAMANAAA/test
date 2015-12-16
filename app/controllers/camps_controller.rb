class CampsController < ApplicationController
  before_action :set_camp, :set_user, only: [:show, :edit, :update, :destroy]

  # GET /camps
  # GET /camps.json
  def index
	  set_camper
    @camps = Camp.where(nil) #create anonymous scope as per http://www.justinweiss.com/articles/search-and-filter-rails-models-without-bloating-your-controller/
    
    #THIS WORKS I JUST TYPE THE SEARCH INTO THE WEB BAR
    filtering_params(params).each do |key, value|
    @camps = @camps.public_send(key, value) if value.present?
  end
  end

  #filtering params for camps
  def filtering_params(params)
    params.slice(:theme, :price, :min_age, :max_age, :am, :weeks)
  end

  # GET /camps/1
  # GET /camps/1.json
  def show
  end

  def register
    camper = Camper.find(params[:camper])
    @camp = Camp.find_by_sql("select * from camps where id = #{params[:camp]}")
    @camp = @camp[0]
    @camp.add_a_camper(camper)
  end

  # GET /camps/new
  def new
    @camp = Camp.new
  end

  # GET /camps/1/edit
  def edit
  end

  # POST /camps
  # POST /camps.json
  def create
    @camp = Camp.new(camp_params)

    respond_to do |format|
      if @camp.save
        format.html { redirect_to @camp, notice: 'Camp was successfully created.' }
        format.json { render :show, status: :created, location: @camp }
      else
        format.html { render :new }
        format.json { render json: @camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camps/1
  # PATCH/PUT /camps/1.json
  def update
    respond_to do |format|
      if @camp.update(camp_params)
        format.html { redirect_to @camp, notice: 'Camp was successfully updated.' }
        format.json { render :show, status: :ok, location: @camp }
      else
        format.html { render :edit }
        format.json { render json: @camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camps/1
  # DELETE /camps/1.json
  def destroy
    @camp.destroy
    respond_to do |format|
      format.html { redirect_to camps_url, notice: 'Camp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp
      @camp = Camp.find(params[:id])
    end

    def set_camper
      @camper = Camper.find(params[:camper])
    end

    def set_user
     @user = @current_user 
   end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camp_params
      params.require(:camp).permit(:name, :theme, :price, :weeks, :am, :min_age, :max_age, :reg_limit, :enrolled)
    end
end
