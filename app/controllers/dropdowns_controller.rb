class DropdownsController < ApplicationController
  # GET /dropdowns
  # GET /dropdowns.json
  def index
    @dropdowns= DropDownMaster.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml
    end
  end

  # GET /dropdowns/1
  # GET /dropdowns/1/details.xml
  def show
    dropdown = DropDownMaster.find(params[:id])
    @details=dropdown.fields unless dropdown .nil?
    respond_to do |format|
      format.html # show.html.erb
      format.xml {}
    end
  end

  # GET /dropdowns/new
  # GET /dropdowns/new.json
  def new
    @dropdown = Dropdown.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dropdown }
    end
  end

  # GET /dropdowns/1/edit
  def edit
    @dropdown = Dropdown.find(params[:id])
  end

  # POST /dropdowns
  # POST /dropdowns.json
  def create
    @dropdown = Dropdown.new(params[:dropdown])

    respond_to do |format|
      if @dropdown.save
        format.html { redirect_to @dropdown, notice: 'Dropdown was successfully created.' }
        format.json { render json: @dropdown, status: :created, location: @dropdown }
      else
        format.html { render action: "new" }
        format.json { render json: @dropdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dropdowns/1
  # PUT /dropdowns/1.json
  def update
    @dropdown = Dropdown.find(params[:id])

    respond_to do |format|
      if @dropdown.update_attributes(params[:dropdown])
        format.html { redirect_to @dropdown, notice: 'Dropdown was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @dropdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dropdowns/1
  # DELETE /dropdowns/1.json
  def destroy
    @dropdown = DropDownMaster.find(params[:id])
    @dropdown.fields.delete_all unless @dropdown.fields.nil?
    @dropdown.destroy
    respond_to do |format|
      format.html { redirect_to dropdowns_url }
      format.xml { head :ok }
    end
  end
end
