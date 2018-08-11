class DisplacementsController < ApplicationController
  before_action :set_displacement, only: [:show, :edit, :update, :destroy]
  before_action :lists_selects, only: [:edit, :update, :create, :new]
  
  
  # GET /displacements
  # GET /displacements.json
  def index
    @displacements = Displacement.order(dateDay: :desc, startHour: :desc).page params[:page]
  end

  # GET /displacements/1
  # GET /displacements/1.json
  def show
  end

  # GET /displacements/new
  def new
    @displacement = Displacement.new
  end

  # GET /displacements/1/edit
  def edit
  end

  # POST /displacements
  # POST /displacements.json
  def create
    @displacement = Displacement.new(displacement_params)

    respond_to do |format|
      if @displacement.save
        format.html { redirect_to @displacement, notice: 'Displacement was successfully created.' }
        format.json { render :show, status: :created, location: @displacement }
      else
        format.html { render :new }
        format.json { render json: @displacement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /displacements/1
  # PATCH/PUT /displacements/1.json
  def update
    respond_to do |format|
      if @displacement.update(displacement_params)
        format.html { redirect_to @displacement, notice: 'Displacement was successfully updated.' }
        format.json { render :show, status: :ok, location: @displacement }
      else
        format.html { render :edit }
        format.json { render json: @displacement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /displacements/1
  # DELETE /displacements/1.json
  def destroy
    @displacement.destroy
    respond_to do |format|
      format.html { redirect_to displacements_url, notice: 'Displacement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_displacement
      @displacement = Displacement.find(params[:id])      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def displacement_params
      params.require(:displacement).permit(:car_id, :functionary_id, :dateDay, :osNumber, :osProject, :startHour, :endHour, :addressSrc_id, :addressDst_id, :kmStart, :kmEnd, :kmCount, :annotation)
    end
    
    def lists_selects
        @list_addressess = Address.all.order(:description)
        @list_functionaries = Functionary.all.order(:name)
        @list_cars = Car.all
    end
end
