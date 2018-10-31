class DisplacementsController < ApplicationController
  before_action :set_displacement, only: [:show, :edit, :update, :destroy]
  before_action :lists_selects, only: [:edit, :update, :create, :new]
  
  #Cancancan
  load_and_authorize_resource
  
  # GET /displacements
  # GET /displacements.json
  def index
    if  request.format == "csv"
      @displacements_csv = Displacement.with_displacement(current_user).order(:dateDay, :startHour)
    end
    
    @filterrific = initialize_filterrific(
        Displacement.with_displacement(current_user),
        params[:filterrific],
        select_options: {
          with_project: Displacement::osProjects,
          sorted_by: Displacement.options_for_sorted_by,
          with_functionary_id: Functionary.with_functionary(current_user).options_for_select
        
        },
        default_filter_params: {
          with_dateDay_gte: Date.today,
          with_dateDay_lt: Date.today,
          sorted_by: 'dateDay_desc'
        },
        persistence_id: false,
      ) or return

      @displacements = @filterrific.find.page(params[:page])


      rescue ActiveRecord::RecordNotFound => e
        # There is an issue with the persisted param_set. Reset it.
        puts "Had to reset filterrific params: #{ e.message }"
        redirect_to(reset_filterrific_url(format: :html)) and return
    
    respond_to do |format|
      format.html      
      format.csv { render :csv => @displacements_csv}
    end

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
        format.html { redirect_to @displacement, notice: I18n.t('messages.created_with', item: (Displacement.model_name.human count: 1) )}
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
        format.html { redirect_to @displacement, notice: I18n.t('messages.updated_with', item: (Displacement.model_name.human count: 1)  )}
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
      format.html { redirect_to displacements_url, notice: I18n.t('messages.destroyed_with', item: (Displacement.model_name.human count: 1) )}
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
      params.require(:displacement).permit(:car_id, :functionary_id, :dateDay, :osNumber, :osProject, :startHour, :endHour, :addressSrc_id, :addressDst_id, :kmStart, :kmEnd, :kmCount, :annotation, :velocity)
    end
    
    def lists_selects
      @list_addressess = Address.with_address(current_user)
      @list_functionaries = Functionary.with_functionary(current_user)
      @list_cars = Car.with_car(current_user)
    end
   
end
