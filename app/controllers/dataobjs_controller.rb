class DataobjsController < ApplicationController
  before_action :set_dataobj, only: [:show, :edit, :update, :destroy]

  # GET /dataobjs
  # GET /dataobjs.json
  def index
    @dataobjs = Dataobj.all
  end

  # GET /dataobjs/1
  # GET /dataobjs/1.json
  def show
  end

  # GET /dataobjs/new
  def new
    @dataobj = Dataobj.new
  end

  # GET /dataobjs/1/edit
  def edit
  end

  # POST /dataobjs
  # POST /dataobjs.json
  def create
    @dataobj = Dataobj.new(dataobj_params)

    respond_to do |format|
      if @dataobj.save
        format.html { redirect_to @dataobj, notice: 'Dataobj was successfully created.' }
        format.json { render :show, status: :created, location: @dataobj }
      else
        format.html { render :new }
        format.json { render json: @dataobj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dataobjs/1
  # PATCH/PUT /dataobjs/1.json
  def update
    respond_to do |format|
      if @dataobj.update(dataobj_params)
        format.html { redirect_to @dataobj, notice: 'Dataobj was successfully updated.' }
        format.json { render :show, status: :ok, location: @dataobj }
      else
        format.html { render :edit }
        format.json { render json: @dataobj.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dataobjs/1
  # DELETE /dataobjs/1.json
  def destroy
    @dataobj.destroy
    respond_to do |format|
      format.html { redirect_to dataobjs_url, notice: 'Dataobj was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataobj
      @dataobj = Dataobj.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataobj_params
      params.require(:dataobj).permit(:name, :description)
    end
end
