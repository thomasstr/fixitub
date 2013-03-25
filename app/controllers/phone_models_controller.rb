class PhoneModelsController < ApplicationController
  # GET /phone_models
  # GET /phone_models.json
  def index
    @phone_models = PhoneModel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phone_models }
    end
  end

  # GET /phone_models/1
  # GET /phone_models/1.json
  def show
    @phone_model = PhoneModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phone_model }
    end
  end

  # GET /phone_models/new
  # GET /phone_models/new.json
  def new
    @phone_model = PhoneModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phone_model }
    end
  end

  # GET /phone_models/1/edit
  def edit
    @phone_model = PhoneModel.find(params[:id])
  end

  # POST /phone_models
  # POST /phone_models.json
  def create
    @phone_model = PhoneModel.new(params[:phone_model])

    respond_to do |format|
      if @phone_model.save
        format.html { redirect_to @phone_model, notice: 'Phone model was successfully created.' }
        format.json { render json: @phone_model, status: :created, location: @phone_model }
      else
        format.html { render action: "new" }
        format.json { render json: @phone_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /phone_models/1
  # PUT /phone_models/1.json
  def update
    @phone_model = PhoneModel.find(params[:id])

    respond_to do |format|
      if @phone_model.update_attributes(params[:phone_model])
        format.html { redirect_to @phone_model, notice: 'Phone model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phone_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_models/1
  # DELETE /phone_models/1.json
  def destroy
    @phone_model = PhoneModel.find(params[:id])
    @phone_model.destroy

    respond_to do |format|
      format.html { redirect_to phone_models_url }
      format.json { head :no_content }
    end
  end
end
