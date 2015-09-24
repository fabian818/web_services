class MyActionsController < ApplicationController
  before_action :set_my_action, only: [:show, :edit, :update, :destroy]

  # GET /my_actions
  # GET /my_actions.json
  def index
    @my_actions = MyAction.all
  end

  # GET /my_actions/1
  # GET /my_actions/1.json
  def show
  end

  # GET /my_actions/new
  def new
    @my_action = MyAction.new
    @providers = Provider.all
  end

  # GET /my_actions/1/edit
  def edit
  end

  # POST /my_actions
  # POST /my_actions.json
  def create
    @my_action = MyAction.new(my_action_params)

    respond_to do |format|
      if @my_action.save
        format.html { redirect_to @my_action, notice: 'My action was successfully created.' }
        format.json { render :show, status: :created, location: @my_action }
      else
        format.html { render :new }
        format.json { render json: @my_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_actions/1
  # PATCH/PUT /my_actions/1.json
  def update
    respond_to do |format|
      if @my_action.update(my_action_params)
        format.html { redirect_to @my_action, notice: 'My action was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_action }
      else
        format.html { render :edit }
        format.json { render json: @my_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_actions/1
  # DELETE /my_actions/1.json
  def destroy
    @my_action.destroy
    respond_to do |format|
      format.html { redirect_to my_actions_url, notice: 'My action was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_action
      @my_action = MyAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_action_params
      params.require(:my_action).permit(:name, :url, :active, :provider_id)
    end
end
