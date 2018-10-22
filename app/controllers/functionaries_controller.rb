class FunctionariesController < ApplicationController
  before_action :set_functionary, only: [:show, :edit, :update, :destroy]
  before_action :lists_selects, only: [:edit, :create, :new, :update]
  
  #Cancancan
  load_and_authorize_resource

  #Ex:- :default =>''
  # GET /functionaries
  # GET /functionaries.json
  def index
    @functionaries = Functionary.with_functionary(current_user).page params[:page]
  end

  # GET /functionaries/1
  # GET /functionaries/1.json
  def show
  end

  # GET /functionaries/new
  def new
    @functionary = Functionary.new
    @functionary.build_user
  end

  # GET /functionaries/1/edit
  def edit
  end

  # POST /functionaries
  # POST /functionaries.json
  def create
    @functionary = Functionary.new(functionary_params)
    respond_to do |format|
      if @functionary.save
        format.html { redirect_to @functionary, notice: 'Functionary was successfully created.' }
        format.json { render :show, status: :created, location: @functionary }
      else
        format.html { render :new }
        format.json { render json: @functionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /functionaries/1
  # PATCH/PUT /functionaries/1.json
  def update
    respond_to do |format|
      if @functionary.update(functionary_params)
        format.html { redirect_to @functionary, notice: 'Functionary was successfully updated.' }
        format.json { render :show, status: :ok, location: @functionary }
      else
        format.html { render :edit }
        format.json { render json: @functionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /functionaries/1
  # DELETE /functionaries/1.json
  def destroy
    @functionary.destroy
    respond_to do |format|
      format.html { redirect_to functionaries_url, notice: 'Functionary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_functionary
      @functionary = Functionary.find(params[:id])
      #find_by(:user => current_user)
    end

    def lists_selects
      @list_leaders = Functionary.where(function:  :leader).order(:name).select(:id, :name)
    end
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def functionary_params
      params.require(:functionary).permit(
        :matriculation, :name, :function, :active, :leader, 
        :user_attributes => [:id, :email, :password, :password_confirmation]
      ) 
    end
end
